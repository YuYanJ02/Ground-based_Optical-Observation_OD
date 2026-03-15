%%%%%%%%%%%%%%%%%%%%%%%
%
% 最小二乘残差图
%
% 作者：张晨、孙洋
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年07月24日
%%%%%%%%%%%%%%%%%%%%%%%

% 清空Products
odtk.ProductBuilder.DataProducts.clear();

% --------------------------- 画图1 ---------------------------

% 产品名称
product_name = 'Least_Squares_Residuals';

% 新建
newElem = odtk.ProductBuilder.DataProducts.NewElem();
odtk.ProductBuilder.DataProducts.push_back(newElem);
product_posUncert = odtk.ProductBuilder.DataProducts{odtk.ProductBuilder.DataProducts.count - 1};

% 修改名字
product_posUncert.Name.Assign(product_name);

% 输入
newSrc = product_posUncert.Inputs.DataSources.NewElem();
product_posUncert.Inputs.DataSources.push_back(newSrc);
product_posUncert.Inputs.DataSources{0}.Filename = [pwd , '\output\seg_' , num2str(iLoop) , '\LS_groundX.lsrun'];

% 输出
product_posUncert.Outputs.Style = 'D:\Program Files\AGI\ODTK 7\ODTK\AppData\Styles\Static\Least Squares Residuals.gph';
product_posUncert.Outputs.Display = 1;
product_posUncert.Outputs.Export.Enabled = 1;
    product_posUncert.Outputs.Export.Format = "PNG";
    product_posUncert.Outputs.Export.FileName = [pwd , '\output\seg_' , num2str(iLoop) , product_name,'.png'];

% 运行Static Product Builder
odtk.ProductBuilder.GenerateProduct(product_name);

fprintf('ODTK: 画图（最小二乘残差图） \n')

