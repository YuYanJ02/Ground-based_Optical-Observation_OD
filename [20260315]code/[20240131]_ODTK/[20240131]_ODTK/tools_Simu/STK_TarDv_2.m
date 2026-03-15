
%%%%%%%%%%%%%%%%%%%%%%%
%
% 脉冲打靶（第N个节点）
%
% 作者：张晨
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年07月24日
%%%%%%%%%%%%%%%%%%%%%%%

% ----------------------------- manv(tauk) -----------------------------
% 增加manv段
manvTemp = tarSeqTemp.Segments.Insert('eVASegmentTypeManeuver' , 'manv' , '-');

% 选择颜色
manvTemp.Properties.Color = 255;

% 机动类型
manvTemp.SetManeuverType('eVAManeuverTypeImpulsive');

% 机动方向
manvTemp.Maneuver.SetAttitudeControlType('eVAAttitudeControlThrustVector');

% 机动坐标系
manvTemp.Maneuver.AttitudeControl.ThrustAxesName = 'CentralBody/Earth ICRF';

% 脉冲初值
dvGuess = aux.bcmc(iLoop).dv;

% manv赋值
manvTemp.Maneuver.AttitudeControl.DeltaVVector.AssignCartesian(dvGuess(1) , dvGuess(2) , dvGuess(3));

% ----------------- 构造打靶变量 -----------------
% 变量1次打勾
manvTemp.EnableControlParameter('eVAControlManeuverImpulsiveCartesianX');
manvTemp.EnableControlParameter('eVAControlManeuverImpulsiveCartesianY');
manvTemp.EnableControlParameter('eVAControlManeuverImpulsiveCartesianZ');

% 变量2次打勾
CP_dVx_tauk = DC.ControlParameters.GetControlByPaths('manv' , 'ImpulsiveMnvr.Cartesian.X');
CP_dVx_tauk.Enable = 1;
CP_dVx_tauk.Perturbation = aux.perbDv; % km/s
CP_dVx_tauk.MaxStep = aux.maxStepDv; % km/s

CP_dVy_tauk = DC.ControlParameters.GetControlByPaths('manv' , 'ImpulsiveMnvr.Cartesian.Y');
CP_dVy_tauk.Enable = 1;
CP_dVy_tauk.Perturbation = aux.perbDv; % km/s
CP_dVy_tauk.MaxStep = aux.maxStepDv; % km/s

CP_dVz_tauk = DC.ControlParameters.GetControlByPaths('manv' , 'ImpulsiveMnvr.Cartesian.Z');
CP_dVz_tauk.Enable = 1;
CP_dVz_tauk.Perturbation = aux.perbDv; % km/s
CP_dVz_tauk.MaxStep = aux.maxStepDv; % km/s

% ----------------------- 构造打靶约束 -----------------------
% 约束1次打勾
velX = manvTemp.Results.Add('Cartesian Elems/VX');
velX.Name = 'velX_tauk';

% 约束1次打勾
velY = manvTemp.Results.Add('Cartesian Elems/VY');
velY.Name = 'velY_tauk';

% 约束1次打勾
velZ = manvTemp.Results.Add('Cartesian Elems/VZ');
velZ.Name = 'velZ_tauk';

% 约束2次打勾
EC_Vx_tauk = DC.Results.GetResultByPaths('manv' , 'velX_tauk');
EC_Vx_tauk.DesiredValue = aux.bcmc(iLoop).state(4);
EC_Vx_tauk.Enable = 1;
EC_Vx_tauk.Tolerance = aux.consVel;

% 约束2次打勾
EC_Vy_tauk = DC.Results.GetResultByPaths('manv' , 'velY_tauk');
EC_Vy_tauk.DesiredValue = aux.bcmc(iLoop).state(5);
EC_Vy_tauk.Enable = 1;
EC_Vy_tauk.Tolerance = aux.consVel;

% 约束2次打勾
EC_Vz_tauk = DC.Results.GetResultByPaths('manv' , 'velZ_tauk');
EC_Vz_tauk.DesiredValue = aux.bcmc(iLoop).state(6);
EC_Vz_tauk.Enable = 1;
EC_Vz_tauk.Tolerance = aux.consVel;

% 运行打靶
satProp.RunMCS;

if strcmp(DC.Status , 'Converged')
    
    % 应用改变
    tarSeqTemp.ApplyProfiles;
    
    % 修正速度脉冲（km/s）
    dvConverge = manvTemp.Maneuver.AttitudeControl.DeltaVVector.QueryCartesianArray;
    dvConverge = cell2mat(dvConverge);
    
    % --------------------- 显示打靶结果 ------------------
    fprintf(' -------------------- 脉冲打靶 -------------------- \n')
    fprintf('STK: 脉冲打靶收敛！\n');
    fprintf('STK: 标称时刻: %s UTCG \n' , aux.bcmc(iLoop).epoch)
    fprintf('STK: 标称脉冲: %0.4f m/s \n' , norm(dvGuess) * 1e3)
    fprintf('STK: 打靶脉冲: %0.4f m/s \n' , norm(dvConverge) * 1e3)
    
else
    
    % 标识
    aux.conv_IO = 0;
    
    fprintf(' -------------------- 脉冲打靶 -------------------- \n')
    fprintf('STK: 错误！脉冲打靶不收敛！\n');
    
end
