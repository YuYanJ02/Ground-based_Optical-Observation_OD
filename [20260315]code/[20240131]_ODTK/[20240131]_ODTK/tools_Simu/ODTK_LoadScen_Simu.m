
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
client = Client('localhost' , 9493);

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
odtk.LoadObject("", [pwd , '\ODTK_Scen_Simu\Simu_and_LS.sco']);
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

% 仿真器
odtk_Simu_groundX = odtk.Simu_and_LS.Simu_groundX;

