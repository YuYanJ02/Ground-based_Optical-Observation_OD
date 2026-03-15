
%%%%%%%%%%%%%%%%%%%%%%%
%
% 使用ODTK先生成模拟测量数据，再使用最小二乘定轨
%
% 作者：张晨
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年07月24日
%%%%%%%%%%%%%%%%%%%%%%%

plot_IO = 0; % 不画图
% plot_IO = 1; % 画图

% 仿真数据步长
simu_tStep = 60;

% ---------------------- 开始和结束时间 -------------------------------------
% 弧段开始时间（prop段开始时间，UTCG）
tauk = prop.InitialState.Epoch;

% 弧段结束时间（prop段结束时间，UTCG）
taukp1 = prop.FinalState.Epoch;

% taukp1前6小时
tauTemp = converter.ConvertDate('JED' , 'UTCG' , num2str(str2num(converter.ConvertDate('UTCG' , 'JED' , taukp1)) - 6 / 24));

% --------------------- 更新卫星状态（生成模拟测量数据） ---------------------
cart = odtk_DROA.OrbitState.ToCartesian();
cart.Epoch.Set(prop.InitialState.epoch, 'UTCG');
cart.CentralBody = 'Earth';
cart.CoordFrame = 'ICRF';
cart.XPosition.Set(num2str(prop.InitialState.Element.X * 1e6), 'mm');
cart.YPosition.Set(num2str(prop.InitialState.Element.Y * 1e6), 'mm');
cart.ZPosition.Set(num2str(prop.InitialState.Element.Z * 1e6), 'mm');
cart.XVelocity.Set(num2str(prop.InitialState.Element.Vx * 1e6), 'mm*sec^-1');
cart.YVelocity.Set(num2str(prop.InitialState.Element.Vy * 1e6), 'mm*sec^-1');
cart.ZVelocity.Set(num2str(prop.InitialState.Element.Vz * 1e6), 'mm*sec^-1');
cart = odtk_DROA.OrbitState.Assign(cart);

fprintf('ODTK: DROA状态更新 \n')

% ----------------------- Simulator ----------------------
% 配置仿真时间
odtk_Simu_groundX.ProcessControl.StartTime.Set(tauk , 'UTCG');
odtk_Simu_groundX.ProcessControl.StopTime.Set(tauTemp , 'UTCG');
odtk_Simu_groundX.ProcessControl.TimeStep.Set(simu_tStep , 'sec');

% 输出文件
odtk_Simu_groundX.Output.DataArchive.Filename = [pwd , '\output\seg_' , num2str(iLoop) , '\simu_groundX.simrun'];
odtk_Simu_groundX.Output.Measurements.Filename = [pwd , '\output\seg_' , num2str(iLoop) '\simu_groundX.geosc'];

% 运行simulator
odtk_Simu_groundX.go();

fprintf('ODTK: DROA地基X模拟测距 \n')

% ------------------------- Filter --------------------------
% 修改输出文件名
odtk_Filter_groundX.Output.DataArchive.Filename = [pwd , '\output\seg_' , num2str(iLoop) , '\simu_groundX.filrun'];

% 运行Filter
odtk_Filter_groundX.go();

%% --------------------------- LS --------------------------

% 更新卫星状态（使用标称轨道作为LS初值！）
cart = odtk_DROA.OrbitState.ToCartesian();
cart.Epoch.Set(aux.bcmc(iLoop).epoch, 'UTCG');
cart.CentralBody = 'Earth';
cart.CoordFrame = 'ICRF';
cart.XPosition.Set(num2str(aux.bcmc(iLoop).state(1) * 1e6), 'mm');
cart.YPosition.Set(num2str(aux.bcmc(iLoop).state(2) * 1e6), 'mm');
cart.ZPosition.Set(num2str(aux.bcmc(iLoop).state(3) * 1e6), 'mm');
cart.XVelocity.Set(num2str(aux.bcmc(iLoop).state(4) * 1e6), 'mm*sec^-1');
cart.YVelocity.Set(num2str(aux.bcmc(iLoop).state(5) * 1e6), 'mm*sec^-1');
cart.ZVelocity.Set(num2str(aux.bcmc(iLoop).state(6) * 1e6), 'mm*sec^-1');
cart = odtk_DROA.OrbitState.Assign(cart);

fprintf('ODTK: DROA状态更新 \n')

%% --------------------------- LS --------------------------
% 修改
ls_temp = odtk_DROA_LS_groundX.LeastSquares.Stages{0};
ls_temp.StartTime.Set(tauk , 'UTCG');
ls_temp.StopTime.Set(taukp1 , 'UTCG');

% 运行LS
odtk_DROA_LS_groundX.go();

% 输出定轨结果
od_epoch = odtk_DROA_LS_groundX.Output.OrbitState.Epoch.Format('UTCG');
od_state = [odtk_DROA_LS_groundX.Output.OrbitState.XPosition.GetIn('km');
    odtk_DROA_LS_groundX.Output.OrbitState.YPosition.GetIn('km');
    odtk_DROA_LS_groundX.Output.OrbitState.ZPosition.GetIn('km');
    odtk_DROA_LS_groundX.Output.OrbitState.XVelocity.GetIn('km*sec^-1');
    odtk_DROA_LS_groundX.Output.OrbitState.YVelocity.GetIn('km*sec^-1');
    odtk_DROA_LS_groundX.Output.OrbitState.ZVelocity.GetIn('km*sec^-1')];

fprintf('ODTK: DROA地基X定轨 \n');

pos_err = norm([prop.FinalState.Element.X - od_state(1);
    prop.FinalState.Element.Y - od_state(2);
    prop.FinalState.Element.Z - od_state(3)]);
fprintf('ODTK: 定轨结果位置误差: %0.2f m \n' , pos_err * 1e3)

vel_err = norm([prop.FinalState.Element.Vx - od_state(4);
    prop.FinalState.Element.Vy - od_state(5);
    prop.FinalState.Element.Vz - od_state(6)]);

fprintf('ODTK: 定轨结果速度误差: %0.6f m/s \n' , vel_err * 1e3)

% ================================
if plot_IO == 1
    
    % 清空Products
    odtk.ProductBuilder.DataProducts.clear();
    
    %% -------------------------- 图1 --------------------------
    % 产品名称
    product_name = 'Measurement_Times_by_Type';
    
    % 新建
    newElem = odtk.ProductBuilder.DataProducts.NewElem();
    odtk.ProductBuilder.DataProducts.push_back(newElem);
    product = odtk.ProductBuilder.DataProducts{odtk.ProductBuilder.DataProducts.count - 1};
    
    % 修改名字
    product.Name.Assign(product_name);
    
    % 输出
    product.Outputs.Style = 'C:\Program Files\AGI\ODTK 7\ODTK\AppData\Styles\Static\Measurement Times by Type.gph';
    product.Outputs.Display = 1;
    product.Outputs.Export.Enabled = 0;
    
    % 运行Static Product Builder
    odtk.ProductBuilder.GenerateProduct(product_name);
    
    fprintf('ODTK: 画图（地基测距弧段） \n')
    
    %% ------------------------- 图2 --------------------------
    % 产品名称
    product_name = 'Residual_Ratios';
    
    % 新建
    newElem = odtk.ProductBuilder.DataProducts.NewElem();
    odtk.ProductBuilder.DataProducts.push_back(newElem);
    product = odtk.ProductBuilder.DataProducts{odtk.ProductBuilder.DataProducts.count - 1};
    
    % 修改名字
    product.Name.Assign(product_name);
    
    % 输入
    newSrc = product.Inputs.DataSources.NewElem();
    product.Inputs.DataSources.push_back(newSrc);
    product.Inputs.DataSources{0}.Filename = [pwd , '\output\seg_' , num2str(iLoop) , '\simu_groundX.filrun'];
    
    % 输出
    product.Outputs.Style = 'C:\Program Files\AGI\ODTK 7\ODTK\AppData\Styles\Static\Residual Ratios.gph';
    product.Outputs.Display = 1;
    product.Outputs.Export.Enabled = 0;
    
    % 运行Static Product Builder
    odtk.ProductBuilder.GenerateProduct(product_name);
    
    fprintf('ODTK: 画图（残差比） \n')
    
    % %% ------------------------- 图3 --------------------------
    % % 产品名称
    % product_name = 'Histogram';
    %
    % % 新建
    % newElem = odtk.ProductBuilder.DataProducts.NewElem();
    % odtk.ProductBuilder.DataProducts.push_back(newElem);
    % product = odtk.ProductBuilder.DataProducts{odtk.ProductBuilder.DataProducts.count - 1};
    %
    % % 修改名字
    % product.Name.Assign(product_name);
    %
    % % 输入
    % newSrc = product.Inputs.DataSources.NewElem();
    % product.Inputs.DataSources.push_back(newSrc);
    % product.Inputs.DataSources{0}.Filename = [pwd , '\output\seg_' , num2str(iLoop) , '\simu_groundX.filrun'];
    %
    % % 输出
    % product.Outputs.Style = 'C:\Program Files\AGI\ODTK 7\ODTK\AppData\Styles\Static\Histogram.gph';
    % product.Outputs.Display = 1;
    % product.Outputs.Export.Enabled = 0;
    %
    % % 运行Static Product Builder
    % odtk.ProductBuilder.GenerateProduct(product_name);
    %
    % dd = [];
    %
    % %% ------------------------- 图4 --------------------------
    % % 产品名称
    % product_name = 'Residual_QQ';
    %
    % % 新建
    % newElem = odtk.ProductBuilder.DataProducts.NewElem();
    % odtk.ProductBuilder.DataProducts.push_back(newElem);
    % product = odtk.ProductBuilder.DataProducts{odtk.ProductBuilder.DataProducts.count - 1};
    %
    % % 修改名字
    % product.Name.Assign(product_name);
    %
    % % 输入
    % newSrc = product.Inputs.DataSources.NewElem();
    % product.Inputs.DataSources.push_back(newSrc);
    % product.Inputs.DataSources{0}.Filename = [pwd , '\output\seg_' , num2str(iLoop) , '\simu_groundX.filrun'];
    %
    % % 输出
    % product.Outputs.Style = 'C:\Program Files\AGI\ODTK 7\ODTK\AppData\Styles\Static\Residual Ratio QQ.gph';
    % product.Outputs.Display = 1;
    % product.Outputs.Export.Enabled = 0;
    %
    % % 运行Static Product Builder
    % odtk.ProductBuilder.GenerateProduct(product_name);
    
    % --------------------------- 画图1 ---------------------------
    % 再次运行Filter
    odtk_Filter_groundX.go();
    
    % 产品名称
    product_name = 'Position_Uncertainty';
    
    % 新建
    newElem = odtk.ProductBuilder.DataProducts.NewElem();
    odtk.ProductBuilder.DataProducts.push_back(newElem);
    product_posUncert = odtk.ProductBuilder.DataProducts{odtk.ProductBuilder.DataProducts.count - 1};
    
    % 修改名字
    product_posUncert.Name.Assign(product_name);
    
    % 输入
    newSrc = product_posUncert.Inputs.DataSources.NewElem();
    product_posUncert.Inputs.DataSources.push_back(newSrc);
    product_posUncert.Inputs.DataSources{0}.Filename = [pwd , '\output\seg_' , num2str(iLoop) , '\simu_groundX.filrun'];
    
    % 输出
    product_posUncert.Outputs.Style = 'C:\Program Files\AGI\ODTK 7\ODTK\AppData\Styles\Static\Position Uncertainty.gph';
    product_posUncert.Outputs.Display = 1;
    product_posUncert.Outputs.Export.Enabled = 0;
    
    % 运行Static Product Builder
    odtk.ProductBuilder.GenerateProduct(product_name);
    
    fprintf('ODTK: 画图（时间 vs 位置误差） \n')
    
    % --------------------------- 画图2 ---------------------------
    % 产品名称
    product_name = 'Velocity_Uncertainty';
    
    % 新建
    newElem = odtk.ProductBuilder.DataProducts.NewElem();
    odtk.ProductBuilder.DataProducts.push_back(newElem);
    product_posUncert = odtk.ProductBuilder.DataProducts{odtk.ProductBuilder.DataProducts.count - 1};
    
    % 修改名字
    product_posUncert.Name.Assign(product_name);
    
    % 输入
    newSrc = product_posUncert.Inputs.DataSources.NewElem();
    product_posUncert.Inputs.DataSources.push_back(newSrc);
    product_posUncert.Inputs.DataSources{0}.Filename = [pwd , '\output\seg_' , num2str(iLoop) , '\simu_groundX.filrun'];
    
    % 输出
    product_posUncert.Outputs.Style = 'C:\Program Files\AGI\ODTK 7\ODTK\AppData\Styles\Static\Velocity Uncertainty.gph';
    product_posUncert.Outputs.Display = 1;
    product_posUncert.Outputs.Export.Enabled = 0;
    
    % 运行Static Product Builder
    odtk.ProductBuilder.GenerateProduct(product_name);
    
    fprintf('ODTK: 画图（时间 vs 速度误差） \n')
    
end
