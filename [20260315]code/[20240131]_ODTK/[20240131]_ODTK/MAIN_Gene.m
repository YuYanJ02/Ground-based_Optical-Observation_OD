%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ODTK模拟测量数据的生成
%
% 操作流程：运行MAIN.m
%
% 作者：张晨，孙洋
% 邮箱：sunyang19@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年02月01日
%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear; close all; % clear path; warning('off');
addpath('tools_LS');
addpath('tools_Simu');
addpath('input');
addpath('output');
addpath('ODTK_Scen');
addpath('ODTK_Scen_Simu');
addpath('STK_scen');
addpath('TDDS_1');
addpath('C:\LOCAL_FTP\TDDS_1\inputdata')
addpath('C:\LOCAL_FTP\TDDS_1\outputdata')
aux = ReadAux;

%%

% 开启ODTK
winopen('MAIN_LaunchODTK-9493-gene.cmd')

% -----------------------------------------------------------
% % 新建STK和ODTK场景
% STK_NewScen;
% ODTK_NewScen;

% 载入STK场景
STK_LoadScen;

% 使用ODTK定轨
% ODTK_IO = 0;
ODTK_IO = 1;

% 载入ODTK场景
if ODTK_IO == 1
    ODTK_LoadScen_Simu;
end

% 载入卫星姿态
STK_AddAttitude;

folderPathInput = 'C:\LOCAL_FTP\TDDS_1\inputdata';
folderPathOutput = 'C:\LOCAL_FTP\TDDS_1\outputdata'; 
% 检查文件夹是否存在
if exist(folderPathInput, 'dir') ~= 7
    % 如果文件夹不存在，创建文件夹
    mkdir(folderPathInput);
    mkdir(folderPathOutput);
end


% ============ 节点循环 ============
for iLoop = 1 : size(aux.bcmc , 2)

    tic

    fprintf(' \n ');
    fprintf('========== 节点 %0.0f ========== \n' , iLoop)
    if iLoop == 1
        fprintf('节点类型：星箭分离点 \n')
    else
        fprintf('节点类型：%s \n' , aux.bcmc(iLoop).type)
    end

    % 添加初值
    if iLoop == 1
        % 添加DROA的星箭分离点状态
        STK_AddInit_DROA;
    end

    % 构造打靶
    if iLoop ~= 1
        % 脉冲 + 连续推力打靶
        STK_AddTar_DROA;
        % 打靶不收敛
        if aux.conv_IO == 0
            % 终止打靶
            break;
        end
    end

    % 不是最后一个点，卫星向前递推
    if iLoop ~= size(aux.bcmc , 2)

        % 新建文件夹，所有输出都放置在该文件夹内
        output_folder = [pwd , '\output\seg_' , num2str(iLoop)];
        mkdir(output_folder);

        % 真卫星递推一段，至下一次脉冲点
        STK_AddProp_DROA;

        % 记录初始状态和结束状态
        root.UnitPreferences.Item('DateFormat').SetCurrentUnit('JDate');
        InitialState = [prop.InitialState.epoch,...
            prop.InitialState.Element.X,...
            prop.InitialState.Element.Y,...
            prop.InitialState.Element.Z,...
            prop.InitialState.Element.Vx,...
            prop.InitialState.Element.Vy,...
            prop.InitialState.Element.Vz];
        FinalState = [prop.FinalState.epoch,...
            prop.FinalState.Element.X,...
            prop.FinalState.Element.Y,...
            prop.FinalState.Element.Z,...
            prop.FinalState.Element.Vx,...
            prop.FinalState.Element.Vy,...
            prop.FinalState.Element.Vz];

        root.UnitPreferences.Item('DateFormat').SetCurrentUnit('UTCG');
        od_epoch = prop.FinalState.epoch;
        od_state = FinalState(2:7)';

        % ODTK生成模拟测量数据 + 定轨
        ODTK_SimuGene;
        % 画图
        plot_IO = 1;
        if plot_IO == 1
            ODTK_SimuPlot;
        end
        % 判断文件夹中是否为空，为空的话存入新的测量数据
        while 1
            currentFiles = dir(fullfile(folderPathInput, '*.txt'));
            if isempty(currentFiles)
                
                % 输出STK星历文件，作为定轨时的参考标称轨道
                satelliteFilePath = [folderPathInput ,'\DROA.e'];
                ExTool = DROA.ExportTools.GetEphemerisStkExportTool;
                ExTool.CoordinateSystem = 'eStkEphemCoordinateSystemICRF';
                ExTool.TimePeriod.TimePeriodType = 'eExportToolTimePeriodSpecify';
                ExTool.Timeperiod.Start = prop.InitialState.epoch;
                ExTool.Timeperiod.Stop = prop.FinalState.epoch;
                ExTool.StepSize.StepSizeType = 'eExportToolStepSizeSpecify';
                ExTool.Export(satelliteFilePath);

                % 生成模拟测量数据，对数据进行分割存储
                ODTK_SimuDoc;

                break;
            end
        end

        % 控制生成数据的时间
        t_end = toc;
        pause(max(10-t_end,0.01)); % 每10s搜索一次
    end


end














