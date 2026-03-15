%%%%%%%%%%%%%%%%%%%%%%%
%
% 将ODTK生成的模拟测量数据进行数据分割与处理，生成模拟测量文件
%
% 作者：孙洋
% 邮箱：sunyang19@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2024年02月01日
%%%%%%%%%%%%%%%%%%%%%%%

% 打开文件
fid = fopen([pwd , fileName,'.geosc'] , 'r');

% 读char
tline = fgets(fid);

% 记录行数
count = 1;

% 初始化
type = [];
RX = [];        % 接收端
TX = [];        % 发射端
Year2 = [];      % 年
DayOY = [];     % day of year
SecOD = [];       % second of day
ValueKm = [];

%读取文件直到结束
while tline ~= -1

    type(count,:) = str2double(tline(8:9));
    RX(count,:) = str2double(tline(1:7));        % 接收端
    TX(count,:) = str2double(tline(12:16));        % 发射端
    Year2(count,:) = str2double(tline(17:18));      % 年
    DayOY(count,:) = str2double(tline(19:21));     % day of year
    SecOD(count,:) = str2double([tline(22:26),'.',tline(27:32)]);       % second of day
    switch type(count,:)
        case 21
            ValueKm(count,:) = str2double([tline(36:45),'.',tline(46:54)]);
        case 34
            ValueKm(count,:) = str2double([tline(43:49),'.',tline(50:55)]);
    end

    % 计数器更新
    count = count + 1;

    % 读取下一行代码
    tline = fgets(fid);

end
count = count-1;

% 关闭文件
fclose('all');


% 卫星及观测站ID
Name = {'DROA','DROB','DROL','KS','SY','MY','AG','MY'};
NameID = [1001,1002,1003,101,102,103,104,105];

% 发射端ID记录
TXName = cell(count,1);
for iiName = 1:size(Name,2)
    id  = find(TX==NameID(iiName));
    if size(id,1)~=0
        TXName(id) = Name(iiName);
    end
end

% 接收端ID记录
RXName = cell(count,1);
for iiName = 1:size(Name,2)
    id  = find(RX==NameID(iiName));
    if size(id,1)~=0
        RXName(id) = Name(iiName);
    end
end

DateUTC = datetime(datenum(Year2+2000, 1, DayOY)+SecOD/86400, ...
    'ConvertFrom', 'datenum','TimeZone','+0');
DateBJ = datetime(DateUTC , 'TimeZone' , '+8');

Year = DateBJ.Year;
Month = DateBJ.Month;
Day = DateBJ.Day;
Hour = DateBJ.Hour;
Minute = DateBJ.Minute;
Second = fix(DateBJ.Second);
MS = fix(mod(DateBJ.Second,1)*1000000)/1000;

ValueM = ValueKm*1000;

% 观测数据分割
[TXOrder,idOrder] = sort(TX);
idIntv = find(TXOrder(2:end)-TXOrder(1:end-1)~=0);
Intv = [1,idIntv'+1;idIntv',count]';
for ii = 1:size(Intv,1)
    idList = (Intv(ii,1):Intv(ii,2))';
    idData = idOrder(idList);
    DateBJTX = DateBJ(idData);
    [DateBJTXOrder,TXidOrder] = sort(DateBJTX);
    idData = idData(TXidOrder);
    idIntvTX = find(DateBJTXOrder(2:end)-DateBJTXOrder(1:end-1)>61/86400);
    IntvTX = [1,idIntvTX'+1;idIntvTX',size(idList,1)]';
    for kkIntvTX = 1:size(IntvTX,1)
        idListTX = IntvTX(kkIntvTX,1):IntvTX(kkIntvTX,2);
        idDataTX = idData(idListTX);
        nt = size(idDataTX,1);
        space = repmat(' ',nt,1);
        TX_ = TXName{idDataTX(1)};
        RX_ = RXName{idDataTX(1)};
        str = [num2str(Year(idDataTX),'%4d'),space,num2str(Month(idDataTX),'%02d'),space,num2str(Day(idDataTX),'%02d'),space,...
            num2str(Hour(idDataTX),'%02d'),space,num2str(Minute(idDataTX),'%02d'),space,num2str(Second(idDataTX),'%02d'),space,num2str(MS(idDataTX),'%3.3f'),space,...
            repmat(TX_,nt,1),space,repmat(RX_,nt,1),space,num2str(ValueM(idDataTX),'%10.3f')];

        type0 = type(idDataTX(1));
        % 打开保存路径及文件
        if type0 == 21
            FileNameStr = ['XCJJG_',num2str(kkIntvTX),'_',TX_,'_',RX_,'.txt'];
        else
            FileNameStr = ['XCSJG_',num2str(kkIntvTX),'_',TX_,'_',RX_,'.txt'];
        end

        FileName_output = fullfile(folderPathInput,FileNameStr);
        fileID = fopen(FileName_output, 'w');
        for i = 1:size(str, 1)
            fprintf(fileID, '%s', string(str(i,:)));
            fprintf(fileID, '\n');
        end
        fclose(fileID);

    end
end






