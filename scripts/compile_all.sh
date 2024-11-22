#!/bin/bash

# 获取当前目录的绝对路径
ROOT_DIR=$(pwd)

EXCLUDES=(
  "./lib.typ"
)
EXCLUDE_CONDITION=""
for path in "${EXCLUDES[@]}"; do
  EXCLUDE_CONDITION="$EXCLUDE_CONDITION ! -path \"$path/*\""
done

# 遍历当前文件夹内的所有 .typ 文件
eval "find \"$ROOT_DIR\" -type f -name \"*.typ\" $EXCLUDE_CONDITION" | while read -r typ_file; do
  # 提取文件名（不包括路径）
  filename=$(basename "$typ_file")

  # 构造输出文件路径，将 .typ 替换为 .pdf，并放到 dist 文件夹中
  output_file="$ROOT_DIR/dist/${filename%.typ}.pdf"

  # 确保目标目录存在
  mkdir -p "$(dirname "$output_file")"

  # 执行 typst compile 命令
  typst compile --root "$ROOT_DIR" "$typ_file" "$output_file"

  # 打印处理信息
  echo "Compiled: $typ_file -> $output_file"
done
