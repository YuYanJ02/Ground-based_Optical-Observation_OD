
%%%%%%%%%%%%%%%%%%%%%%%%
%
% 读取XCJJG X测距结果
%
% 作者：孙洋
% 邮箱：sunyang19@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2024年01月11日
%%%%%%%%%%%%%%%%%%%%%%%%

function FileNameGeosc = ReadXCJJG(folderPath,FileName,iLoop)

% 输入文件完整路径
file_temp = fullfile(folderPath, FileName);

% 打开文件
fid = fopen(file_temp , 'r');

% 读char
tline = fgets(fid);

% 记录行数
count = 1;

%读取文件直到结束
while tline ~= -1

    % char -> cell
    XX = textscan(tline , '%d %d %d %d %d %d %f %s %s %f %f');

    % 记录数据
    Year(count,1) = XX{1};      % 年
    Month(count,1) = XX{2};     % 月
    Day(count,1) = XX{3};       % 日
    Hour(count,1) = XX{4};      % 时
    Minute(count,1) = XX{5};    % 分
    Second(count,1) = XX{6};    % 秒
    MS(count,1) = XX{7};        % 毫秒
    TX(count,1) = XX{8};        % 发射端
    RX(count,1) = XX{9};        % 接收端
    Range(count,1) = XX{10};    % 伪距
    CNR(count,1) = XX{11};      % 载噪比

    % 计数器更新
    count = count + 1;

    % 读取下一行代码
    tline = fgets(fid);

end
count = count-1;

% 关闭文件
fclose('all');

% 卫星及观测站ID
Name = {'DROA','DROB','DROL','KS','SY','MY'};
NameID = [1001,1002,1003,101,102,103];

% 发射端ID记录
TXid = zeros(count,1);
for iiName = 1:size(Name,2)
    id  = contains(TX,Name{iiName});
    TXid(id) = NameID(iiName);
end

% 接收端ID记录
RXid = zeros(count,1);
for iiName = 1:size(Name,2)
    id  = contains(RX,Name{iiName});
    RXid(id) = NameID(iiName);
end

% 从北京时转换成UTC
ActTimeBJ = datetime(Year,Month,Day,Hour,Minute,Second,MS,'TimeZone','+08:00');
ActTimeUTCG = datetime(ActTimeBJ,'TimeZone','UTC');

% 计算time of year，一年中的第n天
TimeYear = day(ActTimeUTCG,'dayofyear');

% 计算time of day，一天中的第n秒
TimeDay =  ActTimeUTCG.Hour*3600 + ActTimeUTCG.Minute*60 + fix(ActTimeUTCG.Second);

% MS(:) = 0;
% 秒的小数部分
FracSec = MS*1000;

% 距离的整数部分和小数部分
Range1 = fix(Range/1000);
Range2 = mod(Range/1000,1)*1000000000;

% 转换成字符串，并添加geosc格式中需要的常数值
for iicount = 1:count
    IDStr = sprintf('%7d2103%5d',RXid(iicount),TXid(iicount));
    year2 = sprintf('%2d',Year(iicount));
    TimeStr = [year2(end-1:end),sprintf('%03d%05d%06.0f001',TimeYear(iicount),TimeDay(iicount),FracSec(iicount))];
    RangeStr = sprintf('%10d%09.0f31%5d       00000',Range1(iicount),Range2(iicount),TXid(iicount));
    str{iicount,1} = [IDStr,TimeStr,RangeStr];
end

% 打开或新建一个txt文件并指定路径及名称
FileName_input = [pwd,'\output\seg_' , num2str(iLoop),'\',FileName(1:end-4)];
FileNameGeosc = [FileName_input,'.geosc'];
fileID = fopen(FileNameGeosc, 'w');

% 如果无法打开文件则显示错误信息
if fileID == -1
    error('无法打开文件！'); 
end

% 遍历数组并按行写入到txt文件中
for i = 1:size(str, 1)
    fprintf(fileID, '%s', str{i,1}); 
    fprintf(fileID, '\n'); 
end

% 关闭文件
fclose(fileID);

end