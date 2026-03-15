
%%%%%%%%%%%%%%%%%%%%%%%%
%
% 读取设计参数
%
% 作者：张晨
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年07月24日
%%%%%%%%%%%%%%%%%%%%%%%%

function aux = ReadAux

%% 新建空output文件夹
rmdir([pwd , '\output\'] , 's');
mkdir([pwd , '\output\']);

%% 读取卫星标称脉冲
aux.bcmc = ReadWXBCMC;

%% 动力学方程
% aux.eqm_name = 'Earth HPOP Default v10';
% aux.eqm_name = 'Earth HPOP Default V8-1-1';
aux.eqm_name = 'cislunarHpop';

%% 录打靶是否收敛
aux.conv_IO = 1;

%% 打靶参数
% 最小步长
aux.perbDv = 1e-6; % km/s
aux.perbDeg = 1e-3; % deg
aux.perbDur = 1e-2; % s

% 最大步长
aux.maxStepDv = 1e-2; % km/s
aux.maxStepDeg = 10; % deg
aux.maxStepDur = 1e2; % s

% 位置打靶精度
aux.consPos = 0.1; % km

% 速度打靶精度
aux.consVel = 1e-6; % km/s

%% DROA信息

% 发动机信息
aux.DROA.engine_Thrust = 80; % (N)
aux.DROA.engine_Isp = 300; % (s)

% 干重 + 燃料重量
aux.DROA.FuleMass = 300;
aux.DROA.DryMass = 300;

% 大气
aux.DROA.Cd = 2.2;
aux.DROA.Drag_area = 20; % m^2

% 光压
aux.DROA.Cr = 1;
aux.DROA.SRP_area = 20; % m^2

% 
aux.DROA.Ck = 1;
aux.DROA.RP_area = 20; % m^2

% 发动机误差
aux.DROA.thrustAttError = 1; % deg
aux.DROA.thrustDurError = 0.01; % percent

%% 记录脉冲
aux.dv_add_guess = 0;
aux.dv_add_converge = 0;

end
