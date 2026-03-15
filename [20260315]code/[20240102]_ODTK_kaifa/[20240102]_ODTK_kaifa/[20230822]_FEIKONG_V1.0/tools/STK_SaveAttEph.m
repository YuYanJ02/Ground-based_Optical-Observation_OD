
%%%%%%%%%%%%%%%%%%%%%%%
%
% 保存星历文件（*.e）和姿态文件（*.a）
%
% 作者：张晨
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年07月24日
%%%%%%%%%%%%%%%%%%%%%%%

% 星历和姿态文件步长
TimeSteps = 30; % s

fprintf(' -------------- 保存轨道和姿态文件 -------------- \n')

% ------------------------ DROA ------------------------
part1 = ['ExportDataFile */Satellite/DROA Ephemeris '];
part2 = ['"' , output_folder , '\DROA.e" '];
part3 = ['Type STK CoordSys Inertial CentralBody Earth InterpBoundaries Include '];
part4 = ['TimeSteps ',num2str(TimeSteps),' TimePeriod ' , '"' ,prop.InitialState.epoch, '"' , ' ' , '"',prop.FinalState.epoch ,'"'];
command_eph = [part1, part2 , part3 , part4];
root.ExecuteCommand(command_eph);
fprintf('STK: 生成"DROA.e" \n')

part1 = ['ExportDataFile */Satellite/DROA Attitude '];
part2 = ['"' , output_folder , '\DROA.a" '];
part3 = ['CoordAxes Inertial Details Quaternions '];
part4 = ['TimeSteps ',num2str(TimeSteps),' TimePeriod ' , '"' ,prop.InitialState.epoch, '"' , ' ' , '"',prop.FinalState.epoch ,'"'];
command_att = [part1, part2 , part3 , part4];
root.ExecuteCommand(command_att);
fprintf('STK: 生成"DROA.a" \n')

% % ------------------------ DROB ------------------------
% part1 = ['ExportDataFile */Satellite/DROB Ephemeris '];
% part2 = ['"' , output_folder , '\DROB.e" '];
% part3 = ['Type STK CoordSys Inertial CentralBody Earth InterpBoundaries Include '];
% part4 = ['TimeSteps ',num2str(TimeSteps),' TimePeriod ' , '"' ,prop.InitialState.epoch, '"' , ' ' , '"',prop.FinalState.epoch ,'"'];
% command_eph = [part1, part2 , part3 , part4];
% root.ExecuteCommand(command_eph);
% fprintf('生成星历文件DROB.e \n')
% 
% part1 = ['ExportDataFile */Satellite/DROB Attitude '];
% part2 = ['"' , output_folder , '\DROB.a" '];
% part3 = ['CoordAxes Inertial Details Quaternions '];
% part4 = ['TimeSteps ',num2str(TimeSteps),' TimePeriod ' , '"' ,prop.InitialState.epoch, '"' , ' ' , '"',prop.FinalState.epoch ,'"'];
% command_att = [part1, part2 , part3 , part4];
% root.ExecuteCommand(command_att);
% fprintf('生成姿态文件DROB.a \n')
% 
% % ------------------------ DROL ------------------------
% part1 = ['ExportDataFile */Satellite/DROL Ephemeris '];
% part2 = ['"' , output_folder , '\DROL.e" '];
% part3 = ['Type STK CoordSys Inertial CentralBody Earth InterpBoundaries Include '];
% part4 = ['TimeSteps ',num2str(TimeSteps),' TimePeriod ' , '"' ,prop.InitialState.epoch, '"' , ' ' , '"',prop.FinalState.epoch ,'"'];
% command_eph = [part1, part2 , part3 , part4];
% root.ExecuteCommand(command_eph);
% fprintf('生成星历文件DROL.e \n')
% 
% part1 = ['ExportDataFile */Satellite/DROL Attitude '];
% part2 = ['"' , output_folder , '\DROL.a" '];
% part3 = ['CoordAxes Inertial Details Quaternions '];
% part4 = ['TimeSteps ',num2str(TimeSteps),' TimePeriod ' , '"' ,prop.InitialState.epoch, '"' , ' ' , '"',prop.FinalState.epoch ,'"'];
% command_att = [part1, part2 , part3 , part4];
% root.ExecuteCommand(command_att);
% fprintf('生成姿态文件DROL.a \n')
