
%%%%%%%%%%%%%%%%%%%%%%%
%
% 载入ODTK场景
%
% 作者：张晨
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年07月24日
%%%%%%%%%%%%%%%%%%%%%%%

% ----------------------- 启动ODTK --------------------
% 载入文件夹
addpath('D:\Program Files\AGI\ODTK 7\CodeSamples\CrossPlatform\ODTK\matlab\lib');

% 启动Client API
client = Client('localhost' , 9494);

% Get the application root attribute
odtk = client.Root;

% ----------------------- 载入场景 ----------------------
% ensure new scenario
if odtk.children.count > 0
    
    % close scenario
    odtk.application.deleteObject("", odtk.scenario{0});
    fprintf("ODTK: 场景关闭\n");
    
end

% load the scenario
odtk.LoadObject("", [pwd , '\ODTK_scen\Simu_and_LS.sco']);
fprintf('ODTK: 载入场景\n');

% ---------------------- 抓取对象 -----------------------
% 卫星
odtk_DROA = odtk.Simu_and_LS.DROA;
odtk_DROB = odtk.Simu_and_LS.DROB;
odtk_DROL = odtk.Simu_and_LS.DROL;

% 地面站
odtk_AGX = odtk.Simu_and_LS.trakSys.AGX;
odtk_KSX =  odtk.Simu_and_LS.trakSys.KSX;
odtk_MYX =  odtk.Simu_and_LS.trakSys.MYX;
odtk_SYX =  odtk.Simu_and_LS.trakSys.SYX;

% LS
odtk_DROA_LS_groundX = odtk.Simu_and_LS.DROA.LS_groundX;

% 设置输入输出配置
cart = odtk_DROA.OrbitState.ToCartesian();
cart.CentralBody = 'Earth';
cart.CoordFrame = 'ICRF';

odtk_DROA_LS_groundX.Output.STKEphemeris.DuringProcess.Generate = 'true';
odtk_DROA_LS_groundX.Output.STKEphemeris.DuringProcess.UniformTimeStep = 30;    % 步长30s
odtk_DROA_LS_groundX.Output.STKEphemeris.FileNamingOption = 'ProcessStop';
odtk_DROA_LS_groundX.Output.STKEphemeris.OutputDirectory.Dereference = [pwd , '\output'];

% STK星历预报
if ODTK_Pre

    % 生成预报星历
    odtk_DROA_LS_groundX.Output.STKEphemeris.Predict.Generate = 'true';
    odtk_DROA_LS_groundX.Output.STKEphemeris.Predict.TimeStep = 30;                 % 步长30s
    odtk_DROA_LS_groundX.Output.STKEphemeris.Predict.TimeSpan = 604800;             % 预报时间7天
    odtk_DROA_LS_groundX.Output.STKEphemeris.Predict.StopMode = 'TimeSpan';
    odtk_DROA_LS_groundX.Output.STKEphemeris.FileNamingOption = 'PredictStop';
    fprintf('ODTK: DROA轨道预报 \n');
else
    odtk_DROA_LS_groundX.Output.STKEphemeris.Predict.Generate = 'false';
end

measurementFiles = odtk.Simu_and_LS.Scenario.Measurements.Files;