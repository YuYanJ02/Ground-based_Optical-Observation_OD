
%%%%%%%%%%%%%%%%%%%%%%%
%
% 增加Asgtrogator / Target Sequence
% 先脉冲打靶，再连续推力打靶
%
% 作者：张晨
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年07月24日
%%%%%%%%%%%%%%%%%%%%%%%

%% ---------------------- 构造打靶 -----------------------
% 新建tarSeq
tarSeqTemp = satPropMcs.Insert('eVASegmentTypeTargetSequence' , 'tarSeq' , '-');

% 抓取微分修正
DC = tarSeqTemp.Profiles.Item('Differential Corrector');
DC.Name = 'DC';

% 修改微分修正次数
DC.MaxIterations = 50;

% 显示打靶过程
DC.EnableDisplayStatus = 1;

% 更改tarSeq
tarSeqTemp.Action = 'eVATargetSeqActionRunActiveProfiles';

% 方法
% DC.RootFindingAlgorithm = 'eVASecantMethod';
DC.RootFindingAlgorithm = 'eVANewtonRaphsonMethod';

% 延拓
DC.EnableHomotopy = 0;
% DC.EnableHomotopy = 1;
% DC.HomotopySteps = 1;

% 中心差分
% DC.DerivativeCalcMethod = 'eVADeriveCalcMethodForward';
DC.DerivativeCalcMethod = 'eVADeriveCalcMethodCentral';
% DC.DerivativeCalcMethod = 'eVADeriveCalcMethodSigned';

% % 是否终止
% DC.StopOnLimitCycleDetection = 1;
% DC.StopOnLimitCycleDetection = 0;

if iLoop ~= size(aux.bcmc , 2)
    
    %% ---------- 第1类打靶（非入轨点） ----------
    STK_TarDv_1;
    
    % 如果大于阈值才修正
    if norm(dvConverge) > 0.1 * 1e-4
        
        STK_TarFt_1;
        
    else
        
        azConverge = 0;
        elConverge = 0;
        durConverge = 0;
        biasConverge = 0;
        
        azExcute = 0;
        elExcute = 0;
        durExcute = 0;
        
    end
    
else
    
    %% ---------- 第2类打靶（入轨点） ----------
    STK_TarDv_2;
    
    % 如果大于阈值才修正
    if norm(dvConverge) > 0.1 * 1e-4
        
        STK_TarFt_2;
        
    else
        
        azConverge = 0;
        elConverge = 0;
        durConverge = 0;
        biasConverge = 0;
        
        azExcute = 0;
        elExcute = 0;
        durExcute = 0;
        
    end
    
end

dd = [];
