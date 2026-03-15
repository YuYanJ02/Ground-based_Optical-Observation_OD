
%%%%%%%%%%%%%%%%%%%%%%%
%
% 增加Asgtrogator / Prop
%
% 作者：张晨
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年07月24日
%%%%%%%%%%%%%%%%%%%%%%%

% Prop名称
prop_name = ['Prop_' , num2str(iLoop)];

% 添加Prop段
prop = satPropMcs.Insert('eVASegmentTypePropagate' , prop_name , '-');

% 选择颜色
prop.Properties.Color = 65280;

% 选择动力学
prop.PropagatorName = aux.eqm_name;

% 增加Epoch终止条件
prop_epoch = prop.StoppingConditions.Add('Epoch');

% 修改Epoch
prop_epoch.Properties.Trip = aux.bcmc(iLoop + 1).epoch;

% 取消prop duration
prop_duration = prop.StoppingConditions.Item('Duration');
prop_duration.Active = 0;

% 运行全部打靶
satProp.RunMCS;

% % 显示
fprintf(' -------------------- 轨道递推 -------------------- \n')
fprintf('弧段开始: %s UTCG \n' , prop.InitialState.epoch)
fprintf('弧段结束: %s UTCG \n' , prop.FinalState.epoch)
fprintf('弧段时长: %0.2f day \n' , str2double(converter.ConvertDate('UTCG' , 'JED' , prop.FinalState.epoch)) - str2double(converter.ConvertDate('UTCG' , 'JED' , prop.InitialState.epoch)))

% 保存真卫星的轨道和姿态文件
STK_SaveAttEph;

% % 场景更新
% scn.Animation.StartTime = prop.FinalState.epoch;
% root.Rewind;
