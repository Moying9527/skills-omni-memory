# 工作流规则 (Workflow Rules)

## 核心原则

**工作流目标**: 标准化任务处理流程，提升执行效率和输出质量。

**工作流特点**:
1. **6步循环**: 压缩→分析→检索→执行→提炼→存储
2. **可中断**: 每步可独立执行
3. **可回滚**: 出错时可回退到上一步
4. **可观测**: 每步状态可见

---

## 6步工作流详解

### Step 0: 工作流初始化

**触发条件**:
- 用户发送新任务
- 用户显式调用 `/omni_workflow`

**初始化动作**:
1. 读取 SESSION-STATE.md
2. 检查是否有进行中的工作流
3. 初始化工作流状态

**状态文件** (meta/workflow-state.md):
```markdown
# Workflow State

## Current
Status: [idle|running|paused|completed|error]
Step: [0-6]
Task: [任务描述]
Started: [开始时间]
Last Updated: [最后更新时间]

## Progress
- [ ] Step 1: Compress
- [ ] Step 2: Analyze
- [ ] Step 3: Recall
- [ ] Step 4: Execute
- [ ] Step 5: Extract
- [ ] Step 6: Store

## Context
[当前上下文摘要]

## Blockers
[阻塞点]
```

---

### Step 1: 上下文压缩 (Compress)

**目标**: 将上下文Token占用控制在70%预算内

**输入**: 当前对话历史 + 系统提示

**处理**:
1. 评估当前Token占用
2. 如果超过70%阈值，执行压缩
3. 使用锚定迭代摘要或关键信息提取
4. 更新SESSION-STATE.md

**输出**: 压缩后的上下文摘要

**检查点**:
- [ ] Token占用 ≤ 70%
- [ ] 关键信息保留完整
- [ ] SESSION-STATE.md已更新

**错误处理**:
- 压缩失败 → 保留原始上下文 + 标记警告
- 信息丢失 → 回滚 + 重新压缩

---

### Step 2: 任务分析拆解 (Analyze)

**目标**: 理解任务，拆解为可执行步骤

**输入**: 压缩后的上下文 + 用户指令

**处理**:
1. **意图识别**: 确定任务类型
   - 代码开发
   - 文档写作
   - 数据分析
   - 研究调研
   - 创意设计

2. **复杂度评估**:
   - 简单: 1-2步可完成
   - 中等: 3-5步
   - 复杂: 5+步

3. **依赖分析**:
   - 前置任务
   - 外部依赖
   - 阻塞点

4. **资源评估**:
   - 需要的工具
   - 需要的知识
   - 时间估算

**输出**: 任务拆解清单

```markdown
## Task Analysis

**Type**: [任务类型]
**Complexity**: [简单|中等|复杂]
**Estimated Steps**: [步骤数]

**Breakdown**:
1. [步骤1] - [预计时间]
2. [步骤2] - [预计时间]
...

**Dependencies**:
- [依赖项]

**Blockers**:
- [阻塞点]

**Resources**:
- Tools: [需要的工具]
- Knowledge: [需要的知识]
```

**检查点**:
- [ ] 任务类型明确
- [ ] 步骤可执行
- [ ] 依赖已识别

---

### Step 3: 向量检索记忆 (Recall)

**目标**: 召回与任务相关的历史记忆

**输入**: 任务分析结果

**处理**:
1. 构建检索查询
   - 从任务描述提取关键词
   - 扩展同义词和相关概念

2. 分层检索
   - HOT: memory.md (已加载)
   - WARM-VECTOR: LanceDB检索
   - WARM-FILE: 主题匹配

3. 结果融合
   - 去重
   - 排序
   - 过滤

**输出**: 检索到的相关记忆

```markdown
## Retrieved Memories

### High Relevance (>0.8)
1. [来源] - [内容摘要] (score: X.XX)
2. ...

### Medium Relevance (0.5-0.8)
1. [来源] - [内容摘要] (score: X.XX)
2. ...

### Applied
- [已应用的记忆]
```

**检查点**:
- [ ] 检索查询准确
- [ ] 结果相关度 ≥ 0.5
- [ ] 记忆已注入上下文

---

### Step 4: 执行任务 (Execute)

**目标**: 完成任务，交付结果

**输入**: 任务拆解 + 相关记忆 + 用户指令

**处理**:
1. 制定执行计划
2. 按步骤执行
3. 实时更新进度
4. 处理异常情况

**WAL协议** (关键决策):
- 决策前 → 写入SESSION-STATE.md
- 决策后 → 执行

**进度更新**:
```markdown
## Execution Progress

**Current Step**: [X/Y]
**Status**: [in_progress|completed|blocked]
**Last Action**: [最后执行的动作]
**Next Action**: [下一步动作]

**Completed**:
- [x] [已完成项]

**In Progress**:
- [ ] [进行中项]

**Results**:
[中间结果]
```

**输出**: 任务结果

**检查点**:
- [ ] 任务完成
- [ ] 结果符合预期
- [ ] 用户满意

---

### Step 5: 总结提炼经验 (Extract)

**目标**: 从任务执行中提取经验

**输入**: 任务结果 + 执行过程

**处理**:
1. **成功经验提取**
   - 什么方法有效
   - 什么工具好用
   - 什么流程高效

2. **失败教训提取**
   - 遇到了什么问题
   - 原因是什么
   - 如何改进

3. **新发现提取**
   - 新知识点
   - 新技巧
   - 新工具

4. **用户反馈提取**
   - 显式反馈
   - 隐式信号

**输出**: 经验提取报告

```markdown
## Experience Extraction

### Success Patterns
- [成功经验1]
- [成功经验2]

### Lessons Learned
- [教训1]
- [教训2]

### New Discoveries
- [新发现1]
- [新发现2]

### User Feedback
- [反馈1]
- [反馈2]

### Action Items
- [ ] [待办1]
- [ ] [待办2]
```

**检查点**:
- [ ] 经验已提取
- [ ] 可复用性评估
- [ ] 待办已记录

---

### Step 6: 存储记忆库 (Store)

**目标**: 将经验持久化存储

**输入**: 经验提取报告

**处理**:
1. **分级存储决策**
   - Critical → memory.md (HOT)
   - Project-specific → projects/{name}.md (WARM)
   - Domain-specific → domains/{topic}.md (WARM)
   - Daily log → episodes/YYYY-MM-DD.md (WARM)
   - Vector → LanceDB

2. **去重检查**
   - 检查相似记忆
   - 合并或更新

3. **衰减评分初始化**
   - 设置初始评分
   - 记录创建时间

4. **审计日志**
   - 记录存储操作
   - 记录变更内容

**输出**: 存储确认

```markdown
## Storage Confirmation

### Stored Memories
| Content | Location | Importance | Status |
|---------|----------|------------|--------|
| [内容1] | [位置1] | [重要性] | ✅ |
| [内容2] | [位置2] | [重要性] | ✅ |

### Vector Entries
- [条目1]: [向量ID]
- [条目2]: [向量ID]

### Audit Log
- [时间]: [操作描述]
```

**检查点**:
- [ ] 记忆已存储
- [ ] 向量已索引
- [ ] 审计已记录

---

## 工作流状态管理

### 状态流转

```
        ┌─────────┐
        │  IDLE   │
        └────┬────┘
             │ 新任务
             ▼
        ┌─────────┐
   ┌───→│ RUNNING │←──┐
   │    └────┬────┘   │
   │         │         │
   │    ┌────┴────┐    │
   └───┤ PAUSED  ├───┘
        └────┬────┘
             │ 完成/错误
             ▼
        ┌─────────┐
        │COMPLETED│
        │  ERROR  │
        └─────────┘
```

### 状态说明

| 状态 | 说明 | 可执行操作 |
|------|------|------------|
| IDLE | 空闲，无进行中的工作流 | start |
| RUNNING | 工作流执行中 | pause, cancel |
| PAUSED | 工作流暂停 | resume, cancel |
| COMPLETED | 工作流完成 | restart |
| ERROR | 工作流出错 | retry, cancel |

### 快捷指令

| 指令 | 功能 |
|------|------|
| `/omni_workflow` | 显示当前工作流状态 |
| `/omni_workflow start` | 启动新工作流 |
| `/omni_workflow pause` | 暂停当前工作流 |
| `/omni_workflow resume` | 恢复工作流 |
| `/omni_workflow cancel` | 取消工作流 |
| `/omni_workflow step [N]` | 跳转到指定步骤 |
| `/omni_workflow retry` | 重试当前步骤 |

---

## 工作流优化

### 并行化

**可并行步骤**:
- Step 1 (Compress) 和 Step 2 (Analyze) 可部分并行
- Step 3 (Recall) 可多路并行检索

### 缓存

**可缓存内容**:
- 压缩后的上下文
- 检索结果 (短期缓存)
- 任务分析结果

### 自适应

**自适应调整**:
- 简单任务: 跳过部分步骤
- 紧急任务: 减少检索深度
- 复杂任务: 增加分析深度

---

## 错误处理

| 步骤 | 常见错误 | 处理策略 |
|------|----------|----------|
| Compress | 信息丢失 | 回滚 + 保守压缩 |
| Analyze | 理解偏差 | 用户确认 + 重新分析 |
| Recall | 检索无结果 | 扩大范围 + 降低阈值 |
| Execute | 执行失败 | 重试 + 降级方案 |
| Extract | 无经验可提取 | 跳过 + 标记 |
| Store | 存储失败 | 重试 + 本地备份 |
