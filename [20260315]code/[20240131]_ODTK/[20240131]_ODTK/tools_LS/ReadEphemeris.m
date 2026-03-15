%%%%%%%%%%%%%%%%%%%%%%%
%
% 读取.e历元文件提供的初值
%
% 作者：尹永辰
% 邮箱：yinyongchen22@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2024年01月05日
%%%%%%%%%%%%%%%%%%%%%%%

function [EphData,EphMat] = ReadEphemeris(folderPath,FileName)
% 本函数用于读取星历文件

EphData = [];
EphMat = [];

folderName = fullfile(folderPath, FileName);

% 打开文件
fid = fopen(folderName , 'r');

while ~feof(fid)
    tline = fgets(fid);
    if contains(tline,'Epoch in JDate format:')
        xxNow = textscan(tline,'%s%s%s%s%s%f');
        EphData.Epoch = xxNow{end};
    end
    if contains(tline,'NumberOfEphemerisPoints')
        xxNow = textscan(tline,'%s%f');
        EphData.Num = xxNow{end};
    end
    if contains(tline,'CentralBody')
        xxNow = textscan(tline,'%s%s');
        EphData.CentralBody = xxNow{end};
        if ~strcmp(char(EphData.CentralBody),'Earth')
            fprintf('错误！初值文件不是地心坐标系')
            break;
        end
    end
    if contains(tline,'CoordinateSystem')
        xxNow = textscan(tline,'%s%s');
        EphData.CoordinateSystem = xxNow{end};
    end
    if contains(tline, 'BEGIN SegmentBoundaryTimes')
        tline = fgets(fid);
        tline = fgets(fid);
        EphData.StartEpoch = EphData.Epoch + cell2mat(textscan(tline,'%f'))/86400;
        tline = fgets(fid);
        EphData.FinalEpoch = EphData.Epoch + cell2mat(textscan(tline,'%f'))/86400;
    end

    if contains(tline,'EphemerisTimePosVel')
        tline = fgets(fid);
        tline = fgets(fid);

        xxNow = textscan(tline,'%f%f%f%f%f%f%f');
        xxNow = cell2mat(xxNow);
        EphData.Time = EphData.Epoch + xxNow(1)/86400;
        EphData.InitialState = xxNow(2:7);
        for iLoop = 1:EphData.Num-1
            tline = fgetl(fid);
            if size(tline,1)==0
                tline = fgetl(fid);
                continue;
            end
            xxNow = textscan(tline,'%f%f%f%f%f%f%f');
            EphMat = [EphMat;EphData.Epoch + xxNow{1}/86400,cell2mat(xxNow(2:7))];
        end
        xxNow = textscan(tline,'%f%f%f%f%f%f%f');
        xxNow = cell2mat(xxNow);
        EphData.FinalState = xxNow(2:7);
        break;
    end
end
fclose('all');
end