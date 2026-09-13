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
