<<<<<<< HEAD
# Ground-based_Optical-Observation_OD
基于地面望远镜对DRO卫星进行了光学特性分析与轨道测定
=======
# 轨道确定（OD）与测控仿真

基于 **ODTK（Orbit Determination Tool Kit）** 的轨道确定流程与 **FEIKONG 飞行测控** 仿真：TDM 观测数据、STK 场景、ODTK 场景与滤波配置，支持地月 DRO 等任务的定轨与测控节点循环仿真。

## 项目简介

本仓库汇总轨道确定（OD）相关工程与文档：包括 ODTK 场景的创建与载入、TDM 测量文件配置、与 STK 联合的飞行测控流程（FEIKONG V1.0），以及 DROA 等任务的星箭分离、机动节点与打靶逻辑。

## 主要功能

- **ODTK 集成**：新建/载入 ODTK 场景、测量文件（TDM）、卫星与力学模型配置
- **FEIKONG 测控流程**：STK 场景载入、ODTK 定轨开关、姿态注入、按 BCMC 节点循环、DROA 初值注入、脉冲/连续推力打靶
- **TDM 与输入**：TDM 格式观测数据、任务输入文件（如 PC-XXX、JLGH 等命名规范）
- **重启与日志**：ODTK 滤波重启文件（Restart）、FilterLog 等
- **文档与资源**：TDM 说明、ODTK 开发与使用文档、流程图（drawio）等

## 技术栈

- **MATLAB**：主控脚本、ODTK API、STK 接口、打靶与节点逻辑
- **ODTK**：AGI ODTK 7.x（需单独安装并启动）
- **STK**：场景、卫星、姿态与轨道可视化
- **数据**：TDM、输入/输出目录、ODTK_Scen、STK_Scen

## 目录结构概览

```
OD/
├── [20240102]_ODTK_kaifa/                    # ODTK 开发与 FEIKONG
│   └── [20240102]_ODTK_kaifa/
│       └── [20230822]_FEIKONG_V1.0/         # 飞行测控 1.0
│           ├── MAIN_FEIKONG.m                # 主入口
│           ├── MAIN_LaunchODTK.cmd           # 启动 ODTK
│           ├── README.txt
│           ├── input/                        # 输入 TDM/任务文件
│           ├── ODTK_Scen/                    # ODTK 场景、滤波、重启
│           └── tools, output, STK_Scen
├── [20260107]ODTK_code_yyj/                 # 后续 ODTK 代码与 STK
├── [20260128]ODTK开发说明.pdf 等文档
├── README.md
└── （.zip/.rar 归档、.drawio 流程图等）
```

## 使用说明

1. **环境**  
   - 安装 **STK 11.6** 与 **ODTK 7.2**（或兼容版本），确保 ODTK 可被命令行/脚本启动。

2. **运行 FEIKONG 流程**  
   - 双击 `MAIN_LaunchODTK.cmd` 启动 ODTK。  
   - 在 MATLAB 中运行 `MAIN_FEIKONG.m`：载入 STK/ODTK 场景、配置定轨、按节点执行打靶与递推。  
   - 依赖 `tools`、`input`、`ODTK_Scen`、`STK_Scen` 等路径与辅助脚本（如 `ReadAux`、`STK_LoadScen`、`ODTK_LoadScen`）。

3. **其他 ODTK 代码**  
   - `[20260107]ODTK_code_yyj` 等目录包含更新的定轨脚本与 STK 配置，用法见各目录内注释。

4. **文档**  
   - 仓库内 PDF、docx、drawio 等为需求、总结与流程图，供开发与交接参考。

## 依赖

- MATLAB
- AGI STK 11.6+
- AGI ODTK 7.2+

## 许可与引用

内部研发与项目使用。若引用或二次开发，请注明出处。
>>>>>>> cf52bee (initial commit)
