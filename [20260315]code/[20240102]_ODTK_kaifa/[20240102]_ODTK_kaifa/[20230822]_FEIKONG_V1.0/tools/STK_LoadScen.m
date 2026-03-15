
%%%%%%%%%%%%%%%%%%%%%%%
%
% 载入STK场景
%
% 作者：张晨
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年07月24日
%%%%%%%%%%%%%%%%%%%%%%%

% ------------------------- 场景载入 --------------------
app = actxserver('STK11.application');
root = app.Personality2;
root.LoadScenario([pwd , '\STK_scen\MOFEI.sc']);
fprintf("STK: 载入场景 \n");

% ------------------------ 单位转换 ---------------------
% 单位转换
converter = root.ConversionUtility;

% 计算北斗时
aux.t0_JED_20060101 = str2double(converter.ConvertDate('UTCG' , 'JED' , '1 Jan 2006 00:00:00.000'));

% --------------------- 抓取场景 ------------------------
scn = root.CurrentScenario;

% ----------------------- 抓卫星 -------------------------
DROA = scn.Children.Item('DROA');
DROB = scn.Children.Item('DROB');
DROL = scn.Children.Item('DROL');

DROA.VO.Model.DetailThreshold.All = 1e12;
DROA.VO.Model.DetailThreshold.MarkerLabel = 0.001;
% DROA.VO.Model.DetailThreshold.ModelLabel = 1e12;
% DROA.VO.Model.DetailThreshold.Marker = 1e12;
% DROA.VO.Model.DetailThreshold.Point = 1e12;
