
%%%%%%%%%%%%%%%%%%%%%%%
%
% 新建STK场景
%
% 作者：张晨
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年07月24日
%%%%%%%%%%%%%%%%%%%%%%%

% 新建文件夹
rmdir([pwd , '\STK_scen\'] , 's');
mkdir([pwd , '\STK_scen\']);
clc;

%% ----------------------- 新建场景 -----------------------
% 显示STK场景
app = actxserver('STK11.application');
root = app.Personality2;
root.NewScenario('MOFEI');
scn = root.CurrentScenario;

%% --------------------- 设置场景时间 -------------------
% 单位转换
converter = root.ConversionUtility;

% ------------------- 星上计算时间基准 -------------------
% 时间单位
root.UnitPreferences.Item('DateFormat').SetCurrentUnit('UTCG');

% 开始 / 结束时间
scn.SetTimePeriod('1 Jan 2024 00:00:00.00' , '+1 year');

% 历元
scn.Epoch = '1 Jan 2024 00:00:00.00';

% 仿真步长
scn.Animation.AnimStepValue = 60;

% -------------------- 配置Window，3D最大化 --------------------
% 重置
root.Rewind;

% 设置2D场景
scn.Graphics.InertialPosVisible = 0;
scn.Graphics.InertialPosLabelsVisible = 0;
scn.Graphics.SubPlanetPointsVisible = 0;
scn.Graphics.SubPlanetLabelsVisible = 0;
scn.Graphics.PlanetOrbitsVisible = 0;

% 删除STK Logo
scn.SceneManager.ScreenOverlays.Overlays.Item(0).Display = 0;

% 修改最远显示距离
scn.SceneManager.Scenes.Item(0).Camera.FarPlane = 1e12;

% 修改可视角
scn.SceneManager.Scenes.Item(0).Camera.FieldOfView = 55;

% 显示恒星
scn.SceneManager.Scenes.Item(0).ShowStars = 1;

% ---------------------------- 添加卫星 ----------------------------
sat = scn.Children.New('eSatellite' , 'DROA');
sat.SetPropagatorType('ePropagatorAstrogator');

sat = scn.Children.New('eSatellite' , 'DROB');
sat.SetPropagatorType('ePropagatorAstrogator');

sat = scn.Children.New('eSatellite' , 'DROL');
sat.SetPropagatorType('ePropagatorAstrogator');

% ---------------------------- 新建行星 -----------------
%% 行星信息
planet = scn.Children.New('ePlanet' , 'Sun');
planet.CommonTasks.SetPositionSourceCentralBody('Sun' , 'eEphemJPLDE');
planet.Graphics.Inherit = 0;
planet.Graphics.OrbitVisible = 0;
planet.Graphics.SubPlanetLabelVisible = 0;
planet.Graphics.PositionLabelVisible = 0;
planet.Graphics.InertialPositionVisible = 0;
planet.Graphics.SubPlanetPointVisible = 0;
planet.Graphics.Color = 65535;

planet = scn.Children.New('ePlanet' , 'Moon');
planet.CommonTasks.SetPositionSourceCentralBody('Moon' , 'eEphemJPLDE');
planet.Graphics.Inherit = 0;
planet.Graphics.OrbitVisible = 0;
planet.Graphics.SubPlanetLabelVisible = 0;
planet.Graphics.PositionLabelVisible = 0;
planet.Graphics.InertialPositionVisible = 0;
planet.Graphics.SubPlanetPointVisible = 0;
planet.Graphics.Color = 16777215;

planet = scn.Children.New('ePlanet' , 'Earth');
planet.CommonTasks.SetPositionSourceCentralBody('Earth' , 'eEphemJPLDE');
planet.Graphics.Inherit = 0;
planet.Graphics.OrbitVisible = 0;
planet.Graphics.SubPlanetLabelVisible = 0;
planet.Graphics.PositionLabelVisible = 0;
planet.Graphics.InertialPositionVisible = 0;
planet.Graphics.SubPlanetPointVisible = 0;
planet.Graphics.Color = 16436871;

%% -------------------- 复制动力学 ------------------
% 抓取目录
eCompProp = scn.ComponentDirectory.GetComponents('eComponentAstrogator').GetFolder('Propagators');

% 复制条目
eCompProp.DuplicateComponent('Earth HPOP Default v10' , 'cislunarHpop');

% 抓取
eCompCislunar = eCompProp.Item('cislunarHpop');

% 修改Earth
eCompEarth = eCompCislunar.PropagatorFunctions.Item('Gravitational Force');
eCompEarth.GravityFilename = 'STKData\CentralBodies\Earth\EGM2008.grv';
eCompEarth.Degree = 21;
eCompEarth.Order = 21;

eCompEarth.UseSecularVariations = 1;

% Solid Tides
% eCompEarth.SolidTideType = 'eSolidTideFull';
eCompEarth.SolidTideType = 'eSolidTideNone';
% eCompEarth.SolidTideType = 'eSolidTidePermanent';

% OceanTides
eCompEarth.UseOceanTides = 0;
% eCompEarth.UseOceanTides = 1;

%% 修改Moon
eCompMoon = eCompCislunar.PropagatorFunctions.Item('Moon');
eCompMoon.EphemSource = 'eVAEphemSourceDEFile';
eCompMoon.Mode.GravSource = 'eVAGravParamSourceDEFile';

% eCompMoon.SetModeType('eVAThirdBodyModeGravityField');
% eCompMoon.Mode.Degree = 4;
% eCompMoon.Mode.Order = 4;

%% 修改Sun
eCompSun = eCompCislunar.PropagatorFunctions.Item('Sun');
eCompSun.EphemSource = 'eVAEphemSourceDEFile';
eCompSun.Mode.GravSource = 'eVAGravParamSourceDEFile';

%% 修改大气
eCompCislunar.PropagatorFunctions.Remove('Jacchia-Roberts');

%% 修改光压
eCompCislunar.PropagatorFunctions.Remove('Spherical SRP');

%% 修改发动机
% 抓取目录
eCompEngineModels = scn.ComponentDirectory.GetComponents('eComponentAstrogator').GetFolder('Engine Models');

% 复制条目
eCompEngineModels.DuplicateComponent('Constant Thrust and Isp' , 'MainEngineDROA');

% 设置发动机推力（N）
eCompEngineModels.Item('MainEngineDROA').Thrust = aux.DROA.engine_Thrust;

% 设置发动机比冲（s）
eCompEngineModels.Item('MainEngineDROA').Isp = aux.DROA.engine_Isp;

% ============== 保存场景 ==============
root.SaveScenarioAs([pwd , '\STK_scen\MOFEI.sc']);
