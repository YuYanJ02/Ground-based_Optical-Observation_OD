
%%%%%%%%%%%%%%%%%%%%%%%
%
% 增加Asgtrogator / Init
%
% 作者：张晨
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年07月24日
%%%%%%%%%%%%%%%%%%%%%%%

% 星箭分离点位置和速度误差
XJFL.posErr = 1e-2; % km
XJFL.velErr = 1e-6; % km/s

% 抓取Propagator
satProp = DROA.Propagator;

% 抓取MCS
satPropMcs = satProp.MainSequence;

% 清空MCS
satPropMcs.RemoveAll;

% 添加init段
init_XJFL = satPropMcs.Insert('eVASegmentTypeInitialState' , 'init_XJFL' , '-');

% 定义坐标系
init_XJFL.CoordSystemName = 'CentralBody/Earth ICRF';

% 定义状态类型
init_XJFL.SetElementType('eVAElementTypeCartesian');

% 真实分离点定轨状态
init_XJFL.OrbitEpoch = aux.bcmc(1).epoch;
init_XJFL.Element.X = aux.bcmc(1).state(1) + unifrnd(-XJFL.posErr , XJFL.posErr);
init_XJFL.Element.Y = aux.bcmc(1).state(2) + unifrnd(-XJFL.posErr , XJFL.posErr);
init_XJFL.Element.Z = aux.bcmc(1).state(3) + unifrnd(-XJFL.posErr , XJFL.posErr);
init_XJFL.Element.Vx = aux.bcmc(1).state(4) + unifrnd(-XJFL.velErr , XJFL.velErr);
init_XJFL.Element.Vy = aux.bcmc(1).state(5) + unifrnd(-XJFL.velErr , XJFL.velErr);
init_XJFL.Element.Vz = aux.bcmc(1).state(6) + unifrnd(-XJFL.velErr , XJFL.velErr);

% ------------------- 更新卫星参数 -------------------
init_XJFL.SpacecraftParameters.DryMass = aux.DROA.DryMass;
init_XJFL.FuelTank.FuelMass = aux.DROA.FuleMass;

init_XJFL.SpacecraftParameters.Cd = aux.DROA.Cd;
init_XJFL.SpacecraftParameters.DragArea = aux.DROA.Drag_area;

init_XJFL.SpacecraftParameters.Cr = aux.DROA.Cr;
init_XJFL.SpacecraftParameters.SolarRadiationPressureArea = aux.DROA.SRP_area;

init_XJFL.SpacecraftParameters.Ck = aux.DROA.Ck;
init_XJFL.SpacecraftParameters.RadiationPressureArea = aux.DROA.RP_area;

% 场景更新
scn.Animation.StartTime = aux.bcmc(1).epoch;
root.Rewind;
