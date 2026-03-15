
%%%%%%%%%%%%%%%%%%%%%%%
%
% 脉冲打靶（第1 ~ N-1个节点）
%
% 作者：张晨
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年07月24日
%%%%%%%%%%%%%%%%%%%%%%%

% ----------------------------- init(tauk) -----------------------------
initTemp = tarSeqTemp.Segments.Insert('eVASegmentTypeInitialState' , 'init' , '-');

% 定义坐标系
initTemp.CoordSystemName = 'CentralBody/Earth ICRF';

% 定义状态类型
initTemp.SetElementType('eVAElementTypeCartesian');

% 状态赋值
initTemp.OrbitEpoch = od_epoch;
initTemp.Element.X = od_state(1);
initTemp.Element.Y = od_state(2);
initTemp.Element.Z = od_state(3);
initTemp.Element.Vx = od_state(4);
initTemp.Element.Vy = od_state(5);
initTemp.Element.Vz = od_state(6);

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

% ----------------------------- prop [tauk, taukp1] -----------------------------
% 添加Prop段
propTemp = tarSeqTemp.Segments.Insert('eVASegmentTypePropagate' , 'prop' , '-');

% 选择颜色
propTemp.Properties.Color = 65535;

% 选择动力学
propTemp.PropagatorName = aux.eqm_name;

% 增加Epoch终止条件
propTemp_epoch = propTemp.StoppingConditions.Add('Epoch');

% 修改Epoch
propTemp_epoch.Properties.Trip = aux.bcmc(iLoop + 1).epoch;

% 取消prop duration
propTemp_duration = propTemp.StoppingConditions.Item('Duration');
propTemp_duration.Active = 0;

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
velX = propTemp.Results.Add('Cartesian Elems/X');
velX.Name = 'posX_taukp1';

% 约束1次打勾
velY = propTemp.Results.Add('Cartesian Elems/Y');
velY.Name = 'posY_taukp1';

% 约束1次打勾
velZ = propTemp.Results.Add('Cartesian Elems/Z');
velZ.Name = 'posZ_taukp1';

% 约束2次打勾
EC_X_taukp1 = DC.Results.GetResultByPaths('prop' , 'posX_taukp1');
EC_X_taukp1.DesiredValue = aux.bcmc(iLoop + 1).state(1);
EC_X_taukp1.Enable = 1;
EC_X_taukp1.Tolerance = aux.consPos;

% 约束2次打勾
EC_Y_taukp1 = DC.Results.GetResultByPaths('prop' , 'posY_taukp1');
EC_Y_taukp1.DesiredValue = aux.bcmc(iLoop + 1).state(2);
EC_Y_taukp1.Enable = 1;
EC_Y_taukp1.Tolerance = aux.consPos;

% 约束2次打勾
EC_Z_taukp1 = DC.Results.GetResultByPaths('prop' , 'posZ_taukp1');
EC_Z_taukp1.DesiredValue = aux.bcmc(iLoop + 1).state(3);
EC_Z_taukp1.Enable = 1;
EC_Z_taukp1.Tolerance = aux.consPos;

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
