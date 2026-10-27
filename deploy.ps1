# Morphicons npm 安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://www.morphicons.com
# 更新日期：2026-10-27
# 类型：script
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw '需要先安装 Git' }
if (-not (Get-Command node -ErrorAction SilentlyContinue)) { throw '需要先安装 Node.js' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

New-Item -ItemType Directory -Force -Path morphicons-demo | Out-Null
Set-Location morphicons-demo
npm.cmd init -y
npm.cmd install morphicons
npm.cmd ls morphicons
Write-Host '安装完成：import { MorphIcon } from "morphicons/react" 即可使用'

Write-Host ''

Write-Host '安装完成：在 React 里 import { MorphIcon } from "morphicons/react"，配上 lucide 的图标数据即可使用'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://www.morphicons.com'
