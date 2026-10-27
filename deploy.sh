#!/usr/bin/env bash
set -euo pipefail
# Morphicons npm 安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://www.morphicons.com
# 更新日期：2026-10-27
# 类型：script
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v git >/dev/null 2>&1 || { echo "需要先安装 Git"; exit 1; }
command -v node >/dev/null 2>&1 || { echo "需要先安装 Node.js"; exit 1; }

mkdir -p .download
cd .download

mkdir -p morphicons-demo && cd morphicons-demo
npm init -y
npm install morphicons
npm ls morphicons
echo "安装完成：import { MorphIcon } from 'morphicons/react' 即可使用"

echo ""

echo "安装完成：在 React 里 import { MorphIcon } from "morphicons/react"，配上 lucide 的图标数据即可使用"
echo "若结果异常或需要改配置，请参考官方文档：https://www.morphicons.com"
