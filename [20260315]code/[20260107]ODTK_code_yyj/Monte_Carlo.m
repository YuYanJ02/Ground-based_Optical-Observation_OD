clear ;clc;
%% 读取文件
READ_MPC80('DROB_1026_10.txt','MPC80_DROB_1026_10.txt')
[targets,stations,mag,time] = MPC2TDM('MPC80_DROB_1026_10.txt', 'TDM_DROB_1026_10.tdm');
file_trace = ['D:\keyan\projects\flight_photo\Code\[20260212]OD\[20260107]ODTK_code_yyj\','TDM_DROB_1026_10.tdm'];



%% 开启ODTK
% Make sure ODTK is running with the HTTP server started (default port is 9393)
winopen('MAIN_LaunchODTK-9494-od.cmd')


%% 连接ODTK
% Add the ODTK API library in the search path
addpath('C:\Program Files\AGI\ODTK 7\CodeSamples\CrossPlatform\ODTK\matlab\lib');
client = Client('localhost', 9494);
odtk = client.Root;
odtkChildCount = odtk.children.count;


%% 配置场景
% ensure new scenario
if odtkChildCount > 0
    % close scenario
    odtk.application.deleteObject("", odtk.scenario{0});
    fprintf("Scenario closed.\n");
end
scenario = odtk.application.createObj(odtk, "Scenario", "TestScenario");
fprintf("Scenario created.\n");
scenario.EarthDefinition.EOPData.Filename = 'C:\ProgramData\AGI\ODTK 7\DynamicEarthData\EOP-All-v1.1.txt';
measurementFiles = scenario.Measurements.Files;
fprintf("Measurement files count: %i\n", measurementFiles.count);
% Clear the list
measurementFiles.clear();
% Add a new item to it
ne = measurementFiles.NewElem();
ne.Enabled = true;
ne.FileName = file_trace;
measurementFiles.push_back(ne);
fprintf("Measurement files count: %i\n", measurementFiles.count);
   


%% 配置卫星
satName = "yyj";
mySat = odtk.application.createObj(odtk.scenario{0}, "Satellite", satName);
fprintf('创建卫星: %s\n', satName);

% 设置追踪编号
for satId = 1:length(targets)
    ne = mySat.MeasurementProcessing.TrackingIDAliases.NewElem();
    ne.AliasID = targets{satId};
    mySat.MeasurementProcessing.TrackingIDAliases.push_back(ne);
end

% 设置力学模型
mySat.ForceModel.Gravity.DegreeAndOrder = 70; % 地球非球型
mySat.ForceModel.Gravity.Tides.SolidTides = 'false'; % 固体潮
mySat.ForceModel.Gravity.Tides.OceanTides = 'false'; % 海洋潮
mySat.ForceModel.Drag.Use = 'No'; % 大气
% satellite.ForceModel.Drag.Model.CD = 2.2;
% satellite.ForceModel.Drag.Model.Area.Set(20 , 'm^2');
mySat.ForceModel.SolarPressure.Use = 'No'; % 光压
% satellite.ForceModel.SolarPressure.Model.Cr = 1;
% satellite.ForceModel.SolarPressure.Model.Area.Set(20 , 'm^2');
mySat.ForceModel.Gravity.ThirdBodies.Settings{0}.GMSource = 'JPL DE'; % 三体引力（默认）
mySat.ForceModel.Gravity.ThirdBodies.Settings{1}.GMSource = 'JPL DE';





%% 配置地面测站
%BiasSigma = 1 :0.02 :3;
n = length(1:0.02:3);                % 原样本数 101
sigma = 1.0;                    % 标准差（单位：角秒）
WhiteNoiseSigma = sigma * randn(1, n); % 生成零均值高斯白噪声
Rsigma = zeros(100,1);
Isigma = zeros(100,1);
Csigma = zeros(100,1);
RMSE = zeros(100,1);
BiasNoise = 0.5+0.2 * randn(1, n);

StaNum = length(stations);
trakSys = odtk.application.createObj(odtk.scenario{0}, 'TrackingSystem', 'trakSys');
for StaIdx = 1:StaNum
    StaId = stations{StaIdx};
    [Lon,Lat] = GetStationCoordinates(StaId); % 获取测站位置
    
    facility = odtk.application.createObj(trakSys, 'Facility', StaId);
    facility.MeasurementProcessing.TrackingID = 100+StaIdx;
    ne = facility.MeasurementProcessing.TrackingIDAliases.NewElem();
    ne.AliasID = StaId; % 测站编号
    facility.MeasurementProcessing.TrackingIDAliases.push_back(ne);
    pos = facility.Position.ToGeodetic();
    pos.Lat.Set(Lat, 'deg');
    pos.Lon.Set(Lon, 'deg');
    pos.Alt.Set(1000, 'm');
    facility.Position.Assign(pos);
    pos = facility.Position.ToGeodetic();
    printGeodeticPos(pos);
    
    % 测量值
    RA_BiasSigma = 1;
    RA_WhiteNoiseSigma = 1;
    Dec_BiasSigma = 1;
    Dec_WhiteNoiseSigma = 1;
    facility.MeasurementStatistics.clear();
    facility.MeasurementStatistics.InsertByName('Right Ascension');
    facility.MeasurementStatistics.InsertByName('Declination');
    RA = facility.MeasurementStatistics{0};
    RA.Type.BiasSigma.Set(RA_BiasSigma, 'arcSec');
    RA.Type.WhiteNoiseSigma.Set(RA_WhiteNoiseSigma, 'arcSec');
    Dec = facility.MeasurementStatistics{1};
    Dec.Type.BiasSigma.Set(Dec_BiasSigma, 'arcSec');
    Dec.Type.WhiteNoiseSigma.Set(Dec_WhiteNoiseSigma, 'arcSec');
    % 
    % 观测属性
    facility.OpticalProperties.ReferenceFrame = 'MEME J2000';
    facility.AntennaType = 'Optical';
end





%% 配置最小二乘
LS_Ground = odtk.application.createObj(odtk.scenario{0}.yyj, 'LeastSquares', 'LS_Ground');
fprintf('LeastSquares "LS_Ground" created.\n');

% 添加测站
LS_Ground.TrackerList.clear();
for StaIdx = 1:StaNum
    StaId = stations{StaIdx};
    TrackerName = ['trakSys.',StaId];
    LS_Ground.TrackerList.Insert(TrackerName);
end

% 测量类型
LS_Ground.MeasTypes.clear();
LS_Ground.MeasTypes.Insert('Right Ascension');
LS_Ground.MeasTypes.Insert('Declination');

LS_Ground.Output.STKEphemeris.DuringProcess.Generate = 'true';

LS_Ground.Output.STKEphemeris.Covariance = 'true';

LS_Ground.CombineMeasUncertainty = 'true';



%% 配置滤波器
Filter_Ground = odtk.application.createObj(odtk.scenario{0}, 'Filter', 'Filter1');
fprintf('Filter "Filter_Ground" created.\n');

% 指定卫星
Filter_Ground.SatelliteList.clear();
Filter_Ground.SatelliteList.InsertByName("yyj");

% 添加测站
Filter_Ground.TrackerList.clear();
for StaIdx = 1:StaNum
    StaId = stations{StaIdx};
    TrackerName = ['trakSys.',StaId];
    Filter_Ground.TrackerList.Insert(TrackerName);
end

% 测量类型
Filter_Ground.MeasTypes.clear();
Filter_Ground.MeasTypes.Insert('Right Ascension');
Filter_Ground.MeasTypes.Insert('Declination');

% 不输出平滑器数据
Filter_Ground.Output.SmootherData.Generate = 1;

% 修改输出文件名
prop_name = 'TestScenario';
Filter_Ground.Output.DataArchive.Filename = ['D:\keyan\projects\OD\[20260107]ODTK_code_yyj\ODTK\' , prop_name , '.filrun'];
Filter_Ground.Output.SmootherData.Generate = 1;







%% 配置IOD
IOD_Ground = odtk.application.createObj(odtk.scenario{0}.yyj, 'InitialOrbitDetermination', 'IOD_Ground');
fprintf('InitialOrbitDetermination "IOD_Ground" created.\n');

IOD_Ground.Method.Type = 'GoodingAnglesOnly';% 测量方法

% 添加测站
IOD_Ground.Method.TrackerList.clear();
for StaIdx = 1:StaNum
    StaId = stations{StaIdx};
    TrackerName = ['trakSys.',StaId];
    IOD_Ground.Method.TrackerList.Insert(TrackerName);
end
MeaNum = IOD_Ground.Method.SelectedMeasurements.Choices.count; % 获取观测数据总数

%ls_temp.c.Set('29 Nov 2025 20:04:20.294' , 'UTCG');
%ls_temp.StopTime.Set('30 Dec 2025 00:04:20.294' , 'UTCG');


%% Monte Carlo
facility = odtk.TestScenario.TrackingSystem.trakSys.Facility;
LonDelta = 1 * randn(1, 100);
LatDelta = 1 * randn(1, 100);
for iisigma = 1:100
for StaIdx = 1:StaNum
    StaId = stations{StaIdx};
    % % 噪声标准差 
    % RA_BiasSigma = BiasNoise(iisigma);
    % RA_WhiteNoiseSigma = 0.5;
    % Dec_BiasSigma = BiasNoise(iisigma);
    % Dec_WhiteNoiseSigma = 0.5;
    % facility.(StaId).MeasurementStatistics.clear();
    % facility.(StaId).MeasurementStatistics.InsertByName('Right Ascension');
    % facility.(StaId).MeasurementStatistics.InsertByName('Declination');
    % RA = facility.(StaId).MeasurementStatistics{0};
    % RA.Type.BiasSigma.Set(RA_BiasSigma, 'arcSec');
    % RA.Type.WhiteNoiseSigma.Set(RA_WhiteNoiseSigma, 'arcSec');
    % RA.Type.BiasModel.HalfLife.Set(30, 'min')
    % Dec = facility.(StaId).MeasurementStatistics{1};
    % Dec.Type.BiasSigma.Set(Dec_BiasSigma, 'arcSec');
    % Dec.Type.WhiteNoiseSigma.Set(Dec_WhiteNoiseSigma, 'arcSec');
    % Dec.Type.BiasModel.HalfLife.Set(30, 'min')
    [Lon,Lat] = GetStationCoordinates(StaId); % 获取测站位置
    pos = facility.(StaId).Position.ToGeodetic();
    pos.Lat.Set(Lat+LatDelta(iisigma), 'deg');
    pos.Lon.Set(Lon+LonDelta(iisigma), 'deg');
    pos.Alt.Set(1000, 'm');
    facility.(StaId).Position.Assign(pos);



end





%% IOD找初值使得初始最小二乘收敛
count_ls = 1;
count = 0;
a_LS(1) = 0;
StartIdx = 0;
EndIdx = 1;
IOD = false;
LsRun = false;
while EndIdx < MeaNum-1
    EndIdx = EndIdx + 1; % 添加观测数据
    for i = StartIdx : EndIdx-2
        for j = i+1 : EndIdx-1 
            IOD_Ground.Method.SelectedMeasurements.clear();
            Mea1 = IOD_Ground.Method.SelectedMeasurements.Choices{i};
            Mea2 = IOD_Ground.Method.SelectedMeasurements.Choices{j};
            Mea3 = IOD_Ground.Method.SelectedMeasurements.Choices{EndIdx};
    
            IOD_Ground.Method.SelectedMeasurements.Insert(Mea1);
            IOD_Ground.Method.SelectedMeasurements.Insert(Mea2);
            IOD_Ground.Method.SelectedMeasurements.Insert(Mea3);
            %IOD_Ground.Method.SelectedMeasurements.Insert('000000  28 Nov 2025 00:45:15.034          K19 RaDec     137.7   20.4')
            %IOD_Ground.Method.SelectedMeasurements.Insert('155945  29 Nov 2025 20:04:20.294          D29 RaDec     140.3   19.5')
            %IOD_Ground.Method.SelectedMeasurements.Insert('242267  30 Nov 2025 20:03:01.757          P13 RaDec     141.9   18.8');
            
            selected_count = IOD_Ground.Method.SelectedMeasurements.Count;
            fprintf('已选择 %d 个测量数据\n', selected_count);
            
            IOD_Ground.go();
            kep = IOD_Ground.Output.OrbitState.ToKeplerian();
            %printKeplerianOrbitState(kep);
            a_IOD = kep.SemiMajorAxis.GetIn("km");
            
            % 运行LS
            if a_IOD ~= 0
                fprintf('IOD定轨成功！\n');
                IOD = true;
                IOD_Ground.transfer();
               % LS添加Stage
                LS_Ground.Stages.clear();
                ls_newElem = LS_Ground.Stages.NewElem();
                LS_Ground.Stages.push_back(ls_newElem);
                ls_temp = LS_Ground.Stages{0};
                StartTime = extractTimeString(IOD_Ground.Method.SelectedMeasurements.Choices{0});
                StopTime = extractTimeString(Mea3);
                ls_temp.MaxIterations = 20;
                ls_temp.StartTime.Set(StartTime , 'UTCG');
                ls_temp.StopTime.Set(StopTime , 'UTCG');
                %ls_temp.c.Set('29 Nov 2025 20:04:20.294' , 'UTCG');
                %ls_temp.StopTime.Set('30 Dec 2025 00:04:20.294' , 'UTCG');
                LS_Ground.go();
                LsRun = LS_Ground.RunResults.RunSuccess;
                
                %LS_Ground.transfer(); 
                if LsRun 
                    fprintf('初最小二乘定轨成功！\n');
                    break
                end 
            end
        end
        if LsRun 
            break
        end
    end
    if LsRun 
        break
    end
end
 % LS_Ground.transfer();



%% 基于CustomDataEditing模块的机动检测，并划分观测数据（默认只有一次机动）
% 用一个stage覆盖所有观测数据
LS_Ground.CustomDataEditing.Enabled = 'true'; % 开启CustomDataEditing模块
LS_Ground.Stages.clear();
ls_newElem = LS_Ground.Stages.NewElem();
LS_Ground.Stages.push_back(ls_newElem);
ls_temp = LS_Ground.Stages{0};
StartTime = extractTimeString(IOD_Ground.Method.SelectedMeasurements.Choices{0});
StopTime = extractTimeString(IOD_Ground.Method.SelectedMeasurements.Choices{MeaNum-1});
ls_temp.MaxIterations = 20;
ls_temp.StartTime.Set(StartTime , 'UTCG');
ls_temp.StopTime.Set(StopTime , 'UTCG');


% 配置CustomDataEditing模块，默认只有一次机动
ScheduleNum = 0;
if EndIdx < 6 
    EndIdx = 6;
end
LS_Ground.CustomDataEditing.Schedule.clear();
ls_newElem = LS_Ground.CustomDataEditing.Schedule.NewElem();
LS_Ground.CustomDataEditing.Schedule.push_back(ls_newElem);
ls_temp = LS_Ground.CustomDataEditing.Schedule{ScheduleNum};
lsInterval_newElem = ls_temp.Intervals.NewElem() ;
ls_temp.Intervals.Insert(lsInterval_newElem);      
StartTime = extractTimeString(IOD_Ground.Method.SelectedMeasurements.Choices{0});
StopTime = extractTimeString(IOD_Ground.Method.SelectedMeasurements.Choices{EndIdx});
ls_temp.Intervals{0}.Start.Set(StartTime , 'UTCG');
ls_temp.Intervals{0}.Stop.Set(StopTime , 'UTCG'); 
LS_Ground.go();
LsRun=LS_Ground.RunResults.RunSuccess;

% 添加观测数据直至LS发散
while LsRun == 1 && EndIdx < MeaNum-1
      EndIdx = EndIdx + 1;
      StopTime = extractTimeString(IOD_Ground.Method.SelectedMeasurements.Choices{EndIdx});
      ls_temp.Intervals{0}.Stop.Set(StopTime , 'UTCG'); 
      LS_Ground.go();
      LsRun=LS_Ground.RunResults.RunSuccess;
      fprintf('最小二乘已选择 %d 个观测数据\n', EndIdx+1);
end

% 根据观测数据量判断有无机动
if EndIdx == MeaNum-1
    fprintf('未检测到机动! \n');
    LS_Ground.Output.STKEphemeris.DuringProcess.Generate = 'true';
    LS_Ground.go();
    % FileDir = LS_Ground.Output.STKEphemeris.OutputDirectory;
    EphemerisFileName = LS_Ground.Output.STKEphemeris.Files{0}.Filename; % 无机动则输出星历文件
    Manuver = 0;
else
    StopTime = extractTimeString(IOD_Ground.Method.SelectedMeasurements.Choices{EndIdx-1});
    ls_temp.Intervals{0}.Stop.Set(StopTime , 'UTCG'); 
    ls_temp = LS_Ground.Stages{0};
    ls_temp.StopTime.Set(StopTime , 'UTCG');
    LS_Ground.Output.STKEphemeris.DuringProcess.Generate = 'true';
    LS_Ground.go();
    EphemerisFileName = LS_Ground.Output.STKEphemeris.Files{0}.Filename; % 有机动则输出机动前段星历文件
    Manuver = 1;
    fprintf('检测到机动！机动发生时间为: \n ' );
    fprintf('%s \n' ,StopTime  );
    fprintf('前 %d 个观测数据为机动前数据\n', EndIdx);
    fprintf('后 %d 个观测数据为机动后数据\n', MeaNum - EndIdx);
end
     


Rsigma(iisigma) = LS_Ground.Output.OrbitUncertainty.R_sigma.GetIn("km");
Isigma(iisigma) = LS_Ground.Output.OrbitUncertainty.I_sigma.GetIn("km");
Csigma(iisigma) = LS_Ground.Output.OrbitUncertainty.C_sigma.GetIn("km");

% Tsigma = sqrt(Rsigma.^2+Isigma.^2+Csigma.^2);
% figure('Position', [100, 100, 800, 500]);
% hold on;  % 保持图形，允许后续绘制叠加
% scatter(BiasNoise, Rsigma, 10, 'filled',"red");hold on
% scatter(BiasNoise, Isigma, 10, 'filled',"blue");hold on
% scatter(BiasNoise, Csigma, 10, 'filled',"green");hold on
% % scatter(WhiteNoiseSigma, Tsigma, 5, 'filled',"black");hold on
% grid on;
% xlabel('BiasNoiseSigma [arcsec]', 'FontName', 'Times New Roman', 'FontSize', 15);
% ylabel('Covariance [km]', 'FontName', 'Times New Roman', 'FontSize', 15);
% % 添加图例，请根据实际含义修改标签文字
% legend({'Rsigma', 'Isigma', 'Csigma'}, ...
%        'FontName', 'Times New Roman', 'FontSize', 12, ...
%        'Location', 'best');  % Location可调整图例位置
% hold on;

% LS_Ground.Output.STKEphemeris.DuringProcess.Generate = 'true';
% cart = LS_Ground.Output.OrbitState.ToCartesian();
% r_LS(1,1) = cart.XPosition.GetIn("km");
% r_LS(1,2) = cart.YPosition.GetIn("km");
% r_LS(1,3) = cart.ZPosition.GetIn("km");
% r_LS(1,4) = cart.XVelocity.GetIn("km*sec^-1");
% r_LS(1,5) = cart.YVelocity.GetIn("km*sec^-1");
% r_LS(1,6) = cart.ZVelocity.GetIn("km*sec^-1");
% 
% kep = LS_Ground.Output.OrbitState.ToKeplerian();
% a_LS(1) = kep.SemiMajorAxis.GetIn("km");
% printKeplerianOrbitState(kep);

% 获取状态参数
% [Target,Moon] = main_stk(EphemerisFileName);
% 获取与真实轨道相对距离

 [dis,t,Sun,Moon,Target,Target_real] = main_stk_dis(EphemerisFileName);


%% 机动后段最小二乘（未知机动大小和准确时间，所以不能用Stage分段LS，需重新对后段用IOD找初值运行LS）
LS_Ground.CustomDataEditing.Enabled = 'false';
% LS_Ground.CheckForDivergence = 'false';
% LS_Ground.LeastSquares.Stages.clear();
% 
% Mea1 = IOD_Ground.Method.SelectedMeasurements.Choices{0};
% Mea2 = IOD_Ground.Method.SelectedMeasurements.Choices{EndIdx};
% StartTime = extractTimeString(Mea1);
% StopTime = extractTimeString(Mea2);
% ls_newElem = LS_Ground.LeastSquares.Stages.NewElem();
% LS_Ground.LeastSquares.Stages.push_back(ls_newElem);
% ls_temp = LS_Ground.LeastSquares.Stages{0};
% ls_temp.MaxIterations = 50;
% ls_temp.StartTime.Set(StartTime , 'UTCG');
% ls_temp.StopTime.Set(StopTime , 'UTCG');
% ls_temp.InitialEdit = 'true';
if Manuver == 1
    Mea3 = IOD_Ground.Method.SelectedMeasurements.Choices{EndIdx+1};
    Mea4 = IOD_Ground.Method.SelectedMeasurements.Choices{MeaNum-1};
    StartTime = extractTimeString(t{end});
    StopTime = extractTimeString(Mea4);
    LS_Ground.LeastSquares.Stages.clear();
    ls_newElem = LS_Ground.LeastSquares.Stages.NewElem();
    LS_Ground.LeastSquares.Stages.push_back(ls_newElem);
    
    ls_temp = LS_Ground.LeastSquares.Stages{0};
    ls_temp.MaxIterations = 50;
    ls_temp.StartTime.Set(StartTime , 'UTCG');
    ls_temp.StopTime.Set(StopTime , 'UTCG');
    %ls_temp.InitialEdit = 'true';
    statecor = ls_temp.StateCorrection.Choices{1};
    %ls_temp.StateCorrection = statecor;
    %ls_temp.EstimateBCoeff = 'true';
    
    % 机动后段重新用IOD找初值使LS收敛
    StartIdx = EndIdx+2;
    EndIdx = StartIdx+1;
    IOD = false;
    while EndIdx < MeaNum-1
        EndIdx = EndIdx + 1;
        for i = StartIdx : EndIdx-2
            for j = i+1 : EndIdx-1 
                IOD_Ground.Method.SelectedMeasurements.clear();
                Mea1 = IOD_Ground.Method.SelectedMeasurements.Choices{i};
                Mea2 = IOD_Ground.Method.SelectedMeasurements.Choices{j};
                Mea3 = IOD_Ground.Method.SelectedMeasurements.Choices{EndIdx};
        
                IOD_Ground.Method.SelectedMeasurements.Insert(Mea1);
                IOD_Ground.Method.SelectedMeasurements.Insert(Mea2);
                IOD_Ground.Method.SelectedMeasurements.Insert(Mea3);
                % IOD_Ground.Method.SelectedMeasurements.Insert('000000  28 Nov 2025 00:45:15.034          K19 RaDec     137.7   20.4')
                % IOD_Ground.Method.SelectedMeasurements.Insert('155945  29 Nov 2025 20:04:20.294          D29 RaDec     140.3   19.5')
                % IOD_Ground.Method.SelectedMeasurements.Insert('242267  30 Nov 2025 20:03:01.757          P13 RaDec     141.9   18.8');
                
                selected_count = IOD_Ground.Method.SelectedMeasurements.Count;
                fprintf('已选择 %d 个测量数据\n', selected_count);
                
                IOD_Ground.go();
                kep = IOD_Ground.Output.OrbitState.ToKeplerian();
                % printKeplerianOrbitState(kep);
                a_IOD = kep.SemiMajorAxis.GetIn("km");
                
        
                if a_IOD ~= 0
                    fprintf('机动后段IOD定轨成功！\n');
                    % kep = IOD_Ground.Output.OrbitState.ToKeplerian();
                    % a = kep.SemiMajorAxis.GetIn("km")
                    % printKeplerianOrbitState(kep);
                    IOD = true;
                    IOD_Ground.transfer();
                    LS_Ground.go();
                    LsRun=LS_Ground.RunResults.RunSuccess;
                    if LsRun
                        fprintf('机动后段最小二乘定轨成功！\n');
                        cart = LS_Ground.Output.OrbitState.ToCartesian();
                        r_LS(2,1) = cart.XPosition.GetIn("km");
                        r_LS(2,2) = cart.YPosition.GetIn("km");
                        r_LS(2,3) = cart.ZPosition.GetIn("km");
                        r_LS(2,4) = cart.XVelocity.GetIn("km*sec^-1");
                        r_LS(2,5) = cart.YVelocity.GetIn("km*sec^-1");
                        r_LS(2,6) = cart.ZVelocity.GetIn("km*sec^-1");
                        break
                    end
                end
            end
            if LsRun 
                break
            end
        end
        if LsRun 
            break
        end
    end
    EphemerisFileName = LS_Ground.Output.STKEphemeris.Files{0}.Filename; % 输出机动后段星历文件
    
    % 获取状态参数
    % [Target_,Moon_] = main_stk(EphemerisFileName); % 导入stk复核
    
    % 获取与真实轨道相对距离
     [dis_,t_,Sun_,Moon_,Target_,Target_real_] = main_stk_dis(EphemerisFileName);
end 


% dis = [dis;dis_];
% tt = [t;t_];
% Sun = [Sun;Sun_];
% Moon = [Moon;Moon_];
% Target = [Target;Target_];
% Target_real = [Target_real;Target_real_];


totalTar = max(length(Target_real));
% Tar_RelMv = zeros(totalTar,4);
% Tar_RelMv_ = zeros(totalTar,4);
% SunPhaseAngle = zeros(totalTar,1);
% SunPhaseAngle_ = zeros(totalTar,1);
% pos = zeros(totalTar,1);
% pos_ = zeros(totalTar,1);
% MoonPhaseAngle_ = zeros(totalTar,1);
% MoonExclusion_ = zeros(totalTar,1);





%% 定轨误差
% if Manuver == 1
%     Target = [Target;Target_];
%     Moon = [Moon;Moon_];
%     dis = [dis;dis_];
% end
% tt = cell2mat(tt);
% % 另一种方法：将月份缩写转换为数字格式
% % 定义月份缩写映射
% month_map = containers.Map({'Jan','Feb','Mar','Apr','May','Jun',...
%                             'Jul','Aug','Sep','Oct','Nov','Dec'}, ...
%                            {'01','02','03','04','05','06',...
%                             '07','08','09','10','11','12'});
% 
% % 处理每个日期字符串
% for i = 1:size(tt, 1)
%     date_str = tt(i,:);
% 
%     % 提取月份缩写（位置 4:6）
%     month_abbr = strtrim(date_str(4:6));
% 
%     % 转换为数字月份
%     month_num = month_map(month_abbr);
% 
%     % 重新构建日期字符串为 'dd-mm-yyyy HH:MM:SS' 格式
%     new_date_str = [date_str(1:2), '-', month_num, '-', date_str(8:11), ' ', date_str(13:end)];
% 
%     % 替换原字符串
%     tt_cell{i} = new_date_str;
% end
% 
% % 现在可以使用标准格式解析
% t_datetime = datetime(tt_cell, 'InputFormat', 'dd-MM-yyyy HH:mm:ss.SSSSSSSSS');


% RMSE
errors = Target_real - Target;                % 每个分量的误差
squaredErrors = errors.^2;                      % 每个分量的平方
mse_per_component = mean(squaredErrors, 1);     % 每个分量的均方误差（1表示按列平均）
rmse_per_component = sqrt(mse_per_component);   % 每个分量的 RMSE

% 总体位置 RMSE（考虑所有分量）
totalSquaredErrors = dis.^2;         % 每个点的误差平方和（欧氏距离平方）
totalRmse = sqrt(mean(totalSquaredErrors));     % 总体 RMSE
fprintf('RMSE = %.4f\n', totalRmse/1000);

RMSE(iisigma) = totalRmse/1000;
end


Tsigma = sqrt(Rsigma.^2+Isigma.^2+Csigma.^2);
figure('Position', [100, 100, 800, 500]);


% 绘制RMSE累积均值
RMSE_mean = cumsum(RMSE) ./ (1:length(RMSE))';
figure;
plot(1:length(RMSE), RMSE_mean, 'b-', 'LineWidth', 1.5);
hold on;
yline(mean(RMSE), 'r--', 'Final Mean', 'LineWidth', 1.2);
xlabel('Number of Samples','FontName', 'Times New Roman', 'FontSize', 15);
ylabel('RMSE \sigma Mean [km]','FontName', 'Times New Roman', 'FontSize', 15);
grid on;


% 绘制协方差累积均值
Rsigma_mean = cumsum(Rsigma) ./ (1:length(Rsigma))';
Isigma_mean = cumsum(Isigma) ./ (1:length(Isigma))';
Csigma_mean = cumsum(Csigma) ./ (1:length(Csigma))';
Tsigma_mean = cumsum(Tsigma) ./ (1:length(Tsigma))';
figure;

% 子图 1
subplot(2,2,1);
plot(1:length(Rsigma), Rsigma_mean, 'b-', 'LineWidth', 1.5);
hold on;
yline(mean(Rsigma), 'r--', 'Final Mean', 'LineWidth', 1.2);
xlabel('Number of Samples', 'FontName', 'Times New Roman', 'FontSize', 10);
ylabel('Radial \sigma Mean [km]', 'FontName', 'Times New Roman', 'FontSize', 10);
grid on;

% 子图 2
subplot(2,2,2);
plot(1:length(Isigma), Isigma_mean, 'b-', 'LineWidth', 1.5);
hold on;
yline(mean(Isigma), 'r--', 'Final Mean', 'LineWidth', 1.2);
xlabel('Number of Samples', 'FontName', 'Times New Roman', 'FontSize', 10);
ylabel('In-track \sigma Mean [km]', 'FontName', 'Times New Roman', 'FontSize', 10);
grid on;

% 子图 3
subplot(2,2,3);
plot(1:length(Csigma), Csigma_mean, 'b-', 'LineWidth', 1.5);
hold on;
yline(mean(Csigma), 'r--', 'Final Mean', 'LineWidth', 1.2);
xlabel('Number of Samples', 'FontName', 'Times New Roman', 'FontSize', 10);
ylabel('Cross-track \sigma Mean [km]', 'FontName', 'Times New Roman', 'FontSize', 10);
grid on;

% 子图 4
subplot(2,2,4);
plot(1:length(Tsigma), Tsigma_mean, 'b-', 'LineWidth', 1.5);
hold on;
yline(mean(Tsigma), 'r--', 'Final Mean', 'LineWidth', 1.2);
xlabel('Number of Samples', 'FontName', 'Times New Roman', 'FontSize', 10);
ylabel('Total \sigma Mean [km]', 'FontName', 'Times New Roman', 'FontSize', 10);
grid on;





tt = t;

% 英文日期
tt_no_ns = cellfun(@(x) x(1:23), tt, 'UniformOutput', false);
t_datetime = datetime(tt_no_ns, 'InputFormat', 'dd MMM yyyy HH:mm:ss.SSS', 'Locale', 'en_US');


% 4. 绘图
figure;
scatter(t_datetime(1:totalTar), dis(1:totalTar)./1000, 5,'filled');
xlabel('Time', 'FontName', 'Times New Roman', 'FontSize', 15);
ylabel('Relative Distance [km]', 'FontName', 'Times New Roman', 'FontSize', 15);
%title('Relative Distance vs Time', 'FontName', 'Times New Roman', 'FontSize', 14);
grid on;

% 改进时间轴显示
datetick('x', 'dd-mmm-yyyy HH:MM', 'keepticks');
xtickangle(45);







figure;hold on;
%plot3(Target(:,1),Target(:,2),Target(:,3),'b-', 'LineWidth', 1.5);
scatter3(Target(:,1),Target(:,2),Target(:,3),6, 'filled');
xlabel('X[km]', 'FontName', 'Times New Roman', 'FontSize', 12);
ylabel('Y[km]', 'FontName', 'Times New Roman', 'FontSize', 12);
zlabel('Z[km]', 'FontName', 'Times New Roman', 'FontSize', 12);
plot3(0, 0,0, 'bo', 'MarkerSize', 20, 'MarkerFaceColor', 'black');
scatter3(Moon(:,1),Moon(:,2),Moon(:,3),6, 'filled');
axis equal;view(3);grid on;

legend('目标轨道','地球','月球轨道','FontName', 'Times New Roman', 'FontSize', 12, 'Location', 'best');




    



%% 计算亮度

second(time(1))          % 查看第一个时间点的秒数（包括小数）
second(t_datetime(1))    % 查看 t_datetime 第一个点的秒数

% 将 time 舍入到整秒（消除小数部分）
time = dateshift(time, 'start', 'minute');
% 将 time 舍入到整秒（消除小数部分）
t_datetime = dateshift(t_datetime, 'start', 'minute');
% 查找索引
[~, idx] = ismember(time, t_datetime);

% 检查匹配情况
if any(idx == 0)
    warning('有 %d 个时间点未在 t_datetime 中找到', sum(idx==0));
else
    disp('所有时间均已找到，索引如下：');
    disp(idx);
end


for i = 1 : totalTar
    [Magnitude,phaseAngle,moonphaseAngle,moonExclusion] = Calculate_Mag(Sun(i,1:3),[0 0 0],Target(i,1:3),Moon(i,1:3));
    [Magnitude_,phaseAngle_,moonphaseAngle_,moonExclusion_] = Calculate_Mag(Sun(i,1:3),[0 0 0],Target_real(i,1:3),Moon(i,1:3));
    Tar_RelMv(i,:) = Magnitude;
    Tar_RelMv_(i,:) = Magnitude_;
    SunPhaseAngle(i) = phaseAngle*180/pi;
    SunPhaseAngle_(i) = phaseAngle_*180/pi;
    MoonPhaseAngle_(i) = moonphaseAngle_; 
    MoonExclusion_(i) = moonExclusion_;
    pos(i) = norm(Target(i,1:3));
    pos_(i) = norm(Target_real(i,1:3));
end

% 提取实测星等
para = [0.9;0.8;0.3;0.1];
arhou = [0.3; 0.4;0.5;0.6];
mag = cell2mat(mag);
idx = idx(idx <= totalTar);
idx = idx(idx~=0);


plotData_250625 = struct();
plotData_250625.moonphase = MoonPhaseAngle_(idx);       % x轴数据
plotData_250625.moonexclusion = MoonExclusion_(idx);    % y轴数据
plotData_250625.magnitude = mag(1:length(idx))';  
plotData_250625.sunphase = SunPhaseAngle_(idx);
plotData_250625.distance = pos_(idx);
save('data_250625.mat', 'plotData_250625');

load("data_251026.mat");
load("data_250524.mat");
% 月相、月球角距与星等关系
figure('Position', [100, 100, 800, 500]);

scatter(plotData_250625.sunphase, plotData_250625.distance, ...
    60, plotData_250625.magnitude, 'LineWidth', 2.5, ...
    'Marker', 'x', 'DisplayName', '2025.05.24');
hold on;
grid on;

% 第一组数据：圆形标记，颜色来自 magnitude
scatter(plotData_250625.sunphase, plotData_250625.distance, ...
    60, plotData_250625.magnitude, 'filled', ...
    'Marker', 'o', 'DisplayName', '2025.06.25');
hold on;
grid on;

% 第二组数据：方形标记，颜色来自 magnitude
scatter(plotData_250625.sunphase, plotData_250625.distance, ...
    60, plotData_250625.magnitude, 'filled', ...
    'Marker', 's', 'DisplayName', '2025.10.26');

% 坐标轴标签
xlabel('$\theta_{\mathrm{Sun}}$ [deg]', 'Interpreter', 'latex','FontName', 'Times New Roman', 'FontSize', 15);
ylabel('distance [km]', 'Interpreter', 'latex', ...
    'FontName', 'Times New Roman', 'FontSize', 15);

% 颜色条（共用一个，表示星等）
colormap(jet);
c = colorbar;

c.Label.String = 'Mag [-]';
c.Label.Interpreter = "latex";
c.Label.FontName = 'Times New Roman';
c.Label.FontSize = 15;

% 添加图例（自动使用 DisplayName 的内容）
legend('Location', 'best');



% 可视化实际星等vs模型星等
figure('Position', [100, 100, 600, 600]);
t = tiledlayout(2,2,"TileSpacing","tight","Padding","tight");

for i = 1:4
    nexttile;
    
    extracted_values = Tar_RelMv(idx,i);
    ee = Tar_RelMv_(idx,i);
    scatter(time(1:length(idx)), extracted_values(:), 10, 'r', 'filled');
    hold on;
    % scatter(time(1:length(idx)), ee(:), 10, 'g','s', 'filled');
    % hold on;
    scatter(time(1:length(idx)), mag(1:length(idx)), 10, 'b', 'filled');
    
    grid on; box on;
    set(gca, 'FontSize', 10, 'FontName', 'Times New Roman');
    
    % 添加图例（位置可根据需要调整）
    legend('模型计算', '实际观测', 'Location', 'northwest', ...
           'FontSize', 8, 'FontName', 'Times New Roman');
    
    title(sprintf('$A{\\rho}$:%0.1f ${\\beta}$:%0.1f', arhou(i), para(i)), ...
          'Interpreter', 'latex', 'FontName', 'Times New Roman', 'FontSize', 10);
    
    % 设置x轴仅显示日期
    xtickformat('MM-dd');
    xtickangle(45);          % 旋转避免重叠
    % xticks(time(1:5:end));  % 如需减少刻度可取消注释
end

xlabel(t, 'Time', 'FontName', 'Times New Roman', 'FontSize', 15);
ylabel(t, 'Mag[-]', 'FontName', 'Times New Roman', 'FontSize', 15);



% 残差与星等、相位关系
% 月相、月球角距与星等关系
figure('Position', [100, 100, 800, 500]);

scatter(plotData_250524.sunphase, plotData_250524.distance, ...
    60, plotData_250524.rms, 'LineWidth', 2.5, ...
    'Marker', 'x', 'DisplayName', '2025.05.24');
hold on;
grid on;

% 第一组数据：圆形标记，颜色来自 magnitude
scatter(plotData_250625.sunphase, plotData_250625.distance, ...
    60, plotData_250625.rms, 'filled', ...
    'Marker', 'o', 'DisplayName', '2025.06.25');
hold on;
grid on;

% 第二组数据：方形标记，颜色来自 magnitude
scatter(plotData_251026.sunphase, plotData_251026.distance, ...
    60, plotData_251026.rms, 'filled', ...
    'Marker', 's', 'DisplayName', '2025.10.26');

% 坐标轴标签
xlabel('$\theta_{\mathrm{Sun}}$ [deg]', 'Interpreter', 'latex','FontName', 'Times New Roman', 'FontSize', 15);
ylabel('distance [km]', 'Interpreter', 'latex', ...
    'FontName', 'Times New Roman', 'FontSize', 15);

% 颜色条（共用一个，表示星等）
colormap(jet);
c = colorbar;

c.Label.String = 'Mag [-]';
c.Label.Interpreter = "latex";
c.Label.FontName = 'Times New Roman';
c.Label.FontSize = 15;

% 添加图例（自动使用 DisplayName 的内容）
legend('Location', 'best');

    plotData_250625.rms = rms;


% 三维坐标vs星等
figure('Position', [100, 100, 600, 600]);
hold on; grid on; axis equal;
for i = 1:4
    subplot(2,2,i);
    hold on; grid on; axis equal;
    crange = [min(Tar_RelMv,[],'all'), max(Tar_RelMv,[],'all')];
    crange1 = [min(Tar_RelMv_,[],'all'), max(Tar_RelMv_,[],'all')];
    crange = [min(crange(1),crange1(1)),max(crange(2),crange1(2))];
    % 绘制散点图
    scatter3(Target(1:totalTar,1), Target(1:totalTar,2), Target(1:totalTar,3), 10, Tar_RelMv(:,i), 'filled');
    
    scatter3(Target_real(:,1), Target_real(:,2), Target_real(:,3), 10, Tar_RelMv_(:,i), '^', 'filled');
   
    xlabel('X[km]', 'FontName', 'Times New Roman', 'FontSize', 6);
    ylabel('Y[km]', 'FontName', 'Times New Roman', 'FontSize', 6);
    zlabel('Z[km]', 'FontName', 'Times New Roman', 'FontSize', 6);
    axis equal;
    set(gca, 'FontSize', 6, 'FontName', 'Times New Roman');
    title(sprintf('$A{\\rho}$:%0.1f ${\\beta}$:%0.1f', arhou(i), para(i)), ...
          'Interpreter', 'latex', 'FontName', 'Times New Roman', 'FontSize', 10);
    caxis(crange);
    view(3);
end
cbar = colorbar('Position', [0.92, 0.15, 0.02, 0.7]);
cbar.Label.String = '星等';
cbar.Label.FontName = 'Times New Roman';
cbar.Label.FontSize = 10;


% 可视化实际星等vs太阳相位角vs定轨误差

figure('Position', [100, 100, 600, 600]);
hold on; 
crange = [min(dis(1:totalTar)./1000), max(dis(1:totalTar)./1000)];
t = tiledlayout(2,2,"TileSpacing","tight","Padding","tight");
for i = 1:4
    nexttile;
    scatter(SunPhaseAngle(:), Tar_RelMv(:,i), 5, dis(1:totalTar)./1000, 'filled');
    hold on;
    scatter(SunPhaseAngle_(:), Tar_RelMv_(:,i), 5, dis(1:totalTar)./1000, '^', 'filled');
    grid on;box on;
    set(gca, 'FontSize', 10, 'FontName', 'Times New Roman');
    title(sprintf('$A{\\rho}$:%0.1f ${\\beta}$:%0.1f', arhou(i), para(i)), ...
          'Interpreter', 'latex', 'FontName', 'Times New Roman', 'FontSize', 10);
    caxis(crange);
end

    xlabel(t, '$\theta_{\odot}$ [deg]', 'Interpreter', 'latex', 'FontName', 'Times New Roman', 'FontSize', 9);
    ylabel(t,'Mag[-]', 'FontName', 'Times New Roman', 'FontSize', 9);
    cbar = colorbar;
    cbar.Label.String = 'Relative Distance [km]';
    cbar.Layout.Tile = 'east';
    cbar.Label.FontName = 'Times New Roman';
    cbar.Label.FontSize = 10;



    
% 星等vs距离vs相角
figure('Position', [100, 100, 600, 600]);
hold on; 
crange = [min(Tar_RelMv,[],'all'), max(Tar_RelMv,[],'all')];
t = tiledlayout(2,2,"TileSpacing","tight","Padding","tight");
for i = 1:4
    nexttile;
    scatter(SunPhaseAngle(:), pos(:)/1e5, 5, Tar_RelMv(:,i), 'filled');
    hold on;
    scatter(SunPhaseAngle_(:), pos_(:)/1e5, 5, Tar_RelMv_(:,i),'s', 'filled');
    grid on;box on;
    set(gca, 'FontSize', 10, 'FontName', 'Times New Roman');
    title(sprintf('$A{\\rho}$:%0.1f ${\\beta}$:%0.1f', arhou(i), para(i)), ...
          'Interpreter', 'latex', 'FontName', 'Times New Roman', 'FontSize', 10);
    caxis(crange);
end

    xlabel(t, '$\theta_{\odot}$ [deg]', 'Interpreter', 'latex', 'FontName', 'Times New Roman', 'FontSize', 15);
    ylabel(t,'distance[km]', 'FontName', 'Times New Roman', 'FontSize', 15);
    colormap(jet);
    cbar = colorbar;
    cbar.Label.String = 'Mag [-]';
    cbar.Layout.Tile = 'east';
    cbar.Label.FontName = 'Times New Roman';
    cbar.Label.FontSize = 15;







% %% 运行filter并生成报告
% 
% 
%     % 运行Filter
%     LS_Ground.transfer();
%     Filter_Ground.go();
% 
%     % ================================
%     % 清空Products
%     odtk.ProductBuilder.DataProducts.clear();
% 
%     %% -------------------------- 图1 --------------------------
%     % 产品名称
%     product_name = 'Classical Elements';
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
%     product.Inputs.DataSources{0}.Filename = ['D:\keyan\projects\OD\[20260107]ODTK_code_yyj\ODTK\' , prop_name , '.filrun'];
%     %     product.Inputs.DataSources{0}.Filename = ['C:\Users\Administrator\Documents\ODTK 7\DataArchive\' , prop_name , '.filrun'];
% 
%     % 输出
%     product.Outputs.Style = 'C:\Program Files\AGI\ODTK 7\ODTK\AppData\Styles\Static\Classical Elements.pyrpt';
%     product.Outputs.Display = 1;
%     product.Outputs.Export.Enabled = 0;
% 
%     % 运行Static Product Builder
%     odtk.ProductBuilder.GenerateProduct(product_name);






%% functions

function printKeplerianOrbitState(os)
    fprintf("Epoch : %s UTCG, Eccentricity: %f, " + ...
            "TrueArgOfLatitude: %f deg, Inclination: %f deg, " + ...
            "RAAN: %f deg, ArgOfPerigee: %f deg rad\n", ...
            os.Epoch.Format("UTCG"), ...
            os.Eccentricity, ...
            os.TrueArgOfLatitude.GetIn("deg"), ...
            os.Inclination.GetIn("deg"), ...
            os.RAAN.GetIn("deg"), ...
            os.ArgOfPerigee.GetIn("rad"));
end

function printGeodeticPos(p)
    fprintf("Lat : %f deg, Lon: %f deg, Alt: %f m\n", ...
        p.Lat.GetIn("deg"), ...
        p.Lon.GetIn("deg"), ...
        p.Alt.GetIn("m"));
end


function timeStr = extractTimeString(measStr)
    % 使用正则表达式匹配时间格式
    % pattern: 匹配"日期 月份 年份 时:分:秒.毫秒"
    pattern = '\d{1,2}\s+[A-Za-z]{3}\s+\d{4}\s+\d{2}:\d{2}:\d{2}\.\d{3}';
    match = regexp(measStr, pattern, 'match');
    if ~isempty(match)
        timeStr = string(regexprep(match{1}, '\s+', ' '));
    else
        timeStr = string('');
        warning('未找到时间字符串: %s', measStr);
    end
end