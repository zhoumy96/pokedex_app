# 宝可梦图鉴应用 (Pokedex App)

一个使用 Flutter 和 GetX 构建的宝可梦图鉴应用程序。

## 项目概述

本项目是一个多平台的宝可梦信息查询应用，支持查看宝可梦、招式、道具、特性等信息。

---

## ✅ 已完成功能

### 1. 项目架构
- [x] Flutter 项目基础结构搭建
- [x] GetX 状态管理框架集成
- [x] 模块化目录结构（modules/routes/components/data）
- [x] 多平台支持配置（Android/iOS/Web/Windows/Linux/macOS）

### 2. 导航系统
- [x] 底部导航栏（5 个标签页）
  - [x] 图鉴
  - [x] 道具
  - [x] 招式
  - [x] 功能（特性）
  - [x] 关于
- [x] 路由配置（app_pages.dart, app_routes.dart）
- [x] Home 页面 IndexedStack 布局

### 3. 数据层
- [x] 宝可梦数据模型（PokemonItem, Pokemon）
- [x] 招式数据模型（PokemonMove）
- [x] 本地 JSON 数据服务
  - [x] PokeApiService - 宝可梦列表服务
  - [x] MoveApiService - 招式列表服务
- [x] 静态资源文件
  - [x] pokemon_full_list.json
  - [x] move_list.json
  - [x] ability_list.json
  - [x] 精灵图图片资源（normal.webp, shiny.webp, types.webp）

### 4. UI 组件
- [x] PokemonAvatar - 宝可梦头像组件（支持精灵图裁剪显示）
- [x] PokemonType - 属性类型标签组件
- [x] PokemonSearch - 搜索组件（代码已存在但被注释）

### 5. 图鉴模块 (Pokedex)
- [x] PokedexView - 宝可梦列表页面
- [x] PokedexController - 控制器
- [x] PokedexBinding - 依赖绑定
- [x] 宝可梦列表展示（名称、属性、编号、头像）
- [x] 从本地 JSON 加载宝可梦数据

### 6. 招式模块 (Moves)
- [x] MovesView - 招式列表页面
- [x] MovesController - 控制器
- [x] MovesBinding - 依赖绑定
- [x] 招式列表展示（名称、类型、分类、编号）
- [x] 从本地 JSON 加载招式数据
- [x] 列表项点击事件框架（未实现跳转）

---

## 📋 待完成功能 (TODO List)

### 🔴 高优先级

#### 1. 路由修复与页面启用
- [ ] 在 `app_pages.dart` 中取消注释所有页面路由
- [ ] 确保所有底部导航页面可正常访问

#### 2. 搜索功能
- [ ] 取消注释并完善 `PokemonSearch` 组件
- [ ] 在 PokedexController 中添加搜索逻辑
  - [ ] 添加 `searchQuery` 响应式变量
  - [ ] 实现 `clearSearch()` 方法
  - [ ] 实现按名称/编号过滤功能
- [ ] 在招式页面添加搜索功能

#### 3. 道具模块 (Items)
- [ ] 实现 ItemsView 完整 UI
- [ ] 创建 ItemsController
- [ ] 添加道具数据模型和服务
- [ ] 从 `ability_list.json` 或其他数据源加载道具数据
- [ ] 实现道具列表展示

#### 4. 特性模块 (Abilities)
- [ ] 实现 AbilitiesView 完整 UI
- [ ] 创建 AbilitiesController
- [ ] 添加特性数据模型和服务
- [ ] 从 `ability_list.json` 加载特性数据
- [ ] 实现特性列表展示

#### 5. 关于页面 (About)
- [ ] 实现 AboutView 完整 UI
- [ ] 添加应用信息
- [ ] 添加开发者信息
- [ ] 添加版本号显示
- [ ] 添加数据来源说明（PokeAPI）
- [ ] 添加开源许可证信息

### 🟡 中优先级

#### 6. 详情页功能
- [ ] 宝可梦详情页
  - [ ] 基本信息（身高、体重、捕获率）
  - [ ] 种族值展示
  - [ ] 特性列表
  - [ ] 招式学习列表
  - [ ] 进化链展示
  - [ ] 不同形态切换
- [ ] 招式详情页
  - [ ] 详细效果描述
  - [ ] PP/威力/命中展示
  - [ ] 学习该招式的宝可梦列表
- [ ] 道具详情页
- [ ] 特性详情页

#### 7. 筛选与排序
- [ ] 按属性筛选宝可梦
- [ ] 按世代筛选
- [ ] 按分类筛选招式
- [ ] 排序功能（编号/名称/种族值等）

#### 8. 收藏功能
- [ ] 实现本地收藏存储（使用 shared_preferences 或 hive）
- [ ] 收藏/取消收藏交互
- [ ] 收藏列表页面
- [ ] 收藏数据持久化

#### 9. 网络 API 集成
- [ ] 集成 PokeAPI 在线数据
- [ ] 实现缓存策略
- [ ] 离线模式支持
- [ ] 数据同步更新机制

### 🟢 低优先级

#### 10. UI/UX 优化
- [ ] 添加页面过渡动画
- [ ] 添加加载骨架屏
- [ ] 优化图片加载性能
- [ ] 深色主题支持
- [ ] 响应式布局优化（平板/桌面）

#### 11. 高级功能
- [ ] 宝可梦对比功能
- [ ] 队伍构建器
- [ ] 招式伤害计算器
- [ ] 属性克制关系图
- [ ] 多语言支持（中文/日文/英文切换）

#### 12. 测试与质量
- [ ] 单元测试
- [ ] Widget 测试
- [ ] 集成测试
- [ ] 性能优化
- [ ] 内存泄漏检测

#### 13. 发布准备
- [ ] 应用图标
- [ ] 启动屏
- [ ] 隐私政策
- [ ] 应用商店描述
- [ ] CI/CD 配置

---

## 🛠️ 技术栈

- **框架**: Flutter 3.x
- **状态管理**: GetX
- **架构模式**: MVVM
- **数据存储**: 本地 JSON / (待定：Hive, SharedPreferences)
- **网络**: (待定：Dio, http)
- **API**: PokeAPI (可选)

---

## 📁 项目结构

```
lib/
├── app/
│   ├── modules/          # 功能模块
│   │   ├── home/         # 主页
│   │   ├── pokedex/      # 图鉴
│   │   ├── items/        # 道具
│   │   ├── moves/        # 招式
│   │   ├── abilities/    # 特性
│   │   └── about/        # 关于
│   ├── routes/           # 路由配置
│   ├── components/       # 通用组件
│   ├── data/             # 数据层
│   │   ├── models/       # 数据模型
│   │   └── services/     # 数据服务
│   └── bindings/         # 依赖绑定
└── main.dart             # 入口文件
```

---

## 🚀 快速开始

```bash
# 安装依赖
flutter pub get

# 运行应用
flutter run

# 构建发布版本
flutter build apk --release  # Android
flutter build ios --release  # iOS
```

---

## 📄 许可证

MIT License

---

## 🙏 致谢

- 数据来源于 [PokeAPI](https://pokeapi.co/)
- 宝可梦图片版权归 Nintendo/Creatures Inc./GAME FREAK inc. 所有
