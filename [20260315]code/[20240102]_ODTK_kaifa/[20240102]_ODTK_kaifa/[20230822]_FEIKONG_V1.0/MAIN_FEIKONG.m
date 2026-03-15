
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 飞行测控系统1.0
%
% 操作流程：
% 1）运行Launch_ODTK.cmd
% 2）运行MAIN.m
%
% 作者：张晨
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年07月24日
%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear; close all; clear path; warning('off');
addpath('tools');
addpath('input');
addpath('output');
addpath('STK_Scen');
addpath('ODTK_Scen');
aux = ReadAux;

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
    ODTK_LoadScen;
end

% 载入卫星姿态
STK_AddAttitude;

% ============ 节点循环 ============
for iLoop = 1 : size(aux.bcmc , 2)
    
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
        
        if ODTK_IO == 1
            
            % ODTK生成模拟测量数据 + 定轨
            ODTK_SimuLS;
            
            fprintf(' -------------------- 定轨结果（ODTK） -------------------- \n')
            fprintf(' 历元(UTCG): %s \n' , od_epoch)
            fprintf(' 状态X(km): %0.6f \n' , od_state(1))
            fprintf(' 状态Y(km): %0.6f \n' , od_state(2))
            fprintf(' 状态Z(km): %0.6f \n' , od_state(3))
            fprintf(' 状态Vx(km/s): %0.6f \n' , od_state(4))
            fprintf(' 状态Vy(km/s): %0.6f \n' , od_state(5))
            fprintf(' 状态Vz(km/s): %0.6f \n' , od_state(6))
            
        else
            
            % 不定轨，模拟生成taukp1时刻的定轨结果
            od_epoch = prop.FinalState.epoch;
            od_state = [prop.FinalState.Element.X + unifrnd(-0.1 , 0.1);
                prop.FinalState.Element.Y + unifrnd(-0.1 , 0.1);
                prop.FinalState.Element.Z + unifrnd(-0.1 , 0.1);
                prop.FinalState.Element.Vx + unifrnd(-1e-4 , 1e-4);
                prop.FinalState.Element.Vy + unifrnd(-1e-4 , 1e-4);
                prop.FinalState.Element.Vz + unifrnd(-1e-4 , 1e-4)];
            
            fprintf(' -------------------- 定轨结果（模拟） -------------------- \n')
            fprintf(' 历元(UTCG): %s \n' , od_epoch)
            fprintf(' 状态X(km): %0.6f \n' , od_state(1))
            fprintf(' 状态Y(km): %0.6f \n' , od_state(2))
            fprintf(' 状态Z(km): %0.6f \n' , od_state(3))
            fprintf(' 状态Vx(km/s): %0.6f \n' , od_state(4))
            fprintf(' 状态Vy(km/s): %0.6f \n' , od_state(5))
            fprintf(' 状态Vz(km/s): %0.6f \n' , od_state(6))
            
        end
        
        % 生成定轨文件
        CreateXLECI;
        
    end
    
end

% 如果全部收敛
if aux.conv_IO == 1
    
    fprintf(' \n ');
    fprintf('========== 任务总结 ========== \n')
    fprintf('全部收敛！\n')
    
elseif aux.conv_IO == 0
    
    fprintf(' \n ');
    fprintf('========== 任务总结 ========== \n')
    fprintf('节点 %0.0f 打靶不收敛！\n' , iLoop)
    
end

% 任务汇总

% 总任务时间
% 总脉冲消耗
% 初始质量
% 剩余质量
% 最长地月影时间

% 最低近地点高度
% 最低近月点高度

% 输出全部轨道、姿态

dd = [];
