#!/usr/bin/env bash
# 同步仓库内容到已安装的 skill 目录。
# 安装是复制不是链接，改 SKILL.md / references 后必须跑一次本脚本才生效。
# 用法: ./sync.sh
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="$HOME/.workbuddy/skills/cv-forge"

if [ ! -d "$DEST" ]; then
  echo "目标目录不存在: $DEST（skill 尚未安装？）" >&2
  exit 1
fi

mkdir -p "$DEST/references"
cp "$SRC/SKILL.md"      "$DEST/SKILL.md"
cp "$SRC/README.md"     "$DEST/README.md"
cp "$SRC"/references/*.md "$DEST/references/"

echo "已同步 -> $DEST"
for f in SKILL.md README.md references/*.md; do
  diff -q "$SRC/$f" "$DEST/$f" >/dev/null && echo "  ok  $f"
done
