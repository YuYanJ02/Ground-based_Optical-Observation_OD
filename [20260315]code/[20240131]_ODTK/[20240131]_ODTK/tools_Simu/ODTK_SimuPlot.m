%%%%%%%%%%%%%%%%%%%%%%%
%
% 模拟数据绘图
%
% 作者：张晨、孙洋
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年07月24日
%%%%%%%%%%%%%%%%%%%%%%%

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
product.Outputs.Style = 'D:\Program Files\AGI\ODTK 7\ODTK\AppData\Styles\Static\Measurement Times by Type.gph';
product.Outputs.Display = 1;
product.Outputs.Export.Enabled = 1;
    product.Outputs.Export.Format = "PNG";
    product.Outputs.Export.FileName = [pwd , '\output\seg_' , num2str(iLoop) , product_name,'.png'];

% 运行Static Product Builder
odtk.ProductBuilder.GenerateProduct(product_name);

fprintf('ODTK: 画图（地基测距弧段） \n')

%% ------------------------- 图2 --------------------------
% 产品名称
product_name = 'Sim Measurement Noise Normalized';

% 新建
newElem = odtk.ProductBuilder.DataProducts.NewElem();
odtk.ProductBuilder.DataProducts.push_back(newElem);
product = odtk.ProductBuilder.DataProducts{odtk.ProductBuilder.DataProducts.count - 1};

% 修改名字
product.Name.Assign(product_name);

% 输入
newSrc = product.Inputs.DataSources.NewElem();
product.Inputs.DataSources.push_back(newSrc);
product.Inputs.DataSources{0}.Filename = [pwd , '\output\seg_' , num2str(iLoop) , '\simu_groundX.simrun'];

% 输出
product.Outputs.Style = 'D:\Program Files\AGI\ODTK 7\ODTK\AppData\Styles\Static\Sim Measurement Noise Normalized.gph';
product.Outputs.Display = 1;
product.Outputs.Export.Enabled = 1;
    product.Outputs.Export.Format = "PNG";
    product.Outputs.Export.FileName = [pwd , '\output\seg_' , num2str(iLoop) , product_name,'.png'];
    
% 运行Static Product Builder
odtk.ProductBuilder.GenerateProduct(product_name);

fprintf('ODTK: 画图（测量噪声） \n')