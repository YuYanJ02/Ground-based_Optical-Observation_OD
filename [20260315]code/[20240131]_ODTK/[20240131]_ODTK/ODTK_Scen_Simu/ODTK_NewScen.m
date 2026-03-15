
%%%%%%%%%%%%%%%%%%%%%%%
%
% 新建ODTK场景
%
% 作者：张晨
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年07月24日
%%%%%%%%%%%%%%%%%%%%%%%

% 新建文件夹
rmdir([pwd , '\ODTK_scen\'] , 's');
mkdir([pwd , '\ODTK_scen\']);
clc;

% ------------------------ 计算模拟测量数据生成的开始和结束时刻 ------------------------
% X测量噪声
rangeX_BiasSigma = 10; % m
rangeX_WhiteNoiseSigma = 10; % m

% K测量噪声
rangeK_BiasSigma = 1; % m
rangeK_WhiteNoiseSigma = 1; % m

% 地基测定轨仿真
tStep = 30;

% -----------------------------------------------------------
% 卫星编号
DROA_ID = 1001;
DROB_ID = 1002;
DROL_ID = 1003;

% 地面站编号和坐标
KSX_ID = 101;
KSX.Lat = 39.5035280944444;
KSX.Lon = 75.0972887388889;
KSX.Alt = 1.31783;

SYX_ID = 102;
SYX.Lat = 18.3142008611111;
SYX.Lon = 109.312436;
SYX.Alt = 0.04763;

MYX_ID = 103;
MYX.Lat = 40.4516666666667;
MYX.Lon = 116.860277777778;
MYX.Alt = 0.1;

AGX_ID = 104;
AGX.Lat = -54.5094444444444;
AGX.Lon = -67.1155555555555;
AGX.Alt = 0.147;

MYK_ID = 105;
MYK.Lat = 40.4516666666667;
MYK.Lon = 116.860277777778;
MYK.Alt = 0.1;

% ----------------------------- 启动ODTK -----------------------
% 载入文件夹
addpath('C:\Program Files\AGI\ODTK 7\CodeSamples\CrossPlatform\ODTK\matlab\lib');

% 启动Client API
client = Client('localhost' , 9494);

% Get the application root attribute
odtk = client.Root;

%% 新建场景
odtkChildCount = odtk.children.count;

% ensure new scenario
if odtkChildCount > 0
    % close scenario
    odtk.application.deleteObject("", odtk.scenario{0});
    fprintf("Scenario closed.\n");
end

scenario = odtk.application.createObj(odtk, "Scenario", "Simu_and_LS");
fprintf("Scenario created.\n");

% 更新EOP
scenario.EarthDefinition.EOPData.Filename = 'C:\ProgramData\AGI\ODTK 7\DynamicEarthData\EOP-All-v1.1.txt';

% --------------------------- 添加卫星 --------------------------
% 添加DROA
satellite = odtk.application.createObj(scenario, 'Satellite', 'DROA');
fprintf('Satellite "DROA" created.\n');
satellite.MeasurementProcessing.TrackingID = DROA_ID; % TrackingID
satellite.EphemerisGeneration.CoordFrame = 'ICRF'; % 星历坐标系
satellite.ForceModel.Gravity.DegreeAndOrder = 21; % 地球非球型
satellite.ForceModel.Gravity.Tides.SolidTides = 'false'; % 固体潮
satellite.ForceModel.Gravity.Tides.OceanTides = 'false'; % 海洋潮
satellite.ForceModel.Drag.Use = 'No'; % 大气
% satellite.ForceModel.Drag.Model.CD = 2.2;
% satellite.ForceModel.Drag.Model.Area.Set(20 , 'm^2');
satellite.ForceModel.SolarPressure.Use = 'No'; % 光压
% satellite.ForceModel.SolarPressure.Model.Cr = 1;
% satellite.ForceModel.SolarPressure.Model.Area.Set(20 , 'm^2');
satellite.ForceModel.Gravity.ThirdBodies.Settings{0}.GMSource = 'JPL DE'; % 三体引力（默认）
satellite.ForceModel.Gravity.ThirdBodies.Settings{1}.GMSource = 'JPL DE';

% 添加DROB
satellite = odtk.application.createObj(scenario, 'Satellite', 'DROB');
fprintf('Satellite "DROB" created.\n');
satellite.MeasurementProcessing.TrackingID = DROB_ID; % TrackingID
satellite.EphemerisGeneration.CoordFrame = 'ICRF'; % 星历坐标系
satellite.ForceModel.Gravity.DegreeAndOrder = 21; % 地球非球型
satellite.ForceModel.Gravity.Tides.SolidTides = 'false'; % 固体潮
satellite.ForceModel.Gravity.Tides.OceanTides = 'false'; % 海洋潮
satellite.ForceModel.Drag.Use = 'No'; % 大气
% satellite.ForceModel.Drag.Model.CD = 2.2;
% satellite.ForceModel.Drag.Model.Area.Set(20 , 'm^2');
satellite.ForceModel.SolarPressure.Use = 'No'; % 光压
% satellite.ForceModel.SolarPressure.Model.Cr = 1;
% satellite.ForceModel.SolarPressure.Model.Area.Set(20 , 'm^2');
satellite.ForceModel.Gravity.ThirdBodies.Settings{0}.GMSource = 'JPL DE'; % 三体引力（默认）
satellite.ForceModel.Gravity.ThirdBodies.Settings{1}.GMSource = 'JPL DE';

% 添加DROL
satellite = odtk.application.createObj(scenario, 'Satellite', 'DROL');
fprintf('Satellite "DROL" created.\n');
satellite.MeasurementProcessing.TrackingID = DROL_ID; % TrackingID
satellite.EphemerisGeneration.CoordFrame = 'ICRF'; % 星历坐标系
satellite.ForceModel.Gravity.DegreeAndOrder = 21; % 地球非球型
satellite.ForceModel.Gravity.Tides.SolidTides = 'false'; % 固体潮
satellite.ForceModel.Gravity.Tides.OceanTides = 'false'; % 海洋潮
satellite.ForceModel.Drag.Use = 'No'; % 大气
% satellite.ForceModel.Drag.Model.CD = 2.2;
% satellite.ForceModel.Drag.Model.Area.Set(20 , 'm^2');
satellite.ForceModel.SolarPressure.Use = 'No'; % 光压
% satellite.ForceModel.SolarPressure.Model.Cr = 1;
% satellite.ForceModel.SolarPressure.Model.Area.Set(20 , 'm^2');
satellite.ForceModel.Gravity.ThirdBodies.Settings{0}.GMSource = 'JPL DE'; % 三体引力（默认）
satellite.ForceModel.Gravity.ThirdBodies.Settings{1}.GMSource = 'JPL DE';

% % 配置钟差
% satellite.Clock.Settings.Enabled = 'true';
% satellite.Clock.Settings.ClockControls.PhaseBias.Set(5.01295e-05 , 'sec');
% satellite.Clock.Settings.ClockControls.FreqBias = 2.2423e-12;
% satellite.Clock.Settings.ClockControls.AgingBias.Set(1e-09 , 'sec*day^-2');
% satellite.Clock.Settings.ClockControls.A0.Set(7.46807e-23 , 'sec');
% satellite.Clock.Settings.ClockControls.Aminus1 = 0;
% satellite.Clock.Settings.ClockControls.Aminus2.Set(1.00042e-32 , 'sec^-1');
% satellite.Clock.Settings.ClockControls.AgingWN.Set(1e-56 , 'sec^-3');
% satellite.Clock.Settings.ClockUncertainty.Phase_sigma.Set(3e-10 , 'sec');
% satellite.Clock.Settings.ClockUncertainty.Freq_sigma = 3.5e-14;
% satellite.Clock.Settings.ClockUncertainty.Aging_sigma.Set(5e-17 , 'sec*day^-2');

%% ------------------------- 添加地面站 -------------------------
trakSys = odtk.application.createObj(scenario, 'TrackingSystem', 'trakSys');

%% 1) KSX
facility = odtk.application.createObj(trakSys, 'Facility', 'KSX');
fprintf('Facility "KSX" created.\n');
facility.MeasurementProcessing.TrackingID = KSX_ID;

pos = facility.Position.ToGeodetic();
pos.Lat.Set(KSX.Lat, 'deg');
pos.Lon.Set(KSX.Lon, 'deg');
pos.Alt.Set(KSX.Alt, 'km');
facility.Position.Assign(pos);

facility.MinElevation.Set(10 , 'deg');
facility.MaxElevation.Set(90 , 'deg');
facility.OpticalProperties.TargetMustBeLit = 0;
facility.OpticalProperties.PolarExclusion.Set(0 , 'deg');
facility.OpticalProperties.MaxSunElevation.Set(90 , 'deg');
facility.OpticalProperties.MinSunExclusion.Set(0 , 'deg');
facility.OpticalProperties.MinMoonExclusion.Set(0 , 'deg');
facility.OpticalProperties.MaxSolarPhaseAngle.Set(180 , 'deg');

facility.MeasurementStatistics.clear();
facility.MeasurementStatistics.InsertByName('Range');
meas_range = facility.MeasurementStatistics{0};
meas_range.Type.BiasSigma.Set(rangeX_BiasSigma, 'm');
meas_range.Type.WhiteNoiseSigma.Set(rangeX_WhiteNoiseSigma, 'm');

%% 2) SYX
facility = odtk.application.createObj(trakSys, 'Facility', 'SYX');
fprintf('Facility "SYX" created.\n');
facility.MeasurementProcessing.TrackingID = SYX_ID;

pos = facility.Position.ToGeodetic();
pos.Lat.Set(SYX.Lat, 'deg');
pos.Lon.Set(SYX.Lon, 'deg');
pos.Alt.Set(SYX.Alt, 'km');
facility.Position.Assign(pos);

facility.MinElevation.Set(10 , 'deg');
facility.MaxElevation.Set(90 , 'deg');
facility.OpticalProperties.TargetMustBeLit = 0;
facility.OpticalProperties.PolarExclusion.Set(0 , 'deg');
facility.OpticalProperties.MaxSunElevation.Set(90 , 'deg');
facility.OpticalProperties.MinSunExclusion.Set(0 , 'deg');
facility.OpticalProperties.MinMoonExclusion.Set(0 , 'deg');
facility.OpticalProperties.MaxSolarPhaseAngle.Set(180 , 'deg');

facility.MeasurementStatistics.clear();
facility.MeasurementStatistics.InsertByName('Range');
meas_range = facility.MeasurementStatistics{0};
meas_range.Type.BiasSigma.Set(rangeX_BiasSigma, 'm');
meas_range.Type.WhiteNoiseSigma.Set(rangeX_WhiteNoiseSigma, 'm');

%% 3) MYX
facility = odtk.application.createObj(trakSys, 'Facility', 'MYX');
fprintf('Facility "MYX" created.\n');
facility.MeasurementProcessing.TrackingID = MYX_ID;

pos = facility.Position.ToGeodetic();
pos.Lat.Set(MYX.Lat, 'deg');
pos.Lon.Set(MYX.Lon, 'deg');
pos.Alt.Set(MYX.Alt, 'km');
facility.Position.Assign(pos);

facility.MinElevation.Set(10 , 'deg');
facility.MaxElevation.Set(90 , 'deg');
facility.OpticalProperties.TargetMustBeLit = 0;
facility.OpticalProperties.PolarExclusion.Set(0 , 'deg');
facility.OpticalProperties.MaxSunElevation.Set(90 , 'deg');
facility.OpticalProperties.MinSunExclusion.Set(0 , 'deg');
facility.OpticalProperties.MinMoonExclusion.Set(0 , 'deg');
facility.OpticalProperties.MaxSolarPhaseAngle.Set(180 , 'deg');

facility.MeasurementStatistics.clear();
facility.MeasurementStatistics.InsertByName('Range');
meas_range = facility.MeasurementStatistics{0};
meas_range.Type.BiasSigma.Set(rangeX_BiasSigma, 'm');
meas_range.Type.WhiteNoiseSigma.Set(rangeX_WhiteNoiseSigma, 'm');

%% 4) AGX
facility = odtk.application.createObj(trakSys, 'Facility', 'AGX');
fprintf('Facility "AGX" created.\n');
facility.MeasurementProcessing.TrackingID = AGX_ID;

pos = facility.Position.ToGeodetic();
pos.Lat.Set(AGX.Lat, 'deg');
pos.Lon.Set(AGX.Lon, 'deg');
pos.Alt.Set(AGX.Alt, 'km');
facility.Position.Assign(pos);

facility.MinElevation.Set(10 , 'deg');
facility.MaxElevation.Set(90 , 'deg');
facility.OpticalProperties.TargetMustBeLit = 0;
facility.OpticalProperties.PolarExclusion.Set(0 , 'deg');
facility.OpticalProperties.MaxSunElevation.Set(90 , 'deg');
facility.OpticalProperties.MinSunExclusion.Set(0 , 'deg');
facility.OpticalProperties.MinMoonExclusion.Set(0 , 'deg');
facility.OpticalProperties.MaxSolarPhaseAngle.Set(180 , 'deg');

facility.MeasurementStatistics.clear();
facility.MeasurementStatistics.InsertByName('Range');
meas_range = facility.MeasurementStatistics{0};
meas_range.Type.BiasSigma.Set(rangeX_BiasSigma, 'm');
meas_range.Type.WhiteNoiseSigma.Set(rangeX_WhiteNoiseSigma, 'm');

%% MYK
facility = odtk.application.createObj(trakSys, 'Facility', 'MYK');
fprintf('Facility "MYK" created.\n');
facility.MeasurementProcessing.TrackingID = MYK_ID;

pos = facility.Position.ToGeodetic();
pos.Lat.Set(MYK.Lat, 'deg');
pos.Lon.Set(MYK.Lon, 'deg');
pos.Alt.Set(MYK.Alt, 'km');
facility.Position.Assign(pos);

facility.MinElevation.Set(10 , 'deg');
facility.MaxElevation.Set(90 , 'deg');
facility.OpticalProperties.TargetMustBeLit = 0;
facility.OpticalProperties.PolarExclusion.Set(0 , 'deg');
facility.OpticalProperties.MaxSunElevation.Set(90 , 'deg');
facility.OpticalProperties.MinSunExclusion.Set(0 , 'deg');
facility.OpticalProperties.MinMoonExclusion.Set(0 , 'deg');
facility.OpticalProperties.MaxSolarPhaseAngle.Set(180 , 'deg');

facility.MeasurementStatistics.clear();
facility.MeasurementStatistics.InsertByName('Range');
meas_range = facility.MeasurementStatistics{0};
meas_range.Type.BiasSigma.Set(rangeK_BiasSigma, 'm');
meas_range.Type.WhiteNoiseSigma.Set(rangeK_WhiteNoiseSigma, 'm');

%% ----------------------- Simulator_groundX (地基定轨) ----------------------
% 添加仿真器
simulator = odtk.application.createObj(scenario, 'Simulator', 'Simu_groundX');
fprintf('Simulator "Simu_groundX" created.\n');

% 设置卫星
simulator.SatelliteList.clear();
simulator.SatelliteList.InsertByName('DROA');

% 设置测站
simulator.TrackingStrandList.clear();
simulator.TrackingStrandList.Insert('trakSys.KSX - *');
simulator.TrackingStrandList.Insert('trakSys.SYX - *');
simulator.TrackingStrandList.Insert('trakSys.MYX - *');
simulator.TrackingStrandList.Insert('trakSys.AGX - *');

% 测量方式
simulator.MeasTypes.clear();
simulator.MeasTypes.Insert('Range');

% 模拟数据误差项
simulator.ErrorModeling.NoDeviations = 0;
simulator.ErrorModeling.DeviateOrbits = 0;
simulator.ErrorModeling.DeviateDensity = 0;
simulator.ErrorModeling.DeviateBCoeff = 0;
simulator.ErrorModeling.DeviateSolarP = 0;
simulator.ErrorModeling.DeviateTranspDelay = 0;
simulator.ErrorModeling.DeviateRetroDelay = 0;
simulator.ErrorModeling.DeviateMeasBiases = 0;
simulator.ErrorModeling.DeviateTropoBiases = 0;
simulator.ErrorModeling.DeviateManeuvers = 0;
simulator.ErrorModeling.AddProcessNoise = 0;
simulator.ErrorModeling.AddManeuverProcessNoise = 0;
simulator.ErrorModeling.AddMeasWhiteNoise = 1; % 测量白噪声
simulator.ErrorModeling.DeviateStationLocations = 0;
simulator.ErrorModeling.DeviateAntennaLocations = 0;
simulator.ErrorModeling.DeviateClocks = 1; % 钟差
simulator.ErrorModeling.DeviateMeasTimeBias = 0;
simulator.ErrorModeling.DeviateAccelerometers = 0;
simulator.ErrorModeling.DeviateGlobalDensity = 0;
simulator.ErrorModeling.AddGlobalDensityProcessNoise = 0;
simulator.ErrorModeling.DeviateEmpiricalForces = 0;
simulator.ErrorModeling.RandomSeed = 1;

% 设置Strand
newElem = simulator.CustomTrackingIntervals.Schedule.NewElem();
simulator.CustomTrackingIntervals.Schedule.push_back(newElem);
simulator.CustomTrackingIntervals.Schedule{0}.PrimaryObjects.Assign('Specific Satellite');
simulator.CustomTrackingIntervals.Schedule{0}.SelectedObject = scenario.DROA;
simulator.CustomTrackingIntervals.Schedule{0}.Trackers.Assign('Specific Tracker');
simulator.CustomTrackingIntervals.Schedule{0}.SelectedTrackingStrand.Assign('trakSys.KSX - *');
simulator.CustomTrackingIntervals.Schedule{0}.TimeStep.Set(tStep , 'sec');

newElem = simulator.CustomTrackingIntervals.Schedule.NewElem();
simulator.CustomTrackingIntervals.Schedule.push_back(newElem);
simulator.CustomTrackingIntervals.Schedule{1}.PrimaryObjects.Assign('Specific Satellite');
simulator.CustomTrackingIntervals.Schedule{1}.SelectedObject = scenario.DROA;
simulator.CustomTrackingIntervals.Schedule{1}.Trackers.Assign('Specific Tracker');
simulator.CustomTrackingIntervals.Schedule{1}.SelectedTrackingStrand.Assign('trakSys.SYX - *');
simulator.CustomTrackingIntervals.Schedule{1}.TimeStep.Set(tStep , 'sec');

newElem = simulator.CustomTrackingIntervals.Schedule.NewElem();
simulator.CustomTrackingIntervals.Schedule.push_back(newElem);
simulator.CustomTrackingIntervals.Schedule{2}.PrimaryObjects.Assign('Specific Satellite');
simulator.CustomTrackingIntervals.Schedule{2}.SelectedObject = scenario.DROA;
simulator.CustomTrackingIntervals.Schedule{2}.Trackers.Assign('Specific Tracker');
simulator.CustomTrackingIntervals.Schedule{2}.SelectedTrackingStrand.Assign('trakSys.MYX - *');
simulator.CustomTrackingIntervals.Schedule{2}.TimeStep.Set(tStep , 'sec');

newElem = simulator.CustomTrackingIntervals.Schedule.NewElem();
simulator.CustomTrackingIntervals.Schedule.push_back(newElem);
simulator.CustomTrackingIntervals.Schedule{3}.PrimaryObjects.Assign('Specific Satellite');
simulator.CustomTrackingIntervals.Schedule{3}.SelectedObject = scenario.DROA;
simulator.CustomTrackingIntervals.Schedule{3}.Trackers.Assign('Specific Tracker');
simulator.CustomTrackingIntervals.Schedule{3}.SelectedTrackingStrand.Assign('trakSys.AGX - *');
simulator.CustomTrackingIntervals.Schedule{3}.TimeStep.Set(tStep , 'sec');

% ------------------------ 增加Fliter ------------------------
% 滤波器
Filter_groundX = odtk.application.createObj(scenario, 'Filter', 'Filter_groundX');
fprintf('Filter "Filter_groundX" created.\n');

% 指定卫星
Filter_groundX.SatelliteList.clear();
Filter_groundX.SatelliteList.InsertByName('DROA');

% 设置测站
Filter_groundX.TrackerList.clear();
Filter_groundX.TrackerList.Insert('trakSys.KSX');
Filter_groundX.TrackerList.Insert('trakSys.SYX');
Filter_groundX.TrackerList.Insert('trakSys.MYX');
Filter_groundX.TrackerList.Insert('trakSys.AGX');

% 测量类型
Filter_groundX.MeasTypes.clear();
Filter_groundX.MeasTypes.Insert('Range');

% 不输出平滑器数据
Filter_groundX.Output.SmootherData.Generate = 0;

% -----------------------------------------------------------
% 添加LS
LS_groundX = odtk.application.createObj(scenario.DROA, 'LeastSquares', 'LS_groundX');
fprintf('LeastSquares "LS_groundX" created.\n');

% LS添加一行
ls_newElem = LS_groundX.LeastSquares.Stages.NewElem();
LS_groundX.LeastSquares.Stages.push_back(ls_newElem);

% 提取
ls_temp = LS_groundX.LeastSquares.Stages{0};

% 修改迭代次数
ls_temp.MaxIterations = 20;

% 历元控制
LS_groundX.EpochControl.EpochLocation = 'End';

% -----------------------------------------------------------
% 保存场景
odtk.SaveObj(scenario, [pwd , '\odtk\Simu_and_LS.sco'] , true);

fprintf('New Scenario saved.\n');

dd = [];

% ================================

% % 输出文件存放地址
% simulator.Output.DataArchive.Filename = [pwd , '\output\TCDS2_test.simrun'];
% simulator.Output.Measurements.Filename = [pwd , '\output\TCDS2_test.geosc'];

% % -------------------- 配置仿真时间 --------------------
% simulator.ProcessControl.StartTime.Set(tauA , 'UTCG');
% simulator.ProcessControl.StopTime.Set(tauB , 'UTCG');
% simulator.ProcessControl.TimeStep.Set(tStep , 'sec');
% 
% % DROA
% DROA.InitialState.epoch = '14 Jan 2024 18:53:44.445';
% DROA.InitialState.Element.X = -7684.77278263627;
% DROA.InitialState.Element.Y = -3259.69533202126;
% DROA.InitialState.Element.Z = -1440.25609859367;
% DROA.InitialState.Element.Vx = -0.0305231232482877;
% DROA.InitialState.Element.Vy = -8.43094183528151;
% DROA.InitialState.Element.Vz = -4.52606626491919;
% 
% cart = scenario.DROA.OrbitState.ToCartesian();
% cart.Epoch.Set(DROA.InitialState.epoch, 'UTCG');
% cart.CentralBody = 'Earth';
% cart.CoordFrame = 'ICRF';
% cart.XPosition.Set(num2str(DROA.InitialState.Element.X * 1e6), 'mm');
% cart.YPosition.Set(num2str(DROA.InitialState.Element.Y * 1e6), 'mm');
% cart.ZPosition.Set(num2str(DROA.InitialState.Element.Z * 1e6), 'mm');
% cart.XVelocity.Set(num2str(DROA.InitialState.Element.Vx * 1e6), 'mm*sec^-1');
% cart.YVelocity.Set(num2str(DROA.InitialState.Element.Vy * 1e6), 'mm*sec^-1');
% cart.ZVelocity.Set(num2str(DROA.InitialState.Element.Vz * 1e6), 'mm*sec^-1');
% cart = scenario.DROA.OrbitState.Assign(cart);
% 
% % DROB
% DROB.InitialState.epoch = '14 Jan 2024 18:53:44.445';
% DROB.InitialState.Element.X = -7684.77278263627;
% DROB.InitialState.Element.Y = -3259.69533202126;
% DROB.InitialState.Element.Z = -1440.25609859367;
% DROB.InitialState.Element.Vx = -0.0305231232482877;
% DROB.InitialState.Element.Vy = -8.43094183528151;
% DROB.InitialState.Element.Vz = -4.52606626491919;
% 
% cart = scenario.DROB.OrbitState.ToCartesian();
% cart.Epoch.Set(DROB.InitialState.epoch, 'UTCG');
% cart.CentralBody = 'Earth';
% cart.CoordFrame = 'ICRF';
% cart.XPosition.Set(num2str(DROB.InitialState.Element.X * 1e6), 'mm');
% cart.YPosition.Set(num2str(DROB.InitialState.Element.Y * 1e6), 'mm');
% cart.ZPosition.Set(num2str(DROB.InitialState.Element.Z * 1e6), 'mm');
% cart.XVelocity.Set(num2str(DROB.InitialState.Element.Vx * 1e6), 'mm*sec^-1');
% cart.YVelocity.Set(num2str(DROB.InitialState.Element.Vy * 1e6), 'mm*sec^-1');
% cart.ZVelocity.Set(num2str(DROB.InitialState.Element.Vz * 1e6), 'mm*sec^-1');
% cart = scenario.DROB.OrbitState.Assign(cart);

% %% ----------------------- Simulator3 (天基定轨) ----------------------

% dd = [];
% 
% %--------------------------- 运行simulator ---------------------------------
% 
% % 运行simulator
% simulator.go();
% 
% fprintf('Simulator DONE! \n');
% 
% dd = [];
% 
% %% LS 画图
% if plot_simu_IO == 1
%     
%     % ------------------------ 增加Fliter ------------------------
%     % 滤波器
%     Filter1 = odtk.application.createObj(scenario, 'Filter', 'Filter1');
%     fprintf('Filter created.\n');
%     
%     % 修改输出文件名
%     Filter1.Output.DataArchive.Filename = ['C:\Users\chenz\Documents\ODTK 7\DataArchive\' , prop_name , '.filrun'];
%     % Filter1.Output.DataArchive.Filename = ['C:\Users\Administrator\Documents\ODTK 7\DataArchive\' , prop_name , '.filrun'];
%     
%     % 不输出平滑器数据
%     Filter1.Output.SmootherData.Generate = 0;
%     
%     % 运行Filter
%     Filter1.go();
%     
%     % ================================
%     % 清空Products
%     odtk.ProductBuilder.DataProducts.clear();
%     
%     %% -------------------------- 图1 --------------------------
%     % 产品名称
%     product_name = 'Measurement_Times_by_Type';
%     
%     % 新建
%     newElem = odtk.ProductBuilder.DataProducts.NewElem();
%     odtk.ProductBuilder.DataProducts.push_back(newElem);
%     product = odtk.ProductBuilder.DataProducts{odtk.ProductBuilder.DataProducts.count - 1};
%     
%     % 修改名字
%     product.Name.Assign(product_name);
%     
%     % 输出
%     product.Outputs.Style = 'C:\Program Files\AGI\ODTK 7\ODTK\AppData\Styles\Static\Measurement Times by Type.gph';
%     product.Outputs.Display = 1;
%     product.Outputs.Export.Enabled = 0;
%     
%     % 运行Static Product Builder
%     odtk.ProductBuilder.GenerateProduct(product_name);
%     
%     dd = [];
%     
%     %% ------------------------- 图2 --------------------------
%     % 产品名称
%     product_name = 'Residual_with_Bias';
%     
%     % 新建
%     newElem = odtk.ProductBuilder.DataProducts.NewElem();
%     odtk.ProductBuilder.DataProducts.push_back(newElem);
%     product = odtk.ProductBuilder.DataProducts{odtk.ProductBuilder.DataProducts.count - 1};
%     
%     % 修改名字
%     product.Name.Assign(product_name);
%     
%     % 输入
%     newSrc = product.Inputs.DataSources.NewElem();
%     product.Inputs.DataSources.push_back(newSrc);
%     product.Inputs.DataSources{0}.Filename = ['C:\Users\chenz\Documents\ODTK 7\DataArchive\' , prop_name , '.filrun'];
%     %     product.Inputs.DataSources{0}.Filename = ['C:\Users\Administrator\Documents\ODTK 7\DataArchive\' , prop_name , '.filrun'];
%     
%     % 输出
%     product.Outputs.Style = 'C:\Program Files\AGI\ODTK 7\ODTK\AppData\Styles\Static\Residuals with Bias.gph';
%     %     product.Outputs.Style = 'C:\Program Files\AGI\ODTK 7\ODTK\AppData\Styles\Static\Residual Ratios.gph';
%     product.Outputs.Display = 1;
%     product.Outputs.Export.Enabled = 0;
%     
%     % 运行Static Product Builder
%     odtk.ProductBuilder.GenerateProduct(product_name);
%     
%     dd = [];
%     
%     % %% ------------------------- 图3 --------------------------
%     % % 产品名称
%     % product_name = 'Histogram';
%     %
%     % % 新建
%     % newElem = odtk.ProductBuilder.DataProducts.NewElem();
%     % odtk.ProductBuilder.DataProducts.push_back(newElem);
%     % product = odtk.ProductBuilder.DataProducts{odtk.ProductBuilder.DataProducts.count - 1};
%     %
%     % % 修改名字
%     % product.Name.Assign(product_name);
%     %
%     % % 输入
%     % newSrc = product.Inputs.DataSources.NewElem();
%     % product.Inputs.DataSources.push_back(newSrc);
%     % product.Inputs.DataSources{0}.Filename = ['C:\Users\chenz\Documents\ODTK 7\DataArchive\' , prop_name , '.filrun'];
%     % % product.Inputs.DataSources{0}.Filename = ['C:\Users\Administrator\Documents\ODTK 7\DataArchive\' , prop_name , '.filrun'];
%     %
%     % % 输出
%     % product.Outputs.Style = 'C:\Program Files\AGI\ODTK 7\ODTK\AppData\Styles\Static\Histogram.gph';
%     % product.Outputs.Display = 1;
%     % product.Outputs.Export.Enabled = 0;
%     %
%     % % 运行Static Product Builder
%     % odtk.ProductBuilder.GenerateProduct(product_name);
%     
%     dd = [];
%     
%     % %% ------------------------- 图4 --------------------------
%     % % 产品名称
%     % product_name = 'Residual_QQ';
%     %
%     % % 新建
%     % newElem = odtk.ProductBuilder.DataProducts.NewElem();
%     % odtk.ProductBuilder.DataProducts.push_back(newElem);
%     % product = odtk.ProductBuilder.DataProducts{odtk.ProductBuilder.DataProducts.count - 1};
%     %
%     % % 修改名字
%     % product.Name.Assign(product_name);
%     %
%     % % 输入
%     % newSrc = product.Inputs.DataSources.NewElem();
%     % product.Inputs.DataSources.push_back(newSrc);
%     % product.Inputs.DataSources{0}.Filename = ['C:\Users\chenz\Documents\ODTK 7\DataArchive\' , prop_name , '.filrun'];
%     % % product.Inputs.DataSources{0}.Filename = ['C:\Users\Administrator\Documents\ODTK 7\DataArchive\' , prop_name , '.filrun'];
%     %
%     % % 输出
%     % product.Outputs.Style = 'C:\Program Files\AGI\ODTK 7\ODTK\AppData\Styles\Static\Residual Ratio QQ.gph';
%     % product.Outputs.Display = 1;
%     % product.Outputs.Export.Enabled = 0;
%     %
%     % % 运行Static Product Builder
%     % odtk.ProductBuilder.GenerateProduct(product_name);
%     
%     dd = [];
%     
% end
% 
% % %% ----------------------- Simulator1 (时钟比对) ----------------------
% % % 添加仿真器
% % simulator = odtk.application.createObj(scenario, 'Simulator', 'Simulator_clock');
% % fprintf('Simulator "Simulator_clock" created.\n');
% %
% % % 设置卫星
% % simulator.SatelliteList.clear();
% % simulator.SatelliteList.InsertByName('DROA');
% %
% % % 设置测站
% % simulator.TrackingStrandList.clear();
% % simulator.TrackingStrandList.Insert('trakSys.MYK - *');
% %
% % % 测量方式
% % simulator.MeasTypes.clear();
% % simulator.MeasTypes.Insert('Range');
% %
% % % 模拟数据误差项
% % simulator.ErrorModeling.NoDeviations = 0;
% % simulator.ErrorModeling.DeviateOrbits = 0;
% % simulator.ErrorModeling.DeviateDensity = 0;
% % simulator.ErrorModeling.DeviateBCoeff = 0;
% % simulator.ErrorModeling.DeviateSolarP = 0;
% % simulator.ErrorModeling.DeviateTranspDelay = 0;
% % simulator.ErrorModeling.DeviateRetroDelay = 0;
% % simulator.ErrorModeling.DeviateMeasBiases = 0;
% % simulator.ErrorModeling.DeviateTropoBiases = 0;
% % simulator.ErrorModeling.DeviateManeuvers = 0;
% % simulator.ErrorModeling.AddProcessNoise = 0;
% % simulator.ErrorModeling.AddManeuverProcessNoise = 0;
% % simulator.ErrorModeling.AddMeasWhiteNoise = 1; % 测量白噪声
% % simulator.ErrorModeling.DeviateStationLocations = 0;
% % simulator.ErrorModeling.DeviateAntennaLocations = 0;
% % simulator.ErrorModeling.DeviateClocks = 1; % 钟差
% % simulator.ErrorModeling.DeviateMeasTimeBias = 0;
% % simulator.ErrorModeling.DeviateAccelerometers = 0;
% % simulator.ErrorModeling.DeviateGlobalDensity = 0;
% % simulator.ErrorModeling.AddGlobalDensityProcessNoise = 0;
% % simulator.ErrorModeling.DeviateEmpiricalForces = 0;
% % simulator.ErrorModeling.RandomSeed = 1;
% %
% % % 配置仿真时间
% % simulator.ProcessControl.StartTime.Set(tauA , 'UTCG');
% % simulator.ProcessControl.StopTime.Set(tauB , 'UTCG');
% % simulator.ProcessControl.TimeStep.Set(tStep , 'sec');
% %
% % % 设置Strand
% % newElem = simulator.CustomTrackingIntervals.Schedule.NewElem();
% % simulator.CustomTrackingIntervals.Schedule.push_back(newElem);
% % simulator.CustomTrackingIntervals.Schedule{0}.PrimaryObjects.Assign('Specific Satellite');
% % simulator.CustomTrackingIntervals.Schedule{0}.SelectedObject = scenario.DROA;
% % simulator.CustomTrackingIntervals.Schedule{0}.Trackers.Assign('Specific Tracker');
% % simulator.CustomTrackingIntervals.Schedule{0}.SelectedTrackingStrand.Assign('trakSys.MYK - *');
% % simulator.CustomTrackingIntervals.Schedule{0}.TimeStep.Set(tStep , 'sec');
% %
% % % 输出文件存放地址
% % simulator.Output.DataArchive.Filename = [pwd , '\output\TCDS2_test.simrun'];
% % simulator.Output.Measurements.Filename = [pwd , '\output\TCDS2_test.geosc'];
% %
% % % 运行simulator
% % simulator.go();
% %
% % fprintf('Simulator DONE! \n');
