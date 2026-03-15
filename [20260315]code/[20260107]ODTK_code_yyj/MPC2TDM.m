

function [targets,stations,mag,time] = MPC2TDM(input_file, output_file)
    % MPC80格式数据转换为CCSDS TDM格式（符合CCSDS 503.0-B-2标准）
    
    % 读取MPC80数据
    fid = fopen(input_file, 'r');
    lines = textscan(fid, '%s', 'Delimiter', '\n');
    fclose(fid);
    lines = lines{1};
    
    % 收集所有观测数据
    observations = {};
    earliest_time = Inf;
    latest_time = -Inf;
    
    % 处理每条观测记录
    for i = 1:length(lines)
        line = strtrim(lines{i});
        if isempty(line), continue; end
        
        % 解析MPC80格式
        parts = strsplit(line);
        
        if length(parts) >= 11  % 最小长度：目标编号到赤纬秒共11个字段
            target_id = parts{1};
            
            % 提取年份
            obs_type_year = parts{3};
            year_str = obs_type_year(1:end);
            year = str2double(year_str);
          
            month = str2double(parts{4});
            day_frac = str2double(parts{5});
            
            % 赤经
            ra_h = str2double(parts{6});
            ra_m = str2double(parts{7});
            ra_s = str2double(parts{8});
            ra_deg = (ra_h + ra_m/60 + ra_s/3600) * 15;
            
            % 赤纬
            dec_str = parts{9};
            dec_d = abs(str2double(dec_str));
            dec_m = str2double(parts{10});
            dec_s = str2double(parts{11});
            dec_deg = (dec_d + dec_m/60 + dec_s/3600);
            if dec_str(1) == '-'
                dec_deg = -dec_deg;
            end
            
            % 星等和波段（可能不存在）
            mag = NaN;
            band = '';
            station_code = '';
            
            % 检查星等是否存在
            if length(parts) >= 12
                possible_mag = str2double(parts{12});
                if ~isnan(possible_mag)
                    mag = possible_mag;
                    
                    if length(parts) >= 13
                        if length(parts{13}) <= 2 && all(isletter(parts{13}))
                            band = parts{13};
                            
                            if length(parts) >= 14
                                station_code = parts{14};
                            end
                        else
                            station_code = parts{13};
                        end
                    end
                else
                    station_code = parts{12};
                end
            end
            
            % 如果还没有找到观测站代码，检查最后一个部分
            if isempty(station_code)
                for j = length(parts):-1:1
                    % 检查是否符合观测站代码格式
                    if (~isempty(regexp(parts{j}, '[A-Za-z]\d+', 'once')) || ...
                        ~isempty(regexp(parts{j}, '\d{3}', 'once'))) && ...
                       length(parts{j}) <= 4  % 通常观测站代码不超过4个字符
                        station_code = parts{j};
                        break;
                    end
                end
            end
            
            % 如果仍然没有找到，使用默认值
            if isempty(station_code)
                station_code = 'UNKN';
            end
            
            % 转换时间
            iso_time = mpc_time_to_iso(year, month, day_frac);
            
            % 转换时间戳为数值格式用于比较
            try
                time_num = posixtime(datetime(iso_time, 'InputFormat', 'yyyy-MM-dd''T''HH:mm:ss.SSSSSS'));
                
                earliest_time = min(earliest_time, time_num);
                latest_time = max(latest_time, time_num);
            catch
                if isinf(earliest_time)
                    earliest_time = posixtime(datetime(now, 'ConvertFrom', 'datenum'));
                    latest_time = earliest_time;
                end
            end
            
            % 保存观测数据
            obs.time = iso_time;
            obs.ra_deg = ra_deg;
            obs.dec_deg = dec_deg;
            obs.mag = mag;
            obs.band = band;
            obs.station = station_code;
            obs.target = target_id(1:7);
            
            observations{end+1} = obs;
        end
    end
    
    if isempty(observations)
        error('没有找到有效的观测数据');
    end
    

    mag = {};
    time = {};
    for i = 1:length(observations)
        obs = observations{i};
        if obs.mag <= 30
            mag{end+1} = obs.mag;
        else
            mag{end+1} = nan;
        end
        time{end+1} = obs.time;
    end
time = datetime(time, 'InputFormat', 'yyyy-MM-dd''T''HH:mm:ss.SSSSSS');
    % 按观测站分组（使用元胞数组，避免字段名问题）
    stations = {};
    station_data = {};  % 元胞数组，每个元素是对应站点的观测数据列表
    
    for i = 1:length(observations)
        obs = observations{i};
        station = obs.station;
        
        % 查找站点是否已存在
        station_idx = find(strcmp(stations, station));
        
        if isempty(station_idx)
            % 新站点
            stations{end+1} = station;
            station_data{end+1} = {obs};  % 创建新的观测列表
        else
            % 已有站点，添加到对应列表
            station_data{station_idx}{end+1} = obs;
        end
    end

        targets = {};
    target_data = {};  % 元胞数组，每个元素是对应站点的观测数据列表
    
    for i = 1:length(observations)
        obs = observations{i};
        target = obs.target;
        
        % 查找站点是否已存在
        station_idx = find(strcmp(targets, target));
        
        if isempty(station_idx)
            % 新站点
            targets{end+1} = target(1:7);
            target_data{end+1} = {obs};  % 创建新的观测列表
        else
            % 已有站点，添加到对应列表
            target_data{station_idx}{end+1} = obs;
        end
    end
    
    % 创建TDM文件
    fid_tdm = fopen(output_file, 'w');
    
    % TDM头部
    fprintf(fid_tdm, 'CCSDS_TDM_VERS = 2.0\r\n');
    fprintf(fid_tdm, 'CREATION_DATE = %s\r\n', datestr(now, 'yyyy-mm-ddTHH:MM:SS.FFF'));
    fprintf(fid_tdm, 'ORIGINATOR = MPC80_TO_TDM\r\n');
    fprintf(fid_tdm, 'COMMENT Generated from MPC80 optical observations\r\n');
    fprintf(fid_tdm, '\r\n');
    
    % 为每个观测站创建一个段
    for s = 1:length(stations)
        station = stations{s};
        obs_list = station_data{s};
        
        % 计算该观测站的时间范围
        station_earliest = Inf;
        station_latest = -Inf;
        for i = 1:length(obs_list)
            obs = obs_list{i};
            time_num = posixtime(datetime(obs.time, 'InputFormat', 'yyyy-MM-dd''T''HH:mm:ss.SSSSSS'));
            station_earliest = min(station_earliest, time_num);
            station_latest = max(station_latest, time_num);
        end
        
        start_dt = datetime(station_earliest, 'ConvertFrom', 'posixtime', 'Format', 'yyyy-MM-dd''T''HH:mm:ss.SSSSSS');
        stop_dt = datetime(station_latest, 'ConvertFrom', 'posixtime', 'Format', 'yyyy-MM-dd''T''HH:mm:ss.SSSSSS');
        
        % META段开始
        fprintf(fid_tdm, 'META_START\r\n');
        
        % 元数据部分
        fprintf(fid_tdm, 'TIME_SYSTEM = UTC\r\n');
        fprintf(fid_tdm, 'START_TIME = %s\r\n', char(start_dt));
        fprintf(fid_tdm, 'STOP_TIME = %s\r\n', char(stop_dt));
        fprintf(fid_tdm, 'PARTICIPANT_1 = %s\r\n', station);
        fprintf(fid_tdm, 'PARTICIPANT_2 = %s\r\n', obs_list{1}.target);
        fprintf(fid_tdm, 'MODE = SEQUENTIAL\r\n');
        fprintf(fid_tdm, 'PATH = 2,1\r\n');
        fprintf(fid_tdm, 'ANGLE_TYPE = RADEC\r\n');
        fprintf(fid_tdm, 'REFERENCE_FRAME = EMEJ2000\r\n');
        fprintf(fid_tdm, 'DATA_QUALITY = VALIDATED\r\n');
        fprintf(fid_tdm, 'META_STOP\r\n');
        fprintf(fid_tdm, '\r\n');
        
        % DATA段开始
        fprintf(fid_tdm, 'DATA_START\r\n');
        
        % 写入该观测站的所有数据
        for i = 1:length(obs_list)
            obs = obs_list{i};
            
            % 添加星等信息到注释
            if ~isnan(obs.mag) && ~isempty(obs.band)
                fprintf(fid_tdm, 'COMMENT Mag=%.1f, Band=%s\r\n', obs.mag, obs.band);
            elseif ~isnan(obs.mag)
                fprintf(fid_tdm, 'COMMENT Mag=%.1f\r\n', obs.mag);
            elseif ~isempty(obs.band)
                fprintf(fid_tdm, 'COMMENT Band=%s\r\n', obs.band);
            end
            
            % 写入角度数据
            fprintf(fid_tdm, 'ANGLE_1 = %s %.8f\r\n', obs.time, obs.ra_deg);
            fprintf(fid_tdm, 'ANGLE_2 = %s %.8f\r\n', obs.time, obs.dec_deg);
        end
        
        fprintf(fid_tdm, 'DATA_STOP\r\n');
        fprintf(fid_tdm, '\r\n');
    end
    
    fclose(fid_tdm);
    
    fprintf('转换完成！\n');
    fprintf('生成文件: %s\n', output_file);
    fprintf('总观测数量: %d\n', length(observations));
    fprintf('观测站数量: %d\n', length(stations));
    fprintf('观测站列表: %s\n', strjoin(stations, ', '));


    plot_observations_over_time(observations);
end

function iso_time = mpc_time_to_iso(year, month, day_fraction)
    % 将MPC时间转换为ISO 8601格式
    day = floor(day_fraction);
    fraction = day_fraction - day;
    
    total_seconds = fraction * 86400;
    hours = floor(total_seconds / 3600);
    minutes = floor(mod(total_seconds, 3600) / 60);
    seconds = mod(total_seconds, 60);
    
    % 格式化为ISO 8601，保留6位小数
    iso_time = sprintf('%04d-%02d-%02dT%02d:%02d:%09.6f', ...
                       year, month, day, hours, minutes, seconds);
end


function plot_observations_over_time(observations)
    % 简化的观测数据分布图
    
    % 准备数据
    times = cell(length(observations), 1);
    ra_values = zeros(length(observations), 1);
    dec_values = zeros(length(observations), 1);
    
    for i = 1:length(observations)
        obs = observations{i};
        times{i} = obs.time;
        ra_values(i) = obs.ra_deg;
        dec_values(i) = obs.dec_deg;
    end
    
    % 将时间转换为datetime对象
    dt_times = datetime(times, 'InputFormat', 'yyyy-MM-dd''T''HH:mm:ss.SSSSSS');
    
    % 创建图形
    figure('Position', [100, 100, 1000, 500]);
    
    % 绘制左纵轴（赤经）
    yyaxis left;
    scatter(dt_times, ra_values, 40, 'b', 'filled');
    ylabel('赤经 Right Ascension (°)', 'FontName', 'Times New Roman','FontSize', 12, 'FontWeight', 'bold');
    ylim([min(ra_values)-1, max(ra_values)+1]);
    
    % 绘制右纵轴（赤纬）
    yyaxis right;
    scatter(dt_times, dec_values, 40, 'r', 's', 'filled');
    ylabel('赤纬 Declination (°)', 'FontName', 'Times New Roman','FontSize', 12, 'FontWeight', 'bold');
    ylim([min(dec_values)-1, max(dec_values)+1]);
    
    % 设置图形属性
    xlabel('观测时间 Observation Time', 'FontName', 'Times New Roman','FontSize', 12, 'FontWeight', 'bold');
    %title('观测数据随时间分布图', 'FontSize', 14, 'FontWeight', 'bold');
    grid on;
    
    % 改进时间轴显示
    % 改进时间轴显示
    datetick('x', 'dd-mmm-yyyy HH:MM', 'keepticks');
    xtickangle(45);
    
    % 添加图例
    legend({'赤经 (RA)', '赤纬 (Dec)'},'FontName', 'Times New Roman', 'Location', 'best');
    
    % % 添加标注
    % text(0.02, 0.98, sprintf('观测总数: %d', length(observations)), ...
    %      'Units', 'normalized', 'VerticalAlignment', 'top', ...
    %      'BackgroundColor', 'white', 'FontSize', 10);
end
