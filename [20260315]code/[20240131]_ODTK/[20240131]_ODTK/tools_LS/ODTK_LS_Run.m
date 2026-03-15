
%%%%%%%%%%%%%%%%%%%%%%%
%
% 读取.e历元文件提供的初值
%
% 作者：尹永辰
% 邮箱：yinyongchen22@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2024年01月05日
%%%%%%%%%%%%%%%%%%%%%%%
tauk = EphMat(1,1);
taukp1 = EphMat(end,1);
InitialState = EphMat(1,:);
FinalState = EphMat(end,:);

% 修改定轨开始结束时间
ls_temp = odtk_DROA_LS_groundX.LeastSquares.Stages{0};
ls_temp.StartTime.Set(tauk , 'JDate');
ls_temp.StopTime.Set(taukp1 , 'JDate');

% % 插值计算初始状态
% InitialState = interp1(EphMat(1:end-1,1),EphMat(1:end-1,2:7),tauk,'spline');
% FinalState = interp1(EphMat(1:end-1,1),EphMat(1:end-1,2:7),taukp1,'spline');

% 更新卫星状态（使用标称轨道作为LS初值！）
cart.Epoch.Set(tauk, 'JDate');
cart.XPosition.Set(num2str(InitialState(2) * 1e3), 'mm');
cart.YPosition.Set(num2str(InitialState(3) * 1e3), 'mm');
cart.ZPosition.Set(num2str(InitialState(4) * 1e3), 'mm');
cart.XVelocity.Set(num2str(InitialState(5) * 1e3), 'mm*sec^-1');
cart.YVelocity.Set(num2str(InitialState(6) * 1e3), 'mm*sec^-1');
cart.ZVelocity.Set(num2str(InitialState(7) * 1e3), 'mm*sec^-1');
cart = odtk_DROA.OrbitState.Assign(cart);
fprintf('ODTK: DROA状态更新 \n')

% 输出文件
odtk_DROA_LS_groundX.Output.Filename = [pwd , '\output\seg_' , num2str(iLoop) , '\LS_groundX.lsrun'];

% 生成过程状态星历
% 地心J2000系下的星历结果
% 
odtk_DROA_LS_groundX.Output.STKEphemeris.CoordFrame{0}.CoordFrame = "J2000";
odtk_DROA_LS_groundX.go();
STKephFile = odtk_DROA_LS_groundX.Output.STKEphemeris.Files{0}.Filename;
WriteEph(folderPathOutput,SatName,STKephFile,taukp1,'ECI')

% 输出定轨结果
od_epoch = odtk_DROA_LS_groundX.Output.OrbitState.Epoch.Format('JDate');
od_state = [odtk_DROA_LS_groundX.Output.OrbitState.XPosition.GetIn('km');
    odtk_DROA_LS_groundX.Output.OrbitState.YPosition.GetIn('km');
    odtk_DROA_LS_groundX.Output.OrbitState.ZPosition.GetIn('km');
    odtk_DROA_LS_groundX.Output.OrbitState.XVelocity.GetIn('km*sec^-1');
    odtk_DROA_LS_groundX.Output.OrbitState.YVelocity.GetIn('km*sec^-1');
    odtk_DROA_LS_groundX.Output.OrbitState.ZVelocity.GetIn('km*sec^-1')];
fprintf('ODTK: DROA地基X定轨 \n');

pos_err = norm([FinalState(2) - od_state(1) * 1e3;
    FinalState(3) - od_state(2) * 1e3;
    FinalState(4) - od_state(3) * 1e3]);
fprintf('ODTK: 定轨结果位置误差: %0.2f m \n' , pos_err)

vel_err = norm([FinalState(5) - od_state(4) * 1e3;
    FinalState(6) - od_state(5) * 1e3;
    FinalState(7) - od_state(6) * 1e3]);
fprintf('ODTK: 定轨结果速度误差: %0.6f m/s \n' , vel_err)

% %% 地心惯性系的星历结果
% 
% odtk_DROA_LS_groundX.Output.STKEphemeris.CoordFrame{0}.CoordFrame = "Fixed";
% odtk_DROA_LS_groundX.go();
% STKephFile = odtk_DROA_LS_groundX.Output.STKEphemeris.Files{0}.Filename;
% WriteEph(folderPathOutput,SatName,STKephFile,taukp1,'ECF')
% 


% odtk_DROA_LS_groundX.Output.STKEphemeris.CoordFrame{0}.CoordFrame = "ICRF";
% odtk_DROA_LS_groundX.go();
% STKephFile = odtk_DROA_LS_groundX.Output.STKEphemeris.Files{0}.Filename;
% WriteEph(folderPathOutput,SatName,STKephFile,taukp1,'BCRS')



