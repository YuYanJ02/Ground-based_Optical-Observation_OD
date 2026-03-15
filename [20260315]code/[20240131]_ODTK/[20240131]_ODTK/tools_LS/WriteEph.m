%%%%%%%%%%%%%%%%%%%%%%%
%
% 生成定轨文件
%
% 作者：尹永辰，孙洋
% 邮箱：yinyongchen22@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年01月11日
%%%%%%%%%%%%%%%%%%%%%%%

function WriteEph(folderPathOutput,SatName,STKephFile,taukp1,type)

% 读取星历文件
fid = fopen(STKephFile , 'r');

while ~feof(fid)
    tline = fgets(fid);
    if contains(tline,'Epoch in JDate format:')
        xxNow = textscan(tline,'%s%s%s%s%s%f');
        ScenarioEpoch = xxNow{end};
    end
    if contains(tline,'NumberOfEphemerisPoints')
        xxNow = textscan(tline,'%s%f');
        TotalNum = xxNow{end};
    end

    if contains(tline,'EphemerisTimePosVel')
        tline = fgets(fid);
        break;
    end
end

ics = zeros(TotalNum, 7);
for iLoop = 1:TotalNum
    tline = fgetl(fid);
    xxNow = textscan(tline,'%f%f%f%f%f%f%f');
    xxNow = cell2mat(xxNow);
    ics(iLoop, 1) = ScenarioEpoch + xxNow(1)/86400;
    ics(iLoop, 2:7) = xxNow(2:7);
end
fclose('all');
% 如果是地心ICRS，转换成日心
% if strcmp(type,'BCRS')
%     earthRV = ics(:,2:4)*0;
%     load('DE430Coeff.mat');
%     C_Mat   = DE430Coeff;
%     for iiJD = 1:size(ics,1)
%         JD = ics(iiJD,1);
%         RV = DE430_PosVel(JD,  3, C_Mat);
%         earthRV(iiJD,:) = RV(:,1)';
%     end
%     ics(:,2:4) = ics(:,2:4)+earthRV;
% end

% 转换时间为北京时
DateBJ = datetime(ics(:,1),'convertfrom','juliandate','TimeZone','+8','Format','yyyy-MM-dd''B''HH:mm:ss.SSS');

% 时间、位置和速度数据
str = cell(size(DateBJ,1)+1,8);
str(2:end,1) = cellstr(string(DateBJ));
str(2:end,2) = cellstr(num2str(ics(:,2),'%.6f'));
str(2:end,3) = cellstr(num2str(ics(:,3),'%.6f'));
str(2:end,4) = cellstr(num2str(ics(:,4),'%.6f'));
str(2:end,5) = cellstr(num2str(ics(:,5),'%.8f'));
str(2:end,6) = cellstr(num2str(ics(:,6),'%.8f'));
str(2:end,7) = cellstr(num2str(ics(:,7),'%.9f'));

% 定轨和预报标识
key = ics(:,1)*0;
key(ics(:,1)>taukp1) = 1;
str(2:end,8) = cellstr(num2str(key,'%d'));

% 长度统一
lengths = cellfun(@numel, str(2:end,2:7)); % 计算每个字符串的长度
longestLength = max(lengths,[],'all'); % 获取最长字符串的长度
longestLength = max(longestLength,17);
switch type
    case 'ECI'
        spacesString1 = repmat(' ',1, longestLength-15);
        spacesString2 = repmat(' ',1, longestLength-17);
        str(1,:) = {' 本行信息时间(北京时间)' , ...
            [spacesString1,'位置X(km,J2000)'] , [spacesString1,'位置Y(km,J2000)'] , [spacesString1,'位置Z(km,J2000)'] , ...
            [spacesString2,'速度VX(m/s,J2000)'] , [spacesString2,'速度VY(m/s,J2000)'] , [spacesString2,'速度VZ(m/s,J2000)'], ' 定轨或预报'};
    case 'ECF'
        spacesString1 = repmat(' ',1, longestLength-15);
        spacesString2 = repmat(' ',1, longestLength-17);
        str(1,:) = {' 本行信息时间(北京时间)' , ...
            [spacesString1,'位置X(km,WGS84)'] , [spacesString1,'位置Y(km,WGS84)'] , [spacesString1,'位置Z(km,WGS84)'] , ...
            [spacesString2,'速度VX(m/s,WGS84)'] , [spacesString2,'速度VY(m/s,WGS84)'] , [spacesString2,'速度VZ(m/s,WGS84)'], ' 定轨或预报'};
    case 'BCRS'
        spacesString1 = repmat(' ',1, longestLength-14);
        spacesString2 = repmat(' ',1, longestLength-16);
        str(1,:) = {' 本行信息时间(北京时间)' , ...
            [spacesString1,'位置X(km,BCRS)'] , [spacesString1,'位置Y(km,BCRS)'] , [spacesString1,'位置Z(km,BCRS)'] , ...
            [spacesString2,'速度VX(m/s,BCRS)'] , [spacesString2,'速度VY(m/s,BCRS)'] , [spacesString2,'速度VZ(m/s,BCRS)'], ' 定轨或预报'};
end
str(2:end,2:7) = pad(str(2:end,2:7),longestLength,'left');
str(2:end,8) = pad(str(2:end,8),11,'both');

% 生成文件名
tStartStr = datetime(ics(1,1),'convertfrom','juliandate','TimeZone','+8','Format','yyyyMMddHHmmss');
tEndStr = datetime(ics(end,1),'convertfrom','juliandate','TimeZone','+8','Format','yyyyMMddHHmmss');
tNowStr = datetime('now','TimeZone','+8','Format','yyyyMMddHHmmss');
FileNameStr = ['PC-XXX_',SatName,'_X_XL',type,'_XXX_XX_',char(tStartStr),'_',char(tEndStr),'_',char(tNowStr),'_XXX.txt'];

% 打开保存路径及文件
FileName_output = fullfile(folderPathOutput,FileNameStr);
fileID = fopen(FileName_output, 'w');

% 如果无法打开文件则显示错误信息
if fileID == -1
    error('无法打开文件！');
end

% 遍历数组并按行写入到txt文件中
for i = 1:size(DateBJ, 1)
    fprintf(fileID , '%s %s %s %s %s %s %s %s \n' ,str{i,:});
end

% 关闭文件
fclose(fileID);

end




