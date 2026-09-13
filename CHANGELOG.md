# CHANGELOG.md - 操作日志

> 所有智能体修改 tools-repo 后，必须在此记录。操作前必须先 git pull。

---

## 2026-05-07

### 15:27 - 青鸟
- 修改：index.html（三角函数卡片封面 🔄 → unit-circle-cover.svg）
- 修改：index.html（二次函数卡片封面 📈 → quadratic-cover.svg）
- 新增：unit-circle-cover.svg, quadratic-cover.svg

### 17:40 - 主智能体
- 修改：index.html（三角函数卡片 emoji 🔄 → unit-circle-cover.svg 引用）
- 修改：index.html（二次函数卡片 emoji 📈 → quadratic-cover.svg 引用）

### 17:55 - 主智能体
- 修改：quadratic-cover.svg（多段曲线拼接 → 单条二次贝塞尔曲线，平滑无折痕）

### 18:00 - 主智能体
- 新增：hero-banner.webp（600x600, q=80, 38.7KB）
- 修改：index.html（hero-banner.jpg → hero-banner.webp）
- 删除：hero-banner.jpg（137KB，已被 webp 替代）

### 19:27 - 主智能体
- 修改：quadratic-cover.svg（曲线平滑优化）
- 修改：index.html（hero-banner 引用更新）
- 删除：hero-banner.jpg

## 2026-05-10

### 07:38 - 主智能体
- 修改：unit-circle.html、quadratic.html（🎋 emoji → logo-36.png 图片，统一品牌 logo）

## 2026-09-13

### 13:55 - qingniao
- 新增：handshake-model.html（手拉手模型 · 全等三角形，八年级平面几何）
  - 共顶点两个等腰三角形，拖动/滑块旋转第二个三角形
  - 高亮显示全等三角形 △OAC ≌ △OBD，标注 AC=BD、∠AEB=顶角 α
  - 演示动画：△OAC 绕 O 旋转 α 后与 △OBD 重合（easeInOutCubic）
  - 预设：等边 60° / 等腰直角 90° / 顶角 120°；可调 α、θ、r₁、r₂
  - 已做像素级与数据级自检（无 JS 报错 / 360·390·844 三种视口无横向溢出 / 拖动旋转生效）
- 新增：handshake-model-cover.svg（首页卡片封面，640x400）
- 修改：index.html（工具网格首位置加入「手拉手模型」卡片；分类标签新增「平面几何」）

### 14:30 - qingniao
- 修改：handshake-model.html（新增「先猜后验」教学功能）
  - 🙈 隐藏辅助线 / 👀 揭晓答案：一键隐藏高亮全等三角形、AC、BD、交点 E、∠AEB、长度标注与全部读数，只留两个原始等腰三角形；核心结论卡片同步模糊遮罩
  - 💡 小灯泡：点击弹出思考题气泡（6 题题库，支持「换一题」「收起」），首题为「转起来之后，AC 和 BD 还相等吗？」
  - 演示重合 在隐藏态点击会自动先揭晓；toast 移至底部避开灯泡
  - 自检：隐藏态红色像素归零、模糊遮罩生效、气泡在 390/1280 视口均不越界、无 JS 报错

### 15:20 - qingniao
- 新增：one-line-three-angles.html（一线三等角 · 相似与全等，八年级平面几何）
  - 拖动 P（沿直线）或 A（沿射线）实时改变图形；三个等角用同色弧+等角刻线标出
  - 对应边 AB↔PC / BP↔CD / AP↔PD 用 1/2/3 道刻线锁定对应关系；面板实时显示三组比值（恒相等）
  - 🎯 调成全等（AB 动画调到 = PC）+ ▶ 演示重合（旋转+缩放+平移，全等时严丝合缝）
  - 预设：三垂直 90°(K型) / 等边 60° / 等腰直角 45°；沿用 🙈隐藏辅助线 + 💡小灯泡
  - 数学自检：任意参数下三角相等误差 1e-14；三组对应边比值恒相等；AB=PC ⇔ AP=PD；全等时刚体运动误差 1e-15
- 新增：one-line-three-angles-cover.svg（首页卡片封面，640x400）
- 修改：index.html（新增「一线三等角」卡片，网格首位）

### 16:35 - qingniao
- 修复：one-line-three-angles.html 预设形状与命名不符（宝华反馈「等腰直角 45° 角的度数不对、没画好」）
  - 根因：预设只改了 α，没有约束 p/r1 关系 → 45° 时 ∠A=87.28°、AB=2.00≠AP=1.91，并不是等腰直角三角形
  - 45° 预设改为 p = r1·√2 ⇒ ∠A = ∠DPC = 90.0°、AB=AP、PC=PD（两个等腰直角三角形，直角在 A 与 P）
  - 60° 预设改为 p = r1 ⇒ AB=BP=AP=PC=CD=PD（两个等边三角形，∠A=∠DPC=60°）
- 新增：直角符号（口）。α=90° 时三个等角自动由弧+刻线改画红色直角符号；派生直角（45° 预设的 ∠A、∠DPC）用蓝色直角符号
- 新增：核心结论卡新增「形状」行，自动识别并提示「等腰直角三角形 / 等边三角形」；小灯泡题库补两题（直角符号、45° 形状）
- 自检：200 组随机参数全通过（三等角=α 最大误差 4.3e-14；三组比值最大差 2.7e-15；∠A=∠DPC）；三个预设 DOM 读数与直角符号绘制点位（90°→B/P/C 三个红口，45°→A/P 两个蓝口）逐项核验通过
