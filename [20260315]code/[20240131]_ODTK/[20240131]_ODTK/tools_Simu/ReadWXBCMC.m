
%%%%%%%%%%%%%%%%%%%%%%%
%
% 读取标称轨道文件
%
% 作者：张晨
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年07月24日
%%%%%%%%%%%%%%%%%%%%%%%

function output = ReadWXBCMC

output = [];

% 检查本地文件夹是否有txt
txt_info = dir([pwd , '\input\*.txt']);

% txt文件循环
for iLoop = 1 : size(txt_info , 1)
    
    % 读取文件夹
    folder_temp = txt_info(iLoop).folder;
    
    % 读取文件名
    file_name = txt_info(iLoop).name;
    
    % 拆分文件名
    fileSplit_temp = split(file_name , '_');
    
    % 函数名
    fun_temp = fileSplit_temp{4};
    
    % 不是WXBCMC，跳过
    if ~strcmp(fun_temp , 'WXBCMC')
        
        continue;
        
    else
        
        % 是WXBCMC文件，读数据
        
        % 打开文件
        fid = fopen([folder_temp , '\' , file_name] , 'r');
        
        % 读Title
        tline = fgets(fid);
        tline = fgets(fid);
        
        count = 1;
        
        while tline ~= -1
            
            %读取当前转移弧段的信息
            xxNow = textscan(tline,'%s%s%f%f%f%f%f%f%f%f%f');
            
            % 时间转换【修改为UTCG！】
            epoch_MATLAB_BJT = datetime(xxNow{1}{1} , 'InputFormat','yyyy-MM-dd''B''HH:mm:ss.SSS' , 'TimeZone' , '+8'); % 历元
            epoch_MATLAB_UTCG = datetime(epoch_MATLAB_BJT , 'TimeZone' , '+0');
            t0_STK_UTCG = datestr(epoch_MATLAB_UTCG , 'dd mmm yyyy HH:MM:SS.FFF');
            
            % 保存
            output(count).epoch = t0_STK_UTCG; % UTCG
            output(count).type = xxNow{2}{1};
            output(count).state = cell2mat(xxNow(3:8))';
            output(count).dv = cell2mat(xxNow(9:11))';
            
            count = count + 1;
            
            tline = fgets(fid);
            
        end
        
        % 关闭文件
        fclose('all');
        
        % 返回
        return;
        
    end
    
end

end
