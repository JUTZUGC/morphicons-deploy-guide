# Morphicons npm 安装指南

> 第三方部署指南 · 非 Morphicons 官方仓库。官方项目：[guillermolg00/morphicons](https://github.com/guillermolg00/morphicons)
> 内容来自官方文档（2026-10-27）。项目迭代快，请以[官方文档](https://www.morphicons.com)为准。

[![⚡ npm 安装](https://img.shields.io/badge/%E2%9A%A1_npm_%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#npm安装推荐用百度搭子)

## npm 安装（推荐：用百度搭子）

> [!TIP]
> 想让菜单图标开合时平滑变形？让百度搭子把 Morphicons 装进项目，改一个 prop 就有弹簧动效。

⚠️ 这是一个前端图标动效库，不是一个能直接打开的软件。需要你已经有前端工程（React / Vue / Svelte / Astro），并且图标要传「数据」而不是组件。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/morphicons-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子在你的项目里执行 npm install morphicons，装完用 npm ls 确认版本，按它的提示确认即可，结束时它会告诉你结果。
   （需本机已装 Git；构建依赖以官方文档为准。）



## Morphicons 是什么？

Morphicons 是开源的3.0k stars，MIT，任意 SVG 图标互相变形，弹簧物理，零运行时依赖 ~7 KB gzip（协议：MIT，<img src="https://img.shields.io/github/stars/guillermolg00/morphicons?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

把任意描边或填充的 SVG 图标平滑变形为另一个图标，用弹簧物理做插值。兼容 Lucide、Tabler、Heroicons、Material Symbols、Phosphor 或你自己的 path。

- 3.0k stars：2026-08 建仓，两个月破三千
- 零运行时依赖：核心只有 6.7 KB gzip
- 任意图标互变：描边与填充都支持，颜色跟随形状
- 多框架：React / Vue / Svelte / Astro / React Native / 原生 DOM
- 弹簧物理：snappy / smooth / bouncy 三档预设，也可自定义刚度与阻尼
- SSR 友好：服务端直接渲染终态 SVG，水合不闪

（来源：[官方仓库](https://github.com/guillermolg00/morphicons)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 3.0k stars | 2026-08 建仓，两个月破三千 |
| 零依赖 | 核心不引任何运行时依赖 |
| 体积小 | 6.7 KB gzip，CI 强制不超标 |
| 多框架 | React / Vue / Svelte / Astro / RN 都有绑定 |
| 弹簧物理 | 三档预设，也可自己调刚度阻尼 |
| SSR 友好 | 服务端渲染终态，水合不闪 |

| 需要注意 | 说明 |
|---|---|
| 不是应用 | 得有前端工程才能用 |
| 图标要同构 | 网格不一致需要 fitIcon 缩放 |
| 只支持 SVG | 位图图标无法变形 |
| 填充图标额外体积 | 首次多加载 5.4 KB |
| 项目较新 | 2026-08 建仓，API 仍可能变 |

> 以上基于官方文档与社区反馈整理（2026-10-27），以官方最新文档为准。

## 快速部署（官方方式）

```bash
mkdir -p morphicons-demo && cd morphicons-demo
npm init -y
npm install morphicons
npm ls morphicons
echo "安装完成：import { MorphIcon } from 'morphicons/react' 即可使用"
```

部署步骤来源：[https://github.com/guillermolg00/morphicons#install](https://github.com/guillermolg00/morphicons#install)

## 验证状态

| 场景 | 状态 |
|---|---|
| npm install morphicons 实测成功，装到 v2.0.2（Windows / Node 22.14.0，耗时 2 秒） | 已实测 2026-10-27 |
| 实测 import('morphicons') 导出 SPRING_PRESETS / Spring / buildPlan / fitIcon / iconToCubics 等 11 个符号 | 已实测 2026-10-27 |
| 实测 import('morphicons/dom') 导出 createMorph / preloadRegion / setRegionLoader 等 5 个符号 | 已实测 2026-10-27 |
| package.json 确认 exports 含 . / dom / adapters / region / react / vue / svelte / element / astro / react-native 十个入口 | 已核对 2026-10-27 |
| 仓库元数据核对：3,042 stars、95 forks、MIT、2026-08-01 建仓，最新 release v2.0.2 | 已核对 2026-10-27 |
| 未实测浏览器内动效渲染与填充图标懒加载 | 说明 2026-10-27 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

Morphicons 不是 MCP server，是一个前端组件库；本仓库只负责安装与示例，不注册 MCP。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-27）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\morphicons-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 怎么用

### React

```tsx
import { MorphIcon } from "morphicons/react";
import { Menu, X } from "lucide"; // 图标数据，不是组件

<MorphIcon icon={open ? X : Menu} />;
```

改 `icon` 这个 prop，图标自己就变形了，不用配其它东西。

### Vue / Svelte

```vue
<MorphIcon :icon="open ? X : Menu" />
```

```svelte
<MorphIcon icon={open ? X : Menu} />
```

### 纯 HTML

```html
<script type="module">
  import { defineMorphIcon } from "morphicons/element";
  defineMorphIcon();
</script>

<morph-icon icon="M4 6h16M4 12h16M4 18h16" label="Menu"></morph-icon>
```

---

### 三种驱动方式

| 方式 | 写法 |
|---|---|
| 改 prop 自动动画 | `<MorphIcon icon={open ? X : Menu} />` |
| 自己控制进度 | `<MorphIcon from={Menu} to={X} progress={0.4} />` |
| 命令式调用 | `ref.current.morphTo(X)`，`set(X)` 直接跳 |

### 常用参数

| 参数 | 说明 |
|---|---|
| `size` / `color` / `strokeWidth` | 与 lucide-react 一致 |
| `spring` | `snappy`（默认）/ `smooth` / `bouncy`，或 `{ stiffness, damping }` |
| `reducedMotion` | `never` / `user` / `always` |
| `label` | 无障碍名称，不填则 `aria-hidden` |

### 各框架入口与体积

| 入口 | 用途 | gzip |
|---|---|---|
| `morphicons` | 纯核心，无 DOM | 6.7 KB |
| `morphicons/dom` | `createMorph()`，无框架 | 9.3 KB |
| `morphicons/react` | React 组件 | 10.2 KB |
| `morphicons/vue` | Vue 3 组件 | 10.3 KB |
| `morphicons/svelte` | Svelte 5 组件 | 9.9 KB |
| `morphicons/element` | `<morph-icon>` 自定义元素 | 11.1 KB |
| `morphicons/react-native` | 移动端 | 15.9 KB |

### 填充图标

当任意一侧是填充图标时，两边都按填充形状变形。这部分代码（5.4 KB gzip）在第一次遇到填充图标时才下载，纯描边应用不会加载。

> ⚠️ 图标要传数据：用 Lucide 时从 `lucide` 导入，不要从 `lucide-react` 导入组件。不是 24×24 网格的图标用 `fitIcon(icon, 32)` 或 `svgToIcon` 适配。

## 常见坑

- 图标不动：Lucide 要从 `lucide` 导入图标数据，不要从 `lucide-react` 导入组件
- peer 版本不满足：Vue 需 >=3.3、Svelte >=5、React >=18
- React Native 报 exports 错：需要 Metro 支持 package exports（0.79+ 默认开启）
- 图标尺寸不对：非 24×24 网格用 `fitIcon(icon, 32)` 或 `svgToIcon` 适配
- 填充图标首次卡顿：提前调用 `preloadRegion()` 预加载
- 改了 prop 没动画：确认没有同时传 `from` / `to`，它们会覆盖 `icon`

## 免责声明

本仓库为第三方指南，与 Morphicons 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-27），项目迭代快，请以[官方文档](https://www.morphicons.com)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
