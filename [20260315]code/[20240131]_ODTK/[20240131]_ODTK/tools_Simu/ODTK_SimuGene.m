%%%%%%%%%%%%%%%%%%%%%%%
%
% 使用ODTK生成模拟测量数据
%
% 作者：张晨
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年07月24日
%%%%%%%%%%%%%%%%%%%%%%%

plot_IO = 1; % 不画图
% plot_IO = 1; % 画图

% 仿真数据步长
simu_tStep = 60;

% --------------------- 更新卫星状态（生成模拟测量数据） ---------------------
cart = odtk_DROA.OrbitState.ToCartesian();
cart.Epoch.Set(InitialState(1), 'JDate');
cart.CentralBody = 'Earth';
cart.CoordFrame = 'ICRF';
cart.XPosition.Set(num2str(InitialState(2) * 1e6), 'mm');
cart.YPosition.Set(num2str(InitialState(3) * 1e6), 'mm');
cart.ZPosition.Set(num2str(InitialState(4) * 1e6), 'mm');
cart.XVelocity.Set(num2str(InitialState(5) * 1e6), 'mm*sec^-1');
cart.YVelocity.Set(num2str(InitialState(6) * 1e6), 'mm*sec^-1');
cart.ZVelocity.Set(num2str(InitialState(7) * 1e6), 'mm*sec^-1');
cart = odtk_DROA.OrbitState.Assign(cart);

fprintf('ODTK: DROA状态更新 \n')

% ----------------------- Simulator ----------------------
% 配置仿真时间
odtk_Simu_groundX.ProcessControl.StartTime.Set(InitialState(1), 'JDate');
odtk_Simu_groundX.ProcessControl.StopTime.Set(FinalState(1), 'JDate');
odtk_Simu_groundX.ProcessControl.TimeStep.Set(simu_tStep , 'sec');

% 输出文件
fileName = ['\output\seg_' , num2str(iLoop) '\simu_groundX'];
odtk_Simu_groundX.Output.DataArchive.Filename = [pwd , fileName,'.simrun'];
odtk_Simu_groundX.Output.Measurements.Filename = [pwd , fileName,'.geosc'];

% 运行simulator
odtk_Simu_groundX.go();

fprintf('ODTK: DROA地基X模拟测距 \n')