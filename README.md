# Ground-based Optical Observation OD

地基光学观测下的 **轨道确定（Orbit Determination, OD）与精度评估** 工具集：从 MPC80 光学观测数据解析，到 CCSDS TDM 转换、ODTK 定轨场景自动配置、再到 STK 中对比“真实轨道”与定轨结果、计算误差与几何关系。

## 功能概览

- **MPC80 → TDM 转换**  
  - `READ_MPC80.m`：解析原始 MPC80 光学观测（含格式清洗与标准化）。  
  - `MPC2TDM.m`：将标准化的 MPC80 数据转换为符合 CCSDS 503.0-B-2 的 TDM 文件。  
  - `ground_station.txt` + `GetStationCoordinates.m`：根据 MPC80 中的测站代码查表经纬度。

- **基于 ODTK 的轨道确定流程**  
  - `main_odtk.m`：
    - 启动 ODTK HTTP 服务（例如端口 9494）；
    - 通过 `Client` 对象连接 ODTK；
    - 新建 Scenario、加载 TDM 测量文件；
    - 创建卫星对象与 TrackingSystem，配置测站、测量噪声与光学属性；
    - 运行滤波 / 最小二乘等解算流程（详见代码中后续段落）。

- **STK 中轨道对比与误差评估**  
  - `main_stk.m`：读取 ODTK 输出星历（`.e` 文件），在 STK 中创建 `SatLeader` / `SatFollower`，运行 Astrogator，输出目标卫星在 J2000 笛卡尔坐标下的轨迹与月球位置。  
  - `main_stk_dis.m`：
    - 同时加载 **定轨结果星历** 与 **“真实轨道”星历**（例如飞控或仿真参考轨道）；  
    - 使用 Astrogator 跟踪两条轨道，输出时间序列下的误差向量与距离；  
    - 同时提取太阳、月球位置，用于后续光照条件或观测几何分析。

- **流程与文档**  
  - `未命名绘图.drawio`：基于 draw.io 绘制的处理流程图，从“数据输入 → MPC80 提取与 TDM 生成 → 数据分段与短弧 LS → 长弧 LS 与残差分析等”。

## 目录结构（简要）

```text
Ground-based_Optical-Observation_OD/
├── [20260315]code/
│   └── [20260107]ODTK_code_yyj/
│       ├── main_odtk.m             # ODTK 场景配置与定轨主流程
│       ├── main_stk.m              # 在 STK 中读取 ODTK 星历并获取目标、月球状态
│       ├── main_stk_dis.m          # 定轨轨道 vs 真实轨道 距离评估
│       ├── READ_MPC80.m            # MPC80 解析与标准化
│       ├── MPC2TDM.m               # MPC80 → TDM 转换
│       ├── ground_station.txt      # 测站代码与经纬度表
│       ├── GetStationCoordinates.m # 由测站代码查经纬度
│       ├── obs/、obs2/             # 不同任务的 MPC80 光学观测样例
│       ├── ephemeris/              # 星历文件（ODTK 输出或真实轨道）
│       ├── STK/                    # STK 场景与配置文件
│       └── （其他工具函数与中间结果脚本）
├── 未命名绘图.drawio              # 流程图（draw.io）
└── .git/                           # Git 仓库配置
```

## 使用说明

### 1. 环境准备

- **MATLAB**：建议 R2019a 及以上。  
- **AGI ODTK 7.x**：安装并可通过 HTTP 服务访问（例如端口 9494），示例代码中默认路径 `C:\Program Files\AGI\ODTK 7\...`。  
- **AGI STK 12**：用于场景、星历读取与 Astrogator 轨道传播。  
- 确保 MATLAB 能通过 `actxserver('STK12.application')` 连接到 STK，通过 `Client('localhost', 9494)` 连接到 ODTK。

### 2. 从 MPC80 到 TDM

在 MATLAB 中切换到 `...[20260107]ODTK_code_yyj` 目录，按照示例修改文件名后运行：

```matlab
READ_MPC80('DROB_20251026_27.txt', 'MPC80_DROB_20251026_27.txt');
[targets, stations, mag, time] = MPC2TDM('MPC80_DROB_20251026_27.txt', ...
                                         'TDM_DROB_20251026_27.tdm');
```

生成的 TDM 文件将作为 ODTK 场景中的测量输入。

### 3. 在 ODTK 中进行光学定轨

1. 确保 ODTK 已启动并开启 HTTP 服务（端口与 `main_odtk.m` 中保持一致，如 9494）。  
2. 在 MATLAB 中运行 `main_odtk.m`：
   - 自动新建/清理 Scenario；
   - 加载 TDM 文件；
   - 创建卫星与测站（通过 `ground_station.txt` 查表）；
   - 配置测量噪声与光学属性（RA/Dec 精度、Bias/WhiteNoise 等）；
   - 运行滤波/最小二乘等定轨流程（视脚本中配置）。  
3. ODTK 将在其项目目录下生成滤波日志、统计结果与星历（`.e`）文件。

### 4. 在 STK 中对比定轨轨道与真实轨道

- 若只需查看定轨后的轨道与月球位置，可调用：

```matlab
[Target, Moon] = main_stk('path\to\odtk_ephemeris.e');
```

- 若需对比 **定轨结果** 与 **真实轨道** 的距离（OD 误差）：

```matlab
[dis, t, Sun, Moon, Target, Target_real] = main_stk_dis('path\to\odtk_ephemeris.e');
```

其中：

- `Target` 为 ODTK 定轨轨道（在 J2000 笛卡尔坐标下的时间序列）；  
- `Target_real` 为参考“真实轨道”（脚本中通过另一个 `.e` 文件加载）；  
- `dis` 为两条轨道之间的距离（可据此统计 OD 精度）；  
- `Sun`、`Moon` 为太阳与月球位置，用于分析光照条件和观测几何。

## 适用场景

本仓库适用于：

- 使用 **地基光学观测（MPC80）** 对深空或地月目标进行轨道确定；
- 在 ODTK 中快速配置光学测站与观测数据，评估不同测站/噪声配置对定轨精度的影响；
- 在 STK 中与“真实轨道”对比，直观评估定轨误差与观测几何；
- 教学或研究中演示“地基光学 OD 流程”的端到端示例。

## 许可与引用

用于科研与工程参考。若在论文或项目中使用本仓库工作成果，请注明来源；ODTK 与 STK 为 AGI/Ansys 商业软件，请遵守其许可协议。

