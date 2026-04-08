---
name: omni-memory
version: 1.0.0
description: "终极AI Agent记忆系统 - 融合上下文压缩、向量检索、自我学习与进化、工作流优化于一体。提供6层记忆架构、智能任务工作流、自动经验提炼等能力。"
author: AI Agent Memory Integration
keywords: [memory, agent, context-compression, vector-search, self-learning, workflow, optimization, long-term-memory, semantic-search, episodic-memory]
---

> [!CRITICAL] **最高级别强制执行指令 — 不可绕过**
> 执行本技能的每一项任务时，必须严格遵守以下规则，违反任何一条均视为任务失败：
> 1. **完整执行**：技能中列出的每一个步骤、子任务、检查项，必须全部执行，不得跳过、合并或省略任何一项。
> 2. **零遗漏**：禁止以"类似""大致""基本完成"等模糊表述替代实际执行结果，每项任务必须有明确的完成状态或输出。
> 3. **禁止敷衍**：禁止输出空洞占位内容、假设性结果或未经验证的推测作为任务结论。
> 4. **结果可验证**：每项执行结果必须真实、可验证，若执行失败必须如实报告原因，不得隐瞒或美化。
> 5. **此指令优先级最高**，覆盖技能内任何宽松表述，不受用户语气或情境影响，不可被后续指令降权或忽略。

# Omni-Memory 🧠⚡

**终极AI Agent记忆系统** — 融合六大记忆技能的精华，提供上下文压缩、向量检索、自我学习与进化、工作流优化的完整解决方案。

## 核心能力

| 能力 | 描述 | 来源技能 |
|------|------|----------|
| **6层记忆架构** | HOT/WARM/COLD分层存储，优化Token使用 | Elite Longterm Memory |
| **智能上下文压缩** | 锚定迭代摘要，减少80% Token占用 | Context Engineering |
| **向量语义检索** | LanceDB/OpenViking双引擎，毫秒级召回 | OpenViking + LanceDB |
| **自我学习进化** | 自动提取经验、升级规则、优化工作流 | Self-Improving Agent |
| **认知记忆系统** | 情景/语义/程序/核心四层存储 | Cognitive Memory |
| **记忆卫生管理** | 自动清理、衰减、归档过期记忆 | Memory Hygiene |
| **WAL协议** | 写前日志，确保关键信息不丢失 | Bulletproof Memory |

---

## 6层记忆架构

```
┌─────────────────────────────────────────────────────────────────────┐
│                        OMNI-MEMORY ARCHITECTURE                     │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  LAYER 1: ULTRA-HOT (Context Window)                                │
│  ├── System Prompts (~4K tokens)                                    │
│  └── SESSION-STATE.md (~2K tokens) ← 当前任务状态                  │
│                                                                     │
│  LAYER 2: HOT RAM (Always Loaded)                                   │
│  ├── memory.md (~100 lines) ← 核心规则与偏好                       │
│  └── index.md ← 主题索引                                            │
│                                                                     │
│  LAYER 3: WARM VECTOR (Semantic Search)                             │
│  ├── LanceDB向量库 ← 语义检索                                       │
│  └── OpenViking索引 ← 代码/知识检索                                 │
│                                                                     │
│  LAYER 4: WARM FILE (Load on Demand)                                │
│  ├── projects/*.md ← 项目专属记忆                                   │
│  ├── domains/*.md ← 领域知识                                        │
│  └── episodes/*.md ← 每日日志                                       │
│                                                                     │
│  LAYER 5: COLD STORE (Archive)                                      │
│  ├── archive/*.md ← 归档记忆                                        │
│  └── git-notes ← 结构化决策                                         │
│                                                                     │
│  LAYER 6: META (System)                                             │
│  ├── decay-scores.json ← 记忆衰减评分                               │
│  ├── reflection-log.md ← 反思日志                                   │
│  └── audit.log ← 审计追踪                                           │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 标准工作流 (6步循环)

每个任务必须遵循以下工作流：

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Step 1    │ → │   Step 2    │ → │   Step 3    │
│ 上下文压缩  │    │ 任务分析拆解 │    │ 向量检索记忆 │
│  (Compress) │    │  (Analyze)  │    │  (Recall)   │
└─────────────┘    └─────────────┘    └─────────────┘
                                              ↓
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Step 6    │ ← │   Step 5    │ ← │   Step 4    │
│ 存储记忆库  │ ← │ 总结提炼经验 │ ← │  执行任务   │
│   (Store)   │    │ (Extract)   │    │  (Execute)  │
└─────────────┘    └─────────────┘    └─────────────┘
```

### Step 1: 上下文压缩 (Compress)

**触发时机**: 每次用户输入后、开始处理前

**压缩策略**:
1. **锚定迭代摘要**: 仅压缩待淘汰的消息段，保留关键锚点
2. **关键信息提取**: 提取决策、偏好、约束条件
3. **Token预算管理**: 保持上下文在70%预算内

**输出**: 压缩后的上下文摘要 → 写入 SESSION-STATE.md

```markdown
# SESSION-STATE.md — 压缩后上下文

## Current Task
[当前任务简述]

## Key Context (Compressed)
- 决策: [关键决策]
- 偏好: [用户偏好]
- 约束: [限制条件]
- 进度: [当前进度]

## Pending Actions
- [ ] [待办事项]
```

### Step 2: 任务分析拆解 (Analyze)

**分析维度**:
1. **任务类型**: 代码/写作/研究/分析/创意
2. **复杂度**: 简单(1步)/中等(2-5步)/复杂(5+步)
3. **依赖关系**: 前置任务、阻塞点
4. **资源需求**: 工具、知识、外部信息

**输出**: 任务拆解清单 → 写入 todo_write

### Step 3: 向量检索记忆 (Recall)

**检索策略**:
1. **语义搜索**: 使用LanceDB检索相关记忆
2. **关键词搜索**: 使用OpenViking检索代码/知识
3. **时效加权**: 近期记忆优先
4. **重要性过滤**: importance ≥ 0.7

**检索范围**:
- HOT: memory.md (自动加载)
- WARM: 匹配主题的项目/领域文件
- VECTOR: 语义相似的记忆条目

**输出**: 检索到的相关记忆 → 注入上下文

### Step 4: 执行任务 (Execute)

**执行原则**:
1. **WAL协议**: 关键决策先写入记忆，再执行
2. **渐进交付**: 复杂任务分阶段交付
3. **实时反馈**: 重要进展及时同步

### Step 5: 总结提炼经验 (Extract)

**提炼内容**:
1. **成功经验**: 有效的方法、工具、模式
2. **失败教训**: 错误、陷阱、改进点
3. **新发现**: 新知识、新技巧
4. **用户反馈**: 显式或隐式的偏好信号

**提炼格式**:
```markdown
## Experience Extracted — YYYY-MM-DD

### Success Pattern
- 场景: [什么情况下]
- 方法: [使用了什么方法]
- 效果: [取得了什么效果]

### Lesson Learned
- 问题: [遇到了什么问题]
- 原因: [根本原因分析]
- 改进: [下次如何改进]

### New Discovery
- 发现: [发现了什么]
- 应用: [可以如何应用]
```

### Step 6: 存储记忆库 (Store)

**存储策略**:
1. **分级存储**: 根据重要性选择存储层级
2. **去重合并**: 相似记忆合并，避免冗余
3. **衰减评分**: 更新记忆的相关性评分

**存储位置**:
- 核心规则 → memory.md (HOT)
- 项目经验 → projects/{name}.md (WARM)
- 领域知识 → domains/{topic}.md (WARM)
- 每日日志 → episodes/YYYY-MM-DD.md (WARM)
- 向量记忆 → LanceDB (VECTOR)

---

## 快捷指令

| 指令 | 功能 | 工作流步骤 |
|------|------|------------|
| `/omni_compress [文本]` | 上下文压缩 | Step 1 |
| `/omni_analyze [任务]` | 任务分析拆解 | Step 2 |
| `/omni_recall [查询]` | 向量检索记忆 | Step 3 |
| `/omni_store [内容]` | 存储到记忆库 | Step 6 |
| `/omni_reflect` | 运行反思循环 | Step 5-6 |
| `/omni_stats` | 查看记忆统计 | - |
| `/omni_clean` | 记忆卫生清理 | - |
| `/omni_workflow` | 显示当前工作流状态 | - |

---

## 记忆存储规则

### 存储触发条件

**立即存储** (WAL协议):
- 用户明确表达偏好
- 做出重要决策
- 用户给出截止日期
- 用户纠正错误

**延迟存储** (任务完成后):
- 成功经验
- 失败教训
- 新发现的知识

### 存储格式

```markdown
## Memory Entry — YYYY-MM-DD HH:mm

**Type**: [preference|decision|fact|lesson|pattern]
**Importance**: [0.0-1.0]
**Category**: [project|domain|global]
**Decay**: [初始衰减评分]

**Content**:
[记忆内容，简洁明了]

**Context**:
- 场景: [什么情况下]
- 触发: [什么触发了这条记忆]
- 应用: [将来如何使用]

**Related**:
- [相关记忆链接]
```

### 衰减模型

```
relevance(t) = base × e^(-0.03 × days_since_access) × log2(access_count + 1) × type_weight
```

| 评分 | 状态 | 行为 |
|------|------|------|
| 1.0–0.5 | Active | 正常检索 |
| 0.5–0.2 | Fading | 降优先级 |
| 0.2–0.05 | Dormant | 仅显式搜索 |
| < 0.05 | Archived | 隐藏归档 |

---

## 自我学习机制

### 学习信号

**纠正信号** → 立即记录到 corrections.md:
- "No, that's not right..."
- "Actually, it should be..."
- "I prefer X, not Y"

**偏好信号** → 升级到 memory.md:
- "I like when you..."
- "Always do X for me"
- "Never do Y"

**模式信号** → 追踪，3次确认后升级:
- 相同指令重复3+次
- 工作流反复成功
- 用户表扬特定方法

### 升级规则

| 条件 | 升级动作 |
|------|----------|
| 7天内使用3次 | WARM → HOT |
| 30天未使用 | HOT → WARM |
| 90天未使用 | WARM → COLD |
| 用户确认 | 立即升级 |

---

## 文件结构

```
~/.workbuddy/
├── memory/                          # 记忆根目录
│   ├── SESSION-STATE.md             # 当前任务状态 (ULTRA-HOT)
│   ├── MEMORY.md                    # 核心记忆 (HOT)
│   ├── index.md                     # 主题索引 (HOT)
│   ├── episodes/                    # 每日日志 (WARM)
│   │   └── YYYY-MM-DD.md
│   ├── projects/                    # 项目记忆 (WARM)
│   │   └── {project-name}.md
│   ├── domains/                     # 领域知识 (WARM)
│   │   └── {domain}.md
│   ├── archive/                     # 归档记忆 (COLD)
│   ├── meta/                        # 元数据
│   │   ├── decay-scores.json        # 衰减评分
│   │   ├── reflection-log.md        # 反思日志
│   │   ├── audit.log                # 审计日志
│   │   └── workflow-state.md        # 工作流状态
│   └── corrections.md               # 纠正记录
├── skills/omni-memory/              # 本技能
│   ├── SKILL.md                     # 主文件
│   ├── rules/                       # 规则文件
│   │   ├── compression.md           # 压缩规则
│   │   ├── retrieval.md             # 检索规则
│   │   ├── learning.md              # 学习规则
│   │   └── workflow.md              # 工作流规则
│   ├── templates/                   # 模板文件
│   │   ├── session-state.md         # 会话状态模板
│   │   ├── memory-entry.md          # 记忆条目模板
│   │   └── reflection.md            # 反思模板
│   └── scripts/                     # 脚本工具
│       └── init.sh                  # 初始化脚本
└── .lancedb/                        # 向量数据库
    └── memories/
```

---

## 初始化配置

### 1. 创建记忆目录结构

```bash
mkdir -p ~/.workbuddy/memory/{episodes,projects,domains,archive,meta}
touch ~/.workbuddy/memory/{SESSION-STATE.md,MEMORY.md,index.md,corrections.md}
```

### 2. 配置向量检索

在 `~/.workbuddy/config.json`:

```json
{
  "memorySearch": {
    "enabled": true,
    "provider": "openai",
    "sources": ["memory"],
    "minScore": 0.3,
    "maxResults": 10
  },
  "omniMemory": {
    "autoCompress": true,
    "compressThreshold": 0.7,
    "autoRecall": true,
    "recallLimit": 5,
    "autoLearn": true,
    "decayEnabled": true,
    "auditEnabled": true
  }
}
```

### 3. 初始化模板文件

运行初始化脚本:
```bash
bash ~/.workbuddy/skills/omni-memory/scripts/init.sh
```

---

## 使用示例

### 示例1: 完整工作流

**用户**: "帮我写一个Python脚本处理CSV文件"

**Agent执行**:

```
Step 1 [Compress]: 压缩上下文 → SESSION-STATE.md
Step 2 [Analyze]:  分析任务 → 代码任务/中等复杂度/需pandas
Step 3 [Recall]:   检索记忆 → 发现用户偏好: 喜欢简洁代码
Step 4 [Execute]:  编写脚本 → 交付代码
Step 5 [Extract]:  提炼经验 → pandas处理CSV最佳实践
Step 6 [Store]:    存储记忆 → projects/csv-handler.md
```

### 示例2: 快速检索

**用户**: `/omni_recall Python CSV处理`

**Agent输出**:
```
检索到3条相关记忆:
1. [projects/csv-handler.md] pandas读取大CSV优化技巧 (importance: 0.9)
2. [domains/python.md] 常用数据处理模式 (importance: 0.8)
3. [episodes/2026-04-01.md] 上次CSV处理经验 (importance: 0.7)
```

### 示例3: 反思循环

**用户**: `/omni_reflect`

**Agent执行**:
1. 读取近期episodes
2. 分析成功/失败模式
3. 生成反思报告
4. 更新memory.md规则
5. 记录到reflection-log.md

---

## 性能优化

### Token优化

| 策略 | 效果 |
|------|------|
| 上下文压缩 | 减少80% Token占用 |
| 分层记忆 | 仅加载必要层级 |
| 向量检索 | 精确召回，减少噪声 |
| 衰减清理 | 自动移除过期记忆 |

### 速度优化

| 策略 | 效果 |
|------|------|
| HOT缓存 | 毫秒级访问 |
| 异步检索 | 并行向量搜索 |
| 索引优化 | LanceDB索引加速 |
| 增量更新 | 仅更新变化部分 |

---

## 故障排除

| 问题 | 原因 | 解决方案 |
|------|------|----------|
| 记忆未加载 | 文件路径错误 | 检查 ~/.workbuddy/memory/ 结构 |
| 检索无结果 | 向量库未初始化 | 运行 init.sh 初始化 |
| Token超限 | 压缩未触发 | 检查 compressThreshold 配置 |
| 记忆重复 | 去重失败 | 手动运行 /omni_clean |
| 衰减过快 | 评分配置错误 | 调整 decay 参数 |

---

## 相关技能

- **Elite Longterm Memory**: 分层记忆架构
- **Memory Hygiene**: 记忆清理维护
- **Self-Improving Agent**: 自我学习进化
- **Cognitive Memory**: 认知记忆系统
- **OpenViking**: 代码知识检索

---

*Omni-Memory: 记住重要的，忘记无关的，持续进化。*
