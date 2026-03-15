
%%%%%%%%%%%%%%%%%%%%%%%
%
% 连续推力打靶（第1 ~ N-1个节点）
%
% 作者：张晨
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年07月24日
%%%%%%%%%%%%%%%%%%%%%%%

% ----------------------------- manv(tauk) -----------------------------
% 机动类型
manvTemp.SetManeuverType('eVAManeuverTypeFinite');

% 选择动力学
manvTemp.Maneuver.Propagator.PropagatorName = aux.eqm_name;

% 机动方向
manvTemp.Maneuver.SetAttitudeControlType('eVAAttitudeControlThrustVector');

% 机动坐标系
manvTemp.Maneuver.AttitudeControl.ThrustAxesName = 'CentralBody/Earth ICRF';

% 姿态模式
% manvTemp.Maneuver.AttitudeControl.AttitudeUpdate = 'eVAAttitudeUpdateInertialAtIgnition';
manvTemp.Maneuver.AttitudeControl.AttitudeUpdate = 'eVAAttitudeUpdateInertialAtStart';
% manvTemp.Maneuver.AttitudeControl.AttitudeUpdate = 'eVAAttitudeUpdateDuringBurn';

% 推力方向（ICRF）
finiteDir = dvConverge / norm(dvConverge);

% 推力方向
manvTemp.Maneuver.AttitudeControl.ThrustVector.AssignXYZ(finiteDir(1) , finiteDir(2) , finiteDir(3));

% 设置Engine
root.ExecuteCommand('Astrogator */Satellite/DROA SetValue MainSequence.SegmentList.tarSeq.SegmentList.manv.FiniteMnvr.EngineModel MainEngineDROA');

% 中心推进
manvTemp.Maneuver.Propagator.EnableCenterBurn = 1;

% 推力时长初值
% massTemp = aux.DROA.DryMass + aux.DROA.FuleMass;
massTemp = propTemp.FinalState.DryMass + propTemp.FinalState.FuelMass;
manvDurTemp = manvTemp.Maneuver.Propagator.StoppingConditions.Item(0);
manvDurTemp.Properties.Trip = norm(dvConverge) * 1e3 * massTemp / aux.DROA.engine_Thrust;

% 设置推力时间偏差
manvTemp.Maneuver.Propagator.Bias = 0;

% ----------------- 构造打靶变量 -----------------
% 脉冲打靶取消
CP_dVx_tauk.Enable = 0;
CP_dVy_tauk.Enable = 0;
CP_dVz_tauk.Enable = 0;

% 变量1次打勾
manvTemp.EnableControlParameter('eVAControlManeuverFiniteSphericalAz');
manvTemp.EnableControlParameter('eVAControlManeuverFiniteSphericalElev');
manvDurTemp.EnableControlParameter('eVAControlStoppingConditionTripValue');

% 变量2次打勾
CP_AZ_tauk = DC.ControlParameters.GetControlByPaths('manv' , 'FiniteMnvr.Spherical.Azimuth');
CP_AZ_tauk.Enable = 1;
CP_AZ_tauk.Perturbation = aux.perbDeg; % deg
CP_AZ_tauk.MaxStep = aux.maxStepDeg; % deg

CP_EL_tauk = DC.ControlParameters.GetControlByPaths('manv' , 'FiniteMnvr.Spherical.Elevation');
CP_EL_tauk.Enable = 1;
CP_EL_tauk.Perturbation = aux.perbDeg; % deg
CP_EL_tauk.MaxStep = aux.maxStepDeg; % deg

CP_Dur_tauk = DC.ControlParameters.GetControlByPaths('manv' , 'FiniteMnvr.StoppingConditions.Duration.TripValue');
CP_Dur_tauk.Enable = 1;
CP_Dur_tauk.Perturbation = aux.perbDur; % s
CP_Dur_tauk.MaxStep = aux.maxStepDur; % s

% 运行打靶
satProp.RunMCS;

if strcmp(DC.Status , 'Converged')
    
    % 应用改变
    tarSeqTemp.ApplyProfiles;
    
    % 清空打靶轨道
%     satProp.ClearDWCGraphics
    
    % 修正弧段的方向
    [azConverge , elConverge] = manvTemp.Maneuver.AttitudeControl.ThrustVector.QueryRADec;
    
    % 修正弧段的时间
    durConverge = manvTemp.Maneuver.Propagator.StoppingConditions.Item(0).Properties.Trip;
    
    % ----------------------- 显示结果 -----------------------
    fprintf(' -------------------- 连续推力打靶 -------------------- \n')
    fprintf('STK: 连续推力打靶收敛！\n');
    fprintf('STK: 推力开始: %s UTCG \n' , manvTemp.InitialState.epoch)
    fprintf('STK: 推力结束: %s UTCG \n' , manvTemp.FinalState.epoch)
    fprintf('STK: 推力方向: %0.2f deg (AZ)\n' , azConverge)
    fprintf('STK: 推力方向: %0.2f deg (EL)\n' , elConverge)
    fprintf('STK: 推力模式: 中心推进 \n')
    fprintf('STK: 推力时长: %0.2f sec \n' , durConverge)
    
else
    
    % 标识
    aux.conv_IO = 0;
    
    fprintf(' -------------------- 连续推力打靶 -------------------- \n')
    fprintf('STK: 错误！有限推力打靶不收敛！\n');
    
end

% =========== 执行速度脉冲 ===========
azExcute = azConverge + aux.DROA.thrustAttError * unifrnd(-1 , 1); % az方向误差(deg)
elExcute = elConverge + aux.DROA.thrustAttError * unifrnd(-1 , 1); % el方向误差(deg)
durExcute = durConverge * (1 + aux.DROA.thrustDurError * unifrnd(-1 , 1)); % 推力时长误差(s)

% 有限推力开始时间
ftInitialEpoch = manvTemp.InitialState.epoch;

% 有限推力结束时间
ftFinalEpoch = manvTemp.FinalState.epoch;

% =========== 更新速度脉冲 ===========
% 删除打靶
satPropMcs.Remove('tarSeq');

% 增加脉冲
manvName = ['manv_' , num2str(iLoop)];
manvTemp = satPropMcs.Insert('eVASegmentTypeManeuver' , manvName , '-');

% 设置机动类型
manvTemp.SetManeuverType('eVAManeuverTypeFinite');

% 选择动力学
manvTemp.Maneuver.Propagator.PropagatorName = aux.eqm_name;

% 设置颜色
manvTemp.Properties.Color = 255;

% 机动方向
manvTemp.Maneuver.SetAttitudeControlType('eVAAttitudeControlThrustVector');

% 机动坐标系
manvTemp.Maneuver.AttitudeControl.ThrustAxesName = 'CentralBody/Earth ICRF';

% 姿态模式
% manvTemp.Maneuver.AttitudeControl.AttitudeUpdate = 'eVAAttitudeUpdateInertialAtIgnition';
manvTemp.Maneuver.AttitudeControl.AttitudeUpdate = 'eVAAttitudeUpdateInertialAtStart';
% manvTemp.Maneuver.AttitudeControl.AttitudeUpdate = 'eVAAttitudeUpdateDuringBurn';

% 推力方向
manvTemp.Maneuver.AttitudeControl.ThrustVector.AssignRADec(azExcute , elExcute);

% 设置Engine
part1 = 'Astrogator */Satellite/DROA SetValue MainSequence.SegmentList.';
part2 = manvName;
part3 = '.FiniteMnvr.EngineModel MainEngineDROA';
command_name = [part1 , part2 , part3];
root.ExecuteCommand(command_name);

% 设置中心推进
manvTemp.Maneuver.Propagator.EnableCenterBurn = 1;

% 推力时长初值
manvDurTemp = manvTemp.Maneuver.Propagator.StoppingConditions.Item(0);
manvDurTemp.Properties.Trip = durExcute;

% ----------------------- 显示结果 -----------------------
fprintf(' -------------------- 连续推力执行 -------------------- \n')
fprintf('STK: 推力方向: %0.2f deg (AZ)\n' , azExcute)
fprintf('STK: 推力方向: %0.2f deg (EL)\n' , elExcute)
fprintf('STK: 执行时长: %0.2f sec \n' , durExcute)

dd = [];
