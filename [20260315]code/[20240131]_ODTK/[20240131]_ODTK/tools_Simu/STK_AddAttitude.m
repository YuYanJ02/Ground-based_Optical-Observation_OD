
%%%%%%%%%%%%%%%%%%%%%%%%
%
% 根据三星建链规划，配置三星姿态
%
% 作者：张晨
% 邮箱：chenzhang@csu.ac.cn
% 单位：中国科学院空间应用工程与技术中心，空间探索室
% 时间：2023年04月27日
%%%%%%%%%%%%%%%%%%%%%%%%

% 读取建链规划文件
JLGH = ReadJLGH([pwd , '\input'] , 'PC-XXX_XXX_X_JLGH_XXX_0C_20230720000000_20230720000000_20230719160244_XXX.txt');

% ============= 重置三星姿态 =============
% 重置DROA姿态
DROA.SetAttitudeType('eAttitudeStandard');
DROA.SetAttitudeType('eAttitudeStandard');
DROA.Attitude.Basic.SetProfileType('eProfileNadirAlignmentWithSunConstraint');

% 重置DROB姿态
DROB.SetAttitudeType('eAttitudeStandard');
DROB.SetAttitudeType('eAttitudeStandard');
DROB.Attitude.Basic.SetProfileType('eProfileNadirAlignmentWithSunConstraint');

% 重置DROL姿态
DROL.SetAttitudeType('eAttitudeStandard');
DROL.SetAttitudeType('eAttitudeStandard');
DROL.Attitude.Basic.SetProfileType('eProfileNadirAlignmentWithSunConstraint');

% ============= 循环建链时段 =============
for nLoop = 1 : size(JLGH , 1)
    
    % 三星组网链路规划类型（1~8）
    LinkScn = JLGH{nLoop}.LinkScn;
    
    % 组网开始时间
    LinkStartTime = converter.ConvertDate('JED' , 'LCLG' , num2str(aux.t0_JED_20060101 + JLGH{nLoop}.LinkStartTime / 86400));
    LinkStopTime = converter.ConvertDate('JED' , 'LCLG' , num2str(aux.t0_JED_20060101 + JLGH{nLoop}.LinkStopTime / 86400));
    LinkTof = JLGH{nLoop}.LinkTof;
    
    if LinkScn == 1
        % 修改DROL姿态
        
        % L(+Z) -> A(Center)
        command_L2A = ['AttitudeSegment */Satellite/DROL Add Profile ' ,'JLGH_seg' , num2str(nLoop) ,...
            ' "' , LinkStartTime , '" ' , 'AlignConstrain Axis 0 0 1 "Satellite/DROL DROA" Axis 1 0 0 "Satellite/DROL Sun" SlewTime 0'];
        root.ExecuteCommand(command_L2A);
        
    elseif LinkScn == 2
        % 修改DROL姿态
        
        % L(+Z) -> A(Center)
        command_L2A = ['AttitudeSegment */Satellite/DROL Add Profile ' ,'JLGH_seg' , num2str(nLoop) ,...
            ' "' , LinkStartTime , '" ' , 'AlignConstrain Axis 0 0 1 "Satellite/DROL DROA" Axis 1 0 0 "Satellite/DROL Sun" SlewTime 0'];
        root.ExecuteCommand(command_L2A);
        
    elseif LinkScn == 3
        % 修改DROL姿态
        
        % L(+Z) -> A(Center)
        command_L2A = ['AttitudeSegment */Satellite/DROL Add Profile ' ,'JLGH_seg' , num2str(nLoop) ,...
            ' "' , LinkStartTime , '" ' , 'AlignConstrain Axis 0 0 1 "Satellite/DROL DROA" Axis 1 0 0 "Satellite/DROL Sun" SlewTime 0'];
        root.ExecuteCommand(command_L2A);
        
    elseif LinkScn == 4
        % 修改DROL姿态
        
        % L(+Z) -> B(Center)
        command_L2B = ['AttitudeSegment */Satellite/DROL Add Profile ' ,'JLGH_seg' , num2str(nLoop) ,...
            ' "' , LinkStartTime , '" ' , 'AlignConstrain Axis 0 0 1 "Satellite/DROL DROB" Axis 1 0 0 "Satellite/DROL Sun" SlewTime 0'];
        root.ExecuteCommand(command_L2B);
        
    elseif LinkScn == 5
        % 修改DROA和DROL姿态
        
        % A(+Z) -> B(Center)
        command_A2B = ['AttitudeSegment */Satellite/DROA Add Profile ' ,'JLGH_seg' , num2str(nLoop) ,...
            ' "' , LinkStartTime , '" ' , 'AlignConstrain Axis 0 0 1 "Satellite/DROA DROB" Axis 1 0 0 "Satellite/DROA Sun" SlewTime 0'];
        root.ExecuteCommand(command_A2B);
        
        % L(+Z) -> B(Center)
        command_L2B = ['AttitudeSegment */Satellite/DROL Add Profile ' ,'JLGH_seg' , num2str(nLoop) ,...
            ' "' , LinkStartTime , '" ' , 'AlignConstrain Axis 0 0 1 "Satellite/DROL DROB" Axis 1 0 0 "Satellite/DROL Sun" SlewTime 0'];
        root.ExecuteCommand(command_L2B);
        
    elseif LinkScn == 6
        % 修改DROB和DROL姿态
        
        % B(-X) -> A(Center)
        command_B2A = ['AttitudeSegment */Satellite/DROB Add Profile ' ,'JLGH_seg' , num2str(nLoop) ,...
            ' "' , LinkStartTime , '" ' , 'AlignConstrain Axis -1 0 0 "Satellite/DROB DROA" Axis 1 0 0 "Satellite/DROB Sun" SlewTime 0'];
        root.ExecuteCommand(command_B2A);
        
        % L(+Z) -> A(Center)
        command_L2A = ['AttitudeSegment */Satellite/DROL Add Profile ' ,'JLGH_seg' , num2str(nLoop) ,...
            ' "' , LinkStartTime , '" ' , 'AlignConstrain Axis 0 0 1 "Satellite/DROL DROA" Axis 1 0 0 "Satellite/DROL Sun" SlewTime 0'];
        root.ExecuteCommand(command_L2A);
        
    elseif LinkScn == 7
        % 修改DROL姿态
        
        % L(+Z) -> A(Center)
        command_L2A = ['AttitudeSegment */Satellite/DROL Add Profile ' ,'JLGH_seg' , num2str(nLoop) ,...
            ' "' , LinkStartTime , '" ' , 'AlignConstrain Axis 0 0 1 "Satellite/DROL DROA" Axis 1 0 0 "Satellite/DROL Sun" SlewTime 0'];
        root.ExecuteCommand(command_L2A);
        
    elseif LinkScn == 8
        % 修改DROL姿态
        
        % L(+Z) -> A(Center)
        command_L2A = ['AttitudeSegment */Satellite/DROL Add Profile ' ,'JLGH_seg' , num2str(nLoop) ,...
            ' "' , LinkStartTime , '" ' , 'AlignConstrain Axis 0 0 1 "Satellite/DROL DROA" Axis 1 0 0 "Satellite/DROL Sun" SlewTime 0'];
        root.ExecuteCommand(command_L2A);
        
    else
        
        sprintf('错误！LinkScn不是1~8 \n')
        
    end
    
end

fprintf('STK: 卫星姿态更新 \n')
