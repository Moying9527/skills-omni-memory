# 工作流规则 (Workflow Rules)

## 状态机

```
IDLE ──新任务──→ RUNNING ←──┐
   ↑       ↓         │      │
   └──PAUSED─┴──ERROR──┘      │
                   ↓           │
              COMPLETED ←──────┘
```

| 状态 | 说明 | 可执行操作 |
|------|------|-----------|
| IDLE | 空闲 | start |
| RUNNING | 执行中 | pause, cancel |
| PAUSED | 暂停 | resume, cancel |
| COMPLETED | 已完成 | restart |
| ERROR | 出错 | retry, cancel |

## 六步检查点

| 步 | 名称 | 必查项 |
|----|------|--------|
| 1 | 谋 | Token≤70% · 关键信息完整 · SESSION-STATE已更新 |
| 2 | 拆 | 任务类型明确 · 步骤可执行 · 依赖已识别 |
| 3 | 唤 | 检索查询准确 · 相关度≥0.5 · 记忆已注入 |
| 4 | 行 | 任务完成 · 结果符合预期 · WAL已执行 |
| 5 | 炼 | 经验已提取 · 可复用已评估 · 待办已记录 |
| 6 | 存 | 记忆已存储 · 向量已索引 · 审计已记录 |

## WAL协议
**关键决策** → 先写SESSION-STATE → 再执行

## 并行化原则
- Step1+Step2 可部分并行
- Step3 可多路并行检索

## 错误处理

| 步骤 | 常见错误 | 策略 |
|------|---------|------|
| 谋 | 信息丢失 | 回滚+保守压缩 |
| 拆 | 理解偏差 | 用户确认+重分析 |
| 唤 | 无结果 | 扩大范围+降阈值 |
| 行 | 执行失败 | 重试+降级方案 |
| 炼 | 无经验 | 跳过+标记 |
| 存 | 存储失败 | 重试+本地备份 |

## 快捷指令
| 指令 | 功能 |
|------|------|
| `/omni_workflow` | 显示状态 |
| `/omni_workflow start` | 启动 |
| `/omni_workflow pause` | 暂停 |
| `/omni_workflow resume` | 恢复 |
| `/omni_workflow cancel` | 取消 |
| `/omni_workflow step [N]` | 跳转步骤 |
| `/omni_workflow retry` | 重试 |
