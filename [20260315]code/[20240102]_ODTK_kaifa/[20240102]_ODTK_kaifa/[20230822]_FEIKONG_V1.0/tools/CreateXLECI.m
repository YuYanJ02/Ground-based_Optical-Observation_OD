
%%%%%%%%%%%%%%%%%%%%%%%
%
% 生成定轨文件
%
% 作者：张晨
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年07月24日
%%%%%%%%%%%%%%%%%%%%%%%

% % 【测试】
% od_epoch = "16 Jan 2024 13:56:38.336";
% od_state = [211844.875258894
%     -122204.972547301
%     -74063.8046275929
%     0.735351520580231
%     -0.113878096142185
%     -0.0902238662345627];

% 时间转换
epoch_UTCG = datetime(od_epoch , 'InputFormat','dd MMM yyyy HH:mm:ss.SSS' , 'TimeZone' , '+0' , 'Locale' , 'en_GB');
epoch_BJT = datetime(epoch_UTCG , 'TimeZone' , '+8');
epoch_BJT.Format='yyyy-MM-dd HH:mm:ss.SSS';
temp = split(string(epoch_BJT) , ".");
part1 = temp{1};
part2 = temp{2};
LCLG_BJT = [datestr(part1 , 'yyyy-mm-ddBHH:MM:SS') , '.' , part2(1:3)];

% 星历时刻（BJT）
t0_fileName_BJT = datestr(epoch_BJT , 'yyyymmddHHMMSS');
tf_fileName_BJT = t0_fileName_BJT;

% 当前时间（datetime, BJT）
tNow_MATLAB_BJT = datetime('now' , 'TimeZone' , '+8');

% 文件生成时间（datetime, BJT）
tGen_MATLAB_BJT = tNow_MATLAB_BJT;

% 文件生成时间（datestr, BJT）
tGen_fileName_BJT = datestr(tGen_MATLAB_BJT , 'yyyymmddHHMMSS');

% =============== 写入DROA ===============
% 生成文件名
filename = ['PC-XXX_DROA_X_XLECI_XXX_0C_', t0_fileName_BJT , '_' , tf_fileName_BJT , '_' , tGen_fileName_BJT , '_XXX' , '.txt'];

% 新建文件
fid = fopen([pwd , '\output\seg_' , num2str(iLoop) , '\' , filename] , 'wt');

% 表头
fprintf(fid , '%s %s %s %s %s %s %s \n', ...
    '本行信息时间(北京时间)' , ...
    '位置X(km,J2000)' , '位置Y(km,J2000)' , '位置Z(km,J2000)' , ...
    '速度VX(m/s,J2000)' , '速度VY(m/s,J2000)' , '速度VZ(m/s,J2000) , 定轨或预报');

% 写入文件
fprintf(fid , '%s %0.8f %0.8f %0.8f %0.8f %0.8f %0.8f %s \n' ,...
    LCLG_BJT , ...
    od_state(1)  , od_state(2) , od_state(3) , ...
    od_state(4)  , od_state(5) , od_state(6) , '0');

% 关闭文件
fclose('all');
