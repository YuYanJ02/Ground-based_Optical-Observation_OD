
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ODTK定轨计算（最小二乘）
%
% 操作流程：运行MAIN.m
%
% 作者：尹永辰，孙洋
% 邮箱：yinyongchen22@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年01月11日
%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; 
addpath('tools_LS');
addpath('tools_Simu');
addpath('input');
addpath('output');
addpath('ODTK_Scen');
addpath('ODTK_Scen_Simu');
addpath('STK_scen');
addpath('TDDS_1');

% aux = ReadAux;

%% 

% 开启ODTK
winopen('MAIN_LaunchODTK-9494-od.cmd')

% -----------------------------------------------------------

% 使用ODTK定轨
% ODTK_IO = 0;
ODTK_IO = 1;

% 使用ODTK预报
% ODTK_Pre = 0;
ODTK_Pre = 1;

% 载入ODTK场景
if ODTK_IO == 1
    while 1
        try
            ODTK_LoadScen;
            break;
        catch
        end
    end
end

%% ============ 读取ODTK输入数据 ============

% 设置要监视的文件夹路径
folderPathInput = 'C:\LOCAL_FTP\TDDS_1\inputdata';
folderPathOutput = 'C:\LOCAL_FTP\TDDS_1\outputdata'; 
% 检查文件夹是否存在
if exist(folderPathInput, 'dir') ~= 7
    % 如果文件夹不存在，创建文件夹
    mkdir(folderPathInput);
    mkdir(folderPathOutput);
end
addpath('C:\LOCAL_FTP\TDDS_1\inputdata\')
addpath('C:\LOCAL_FTP\TDDS_1\outputdata\')

SatName = 'DROA';
iLoop = 0;
tLastInput = tic;
% 循环监测输入文件
while (1)
    tic
    % profile on
    % 获取当前文件夹内所有文件信息
    currentFiles = dir(fullfile(folderPathInput, '*.txt')); 

    % 如果文件夹不为空
    if ~isempty(currentFiles) 

        % 等待3秒，文件传输完整
        pause(3);
        currentFiles = dir(fullfile(folderPathInput, '*.txt')); 
        iLoop = iLoop+1;

        fprintf(' \n ');
        fprintf('========== 第 %0.0f 段========== \n' , iLoop)
        tSeg = tic;

        measurementFiles.clear();
        % 把当前文件夹内所有的定轨文件都进行转换
        for iiFile = 1:length(currentFiles)
            fileInfo = currentFiles(iiFile);
            if contains(fileInfo.name,'XCJJG')
                JG = ReadXCJJG(folderPathInput, fileInfo.name,iLoop);
            elseif contains(fileInfo.name,'XCSJG')
                JG = ReadXCSJG(folderPathInput, fileInfo.name,iLoop);
            end

            % 导入观测数据
            ne = measurementFiles.NewElem();
            ne.Enabled = true;
            ne.FileName = JG;
            measurementFiles.push_back(ne);
        end
        
        % 读取星历文件，获取初始和最终状态
        currentEph = dir(fullfile(folderPathInput, '*.e')); 
        [EphData,EphMat] = ReadEphemeris(folderPathInput,currentEph.name);
        
        % 定轨
        ODTK_LS_Run; 
        % 画图
        ODTK_LSPlot;
        tLastInput = tic;

        % 删除输入文件
        delete(fullfile(folderPathInput , '*.txt'));
        delete(fullfile(folderPathInput , '*.e'));

        fprintf('ODTK：计算耗时：%.2f s \n' , toc(tSeg))

    end
    % profile viewer

    t_end = toc;
    pause(max(10-t_end,0.01)); % 每10s搜索一次

    % 如果5分钟内没有新的输入即结束循环判断
    if toc(tLastInput)>5*60
        break;
    end
end



