#!/bin/bash
# ============================================================
# OpenClaw 模型一键切换脚本
# 用法: ./switch-model.sh <模型名称>
# 示例: ./switch-model.sh v4pro
#       ./switch-model.sh mimo
#       ./switch-model.sh v4flash
# ============================================================

set -euo pipefail
CONFIG="/root/.openclaw/openclaw.json"
BACKUP_DIR="/root/.openclaw/config-backups"
AGENTS=("main")  # 需要切换的 agent 列表

usage() {
    echo "用法: $0 <模型名称>"
    echo ""
    echo "支持切换的目标模型:"
    echo "  v4pro    → DeepSeek V4 Pro (deepseek/deepseek-v4-pro)"
    echo "  v4flash  → DeepSeek V4 Flash (deepseek/deepseek-v4-flash)"
    echo "  mimo     → MiMo 2.5 Pro (xiaomicoding/mimo-v2.5-pro)"
    echo ""
    echo "示例: $0 v4pro"
    exit 1
}

[ $# -eq 0 ] && usage

MODEL_ARG="$1"

case "$MODEL_ARG" in
    v4pro)
        MODEL="deepseek/deepseek-v4-pro"
        LABEL="DeepSeek V4 Pro"
        ;;
    v4flash)
        MODEL="deepseek/deepseek-v4-flash"
        LABEL="DeepSeek V4 Flash"
        ;;
    mimo)
        MODEL="xiaomicoding/mimo-v2.5-pro"
        LABEL="MiMo 2.5 Pro"
        ;;
    *)
        echo "❌ 未知模型: $MODEL_ARG"
        usage
        ;;
esac

echo "📌 目标: $LABEL ($MODEL)"
echo "📌 涉及 agent: ${AGENTS[*]}"
echo ""

# 1. 备份
mkdir -p "$BACKUP_DIR"
BACKUP_FILE="$BACKUP_DIR/openclaw.json.$(date +%Y%m%d_%H%M%S)"
cp "$CONFIG" "$BACKUP_FILE"
echo "✅ 备份: $BACKUP_FILE"

# 2. 修改配置
python3 -c "
import json, sys
data = json.load(open('$CONFIG'))
data['agents']['defaults']['model'] = '$MODEL'
for agent in data['agents']['list']:
    if agent['id'] in ${AGENTS[@]}:
        agent['model'] = '$MODEL'
json.dump(data, open('$CONFIG','w'), indent=2, ensure_ascii=False)
"
echo "✅ 配置已更新: model → $MODEL"

# 3. 重启 gateway
echo "🔄 重启 Gateway..."
START=$(date +%s)
openclaw gateway restart 2>&1 | tail -3
sleep 3

# 4. 验证
ELAPSED=$(($(date +%s) - START))
if openclaw gateway status 2>&1 | head -5 | grep -q "systemd"; then
    echo "✅ Gateway 运行正常"
else
    echo "⚠️  Gateway 状态异常，请手动检查"
fi

echo ""
echo "🎉 切换完成!"
echo "   模型: $LABEL"
echo "   耗时: ${ELAPSED}秒"
echo "   备份: $BACKUP_FILE"
