function [longitude, latitude] = GetStationCoordinates(code)
% GETSTATIONCOORDINATES 根据站点代码提取经纬度信息
% 输入参数：
%   code - 站点代码（字符串或数字）
% 输出参数：
%   longitude - 经度（度）
%   latitude - 纬度（度）

% 将代码转换为字符串格式
if isnumeric(code)
    code_str = num2str(code);
else
    code_str = upper(strtrim(code));
end

% 确保代码是右对齐的（保持与文件中格式一致）
if length(code_str) < 3
    % 在左侧补空格
    code_str = [repmat(' ', 1, 3-length(code_str)), code_str];
end

% 读取文件
filename = 'ground_station.txt';
fid = fopen(filename, 'r');

% 检查文件是否成功打开
if fid == -1
    error('无法打开文件: %s', filename);
end

% 初始化变量
longitude = NaN;
latitude = NaN;
found = false;

% 逐行读取文件
while ~feof(fid)
    line = fgetl(fid);
    
    % 跳过空行
    if isempty(line)
        continue;
    end
    
    % 跳过标题行（包含"Code"的行）
    if contains(line, 'Code') && contains(line, 'Long.') && contains(line, 'cos')
        continue;
    end
    
    % 提取前3个字符作为站点代码
    if length(line) >= 3
        line_code = line(1:3);
        
        % 比较站点代码
        if strcmp(strtrim(line_code), strtrim(code_str))
            % 解析行内容 - 使用更灵活的方法
            % 首先找到前3个字符后的部分
            data_part = strtrim(line(4:end));
            
            % 使用正则表达式提取数字
            % 查找所有数字（包括小数和负数）
            numbers = regexp(data_part, '[-+]?\d*\.?\d+', 'match');
            
            if length(numbers) >= 3
                % 提取经度、cos和sin值
                lon_angle = str2double(numbers{1});
                cos_val = str2double(numbers{2});
                sin_val = str2double(numbers{3});
                
                % 检查数据有效性
                if ~isnan(lon_angle) && ~isnan(cos_val) && ~isnan(sin_val)
                    % 计算纬度（通过反正弦函数）
                    % 注意：sin_val是纬度的正弦值
                    latitude_rad = asin(sin_val);
                    latitude = rad2deg(latitude_rad);
                    
                    % 处理经度：文件中可能是0-360度表示，转换为-180到180度
                    % 如果经度大于180，则转换为负值（西经）
                    if lon_angle > 180
                        longitude = lon_angle - 360;
                    else
                        longitude = lon_angle;
                    end
                    
                    found = true;
                    break;
                end
            end
        end
    end
end

% 关闭文件
fclose(fid);

% 如果未找到站点，显示警告
if ~found
    warning('未找到站点代码: %s', code_str);
end
end