# 自我学习规则 (Self-Learning Rules)

## 核心原则

**学习目标**: 从每次交互中提取经验，持续优化工作流和规则。

**学习信号**:
- 用户纠正 → 立即学习
- 成功经验 → 模式提取
- 失败教训 → 错误预防
- 重复任务 → 流程优化

---

## 学习架构

```
┌─────────────────────────────────────────────────────────────┐
│                    SELF-LEARNING SYSTEM                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐   ┌──────────────┐   ┌──────────────┐    │
│  │   Signal     │ → │  Extract     │ → │   Store      │    │
│  │   Detection  │   │  Experience  │   │   Memory     │    │
│  │              │   │              │   │              │    │
│  │ • Correction │   │ • Pattern    │   │ • HOT/WARM   │    │
│  │ • Success    │   │ • Lesson     │   │ • VECTOR     │    │
│  │ • Failure    │   │ • Discovery  │   │ • COLD       │    │
│  └──────────────┘   └──────────────┘   └──────┬───────┘    │
│                                               │             │
│                                               ▼             │
│                                      ┌──────────────┐      │
│                                      │   Evolve     │      │
│                                      │   Rules      │      │
│                                      │              │      │
│                                      │ • Upgrade    │      │
│                                      │ • Merge      │      │
│                                      │ • Archive    │      │
│                                      └──────────────┘      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 学习信号检测

### 信号类型

| 信号 | 触发词 | 优先级 | 处理方式 |
|------|--------|--------|----------|
| **纠正信号** | "不对""错了""应该" | P0 | 立即记录到corrections.md |
| **偏好信号** | "喜欢""偏好""总是" | P0 | 升级到memory.md |
| **确认信号** | "好的""没错""完美" | P1 | 标记为成功经验 |
| **重复信号** | 相同指令3+次 | P1 | 提取为模式 |
| **疑问信号** | "为什么""怎么" | P2 | 记录知识缺口 |

### 纠正信号处理

**触发词库**:
```
纠正类:
- "不对""错了""不正确""有问题"
- "应该""实际""事实上"
- "不是...而是..."
- "我意思是"

偏好类:
- "我喜欢""我偏好""我更愿意"
- "总是""从不""务必"
- "记住"

否定类:
- "不需要""不用""算了"
- "别"
```

**处理流程**:
1. 检测到纠正信号
2. 提取纠正内容
3. 记录到corrections.md
4. 分析是否需要升级到memory.md
5. 更新相关规则

**记录格式**:
```markdown
## Correction — YYYY-MM-DD HH:mm

**Trigger**: [触发话语]
**Original**: [原回答/行为]
**Correction**: [纠正内容]
**Lesson**: [学到的教训]
**Scope**: [适用范围: global|project|domain]
**Status**: [pending|applied|verified]
```

---

## 经验提取

### 成功经验提取

**提取时机**: 任务完成后，用户表示满意

**提取维度**:
1. **方法**: 使用了什么方法
2. **工具**: 使用了什么工具
3. **流程**: 遵循了什么流程
4. **技巧**: 有什么技巧

**提取格式**:
```markdown
## Success Pattern — YYYY-MM-DD

**Context**: [什么场景]
**Task**: [什么任务]
**Approach**: [什么方法]
  - 步骤1: [详细步骤]
  - 步骤2: [详细步骤]
**Tools**: [使用的工具]
**Result**: [取得的效果]
**Reusability**: [可复用性评分 0-1]
```

### 失败教训提取

**提取时机**: 任务失败、出错、用户不满意

**提取维度**:
1. **问题**: 出了什么问题
2. **原因**: 根本原因
3. **影响**: 造成了什么影响
4. **改进**: 如何改进

**提取格式**:
```markdown
## Lesson Learned — YYYY-MM-DD

**Incident**: [问题描述]
**Root Cause**: [根本原因]
  - 直接原因: [表面原因]
  - 深层原因: [根本原因]
**Impact**: [造成的影响]
**Improvement**: [改进措施]
  - 短期: [立即可以做的]
  - 长期: [需要长期执行的]
**Prevention**: [如何预防]
```

### 新发现提取

**提取时机**: 发现新知识、新技巧、新工具

**提取格式**:
```markdown
## Discovery — YYYY-MM-DD

**Discovery**: [发现了什么]
**Source**: [来源: 文档/实验/交流]
**Verification**: [如何验证的]
**Application**: [可以如何应用]
**Related**: [相关知识点]
```

---

## 记忆升级规则

### 升级路径

```
corrections.md → memory.md → projects/{name}.md → domains/{topic}.md
     ↓
[验证3次] → [确认有效] → [主题归类]
```

### 升级条件

| 从 | 到 | 条件 |
|----|----|------|
| corrections | memory | 验证有效，且适用范围广 |
| memory (HOT) | projects | 项目专属规则 |
| memory (HOT) | domains | 领域专属规则 |
| projects/domains | archive | 90天未使用 |
| archive | delete | 用户确认删除 |

### 自动升级规则

**HOT → WARM 降级**:
- 条件: 30天未访问
- 动作: 移动到projects/domains

**WARM → COLD 归档**:
- 条件: 90天未访问
- 动作: 移动到archive

**升级检查频率**: 每周一次 (通过heartbeat)

---

## 规则进化

### 规则优化

**优化触发**:
1. 收集到3个相似纠正
2. 发现规则冲突
3. 用户明确要求优化

**优化流程**:
1. 分析现有规则
2. 识别问题/改进点
3. 草拟新规则
4. 用户确认
5. 更新规则文件

### 模式合并

**合并条件**:
- 多个相似模式
- 可以抽象为通用规则

**合并示例**:
```
模式1: Python CSV处理使用pandas
模式2: Python Excel处理使用openpyxl
模式3: Python数据处理使用pandas

合并后: Python数据处理优先使用pandas，Excel使用openpyxl
```

### 冲突解决

**冲突类型**:
1. **规则冲突**: 两条规则建议不同做法
2. **偏好冲突**: 用户前后偏好不一致
3. **范围冲突**: 全局规则与项目规则冲突

**解决原则**:
1. 最具体优先 (项目 > 领域 > 全局)
2. 最新优先 (同层级)
3. 用户确认 (无法自动解决)

---

## 反思循环

### 反思触发

**自动触发**:
- 每天结束 (如果用户同意)
- 每周结束 (通过heartbeat)
- 重大任务完成后

**手动触发**:
- 用户输入 `/omni_reflect`

### 反思流程

**Step 1: 收集数据**
- 读取近期episodes
- 读取corrections.md
- 读取reflection-log.md

**Step 2: 分析模式**
- 成功模式识别
- 错误模式识别
- 改进机会识别

**Step 3: 生成洞察**
```markdown
## Reflection — YYYY-MM-DD

### Highlights
- [本周亮点]

### Lowlights
- [本周不足]

### Patterns Observed
- [观察到的模式]

### Improvements Made
- [已做的改进]

### Action Items
- [待办事项]
```

**Step 4: 更新规则**
- 根据反思结果更新memory.md
- 记录到reflection-log.md

---

## 快捷指令

| 指令 | 功能 |
|------|------|
| `/omni_reflect` | 运行反思循环 |
| `/omni_learn [内容]` | 手动记录学习 |
| `/omni_stats` | 查看学习统计 |
| `/omni_upgrade` | 手动触发升级检查 |

---

## 学习统计

**统计维度**:
- 纠正次数 (本周/本月/总计)
- 成功经验数
- 失败教训数
- 规则升级次数
- 记忆衰减情况

**输出格式**:
```
📊 Learning Statistics

Corrections:
  This week: X
  This month: X
  Total: X

Patterns:
  Success: X
  Lessons: X
  Discoveries: X

Memory:
  HOT: X entries
  WARM: X files
  COLD: X files

Evolution:
  Upgrades: X
  Merges: X
  Archives: X
```
