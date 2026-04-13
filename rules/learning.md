# 学习规则 (Self-Learning Rules)

## 学习信号与处理

| 信号类型 | 触发词 | 优先级 | 处理 |
|----------|--------|--------|------|
| **纠正信号** | "不对""错了""应该" | P0 | 立即记录corrections.md |
| **偏好信号** | "喜欢""偏好""记住" | P0 | 升级到memory.md |
| **确认信号** | "好的""完美" | P1 | 标记为成功经验 |
| **重复信号** | 相同指令3+次 | P1 | 提取为模式 |
| **疑问信号** | "为什么""怎么" | P2 | 记录知识缺口 |

## 升级路径

```
corrections.md → memory.md → projects/{name}.md → domains/{topic}.md
```

| 条件 | 动作 |
|------|------|
| 验证3次有效 + 范围广 | corrections → memory |
| 项目专属 | memory → projects/ |
| 领域专属 | memory → domains/ |
| 90日未使用 | → archive/ |

## 纠正记录格式

```markdown
## Correction — YYYY-MM-DD HH:mm
**触发**: [触发话语]
**原答案**: [错误回答/行为]
**纠正**: [正确内容]
**教训**: [学到了什么]
**范围**: [global|project|domain]
**状态**: [pending|applied|verified]
```

## 反思循环（触发时机）
- **自动**: 每日结束 / 每周结束 / 重大任务完成
- **手动**: `/omni_reflect`

## 快捷指令
| 指令 | 功能 |
|------|------|
| `/omni_reflect` | 反思循环 |
| `/omni_learn [内容]` | 手动记录学习 |
| `/omni_stats` | 学习统计 |
| `/omni_upgrade` | 手动触发升级检查 |
