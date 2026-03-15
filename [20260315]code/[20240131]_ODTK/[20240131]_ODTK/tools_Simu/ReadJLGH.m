
%%%%%%%%%%%%%%%%%%%%%%%%
%
% 读取三星建链规划文件
%
% 作者：张晨
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2022年12月19日
%%%%%%%%%%%%%%%%%%%%%%%%

function JLGH = ReadJLGH(folder_path , file_temp)
 
% 打开文件
fid = fopen([folder_path , '\', file_temp] , 'r');

% 读char
tline = fgets(fid);
tline = fgets(fid);

count = 1;

%读取文件直到结束
while tline ~= -1
    
    % char -> cell
    XX = textscan(tline , '%f %f %f %f');
    
    JLGH{count , 1}.LinkScn = XX{1}; % 链路类型
    JLGH{count , 1}.LinkStartTime = XX{2}; % 链路开始时间
    JLGH{count , 1}.LinkStopTime = XX{3}; % 链路结束时间
    JLGH{count , 1}.LinkTof = XX{4}; % 链路持续时间
    
    % 计数器更新
    count = count + 1;
    
    % 读取下一行代码
    tline = fgets(fid);
    
end

% 关闭文件
fclose('all');

end
