# 向量检索规则 (Vector Retrieval Rules)

## 核心原则

**检索目标**: 在毫秒级时间内，召回与当前任务最相关的记忆。

**检索质量指标**:
- **精确率**: 召回的记忆中相关比例 ≥ 80%
- **召回率**: 相关记忆中被召回比例 ≥ 70%
- **延迟**: 单次检索 < 100ms

---

## 检索架构

### 双引擎设计

```
┌─────────────────────────────────────────────────────────────┐
│                    VECTOR RETRIEVAL                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────┐      ┌─────────────────┐              │
│  │   LanceDB       │      │   OpenViking    │              │
│  │   (语义检索)     │      │   (知识检索)     │              │
│  │                 │      │                 │              │
│  │ • 用户偏好       │      │ • 代码知识       │              │
│  │ • 项目经验       │      │ • 技术文档       │              │
│  │ • 领域知识       │      │ • API参考        │              │
│  │ • 历史决策       │      │ • 最佳实践       │              │
│  └────────┬────────┘      └────────┬────────┘              │
│           │                        │                       │
│           └────────┬───────────────┘                       │
│                    ▼                                        │
│           ┌─────────────────┐                              │
│           │  Result Merger  │                              │
│           │  (去重+排序)     │                              │
│           └────────┬────────┘                              │
│                    ▼                                        │
│           ┌─────────────────┐                              │
│           │  Context Inject │                              │
│           │  (注入上下文)    │                              │
│           └─────────────────┘                              │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 检索策略

### 策略1: 分层检索 (Hierarchical Retrieval)

**检索顺序**:
1. **ULTRA-HOT** (Context Window): SESSION-STATE.md
   - 直接读取，无需检索
   - 包含当前任务状态

2. **HOT** (Always Loaded): memory.md + index.md
   - 直接读取，无需检索
   - 包含核心规则和偏好

3. **WARM-VECTOR** (Semantic Search): LanceDB
   - 语义相似度搜索
   - 默认检索Top 5

4. **WARM-FILE** (Topic Match): projects/ + domains/
   - 基于主题匹配
   - 按需加载

5. **COLD** (Explicit Search): archive/ + git-notes
   - 仅显式查询时检索
   - 深度搜索

### 策略2: 多路召回 (Multi-Channel Recall)

**召回通道**:

| 通道 | 方法 | 适用场景 |
|------|------|----------|
| 语义通道 | 向量相似度 | 概念相关 |
| 关键词通道 | 关键词匹配 | 精确匹配 |
| 时序通道 | 时间衰减 | 近期优先 |
| 重要性通道 | 重要性评分 | 高优先级 |
| 关联通道 | 图谱关系 | 关联记忆 |

**融合公式**:
```
final_score = w1*semantic + w2*keyword + w3*recency + w4*importance + w5*relation

默认权重:
- semantic: 0.4
- keyword: 0.2
- recency: 0.2
- importance: 0.15
- relation: 0.05
```

### 策略3: 查询扩展 (Query Expansion)

**扩展方法**:
1. **同义词扩展**: Python → Python3, Py
2. **上下位扩展**: 编程 → 代码开发, 软件开发
3. **相关概念**: 数据库 → SQL, NoSQL, MySQL
4. **用户偏好**: 自动加入用户常用术语

**示例**:
```
原始查询: "Python CSV处理"
扩展后: "Python CSV处理 pandas dataframe read_csv 数据分析"
```

---

## 检索流程

### Step 1: 查询分析

**分析维度**:
1. **意图识别**: 代码/写作/研究/分析
2. **主题提取**: 主要话题、关键词
3. **时效要求**: 是否需要最新记忆
4. **精度要求**: 精确匹配 vs 语义相关

### Step 2: 选择检索范围

| 查询特征 | 检索范围 |
|----------|----------|
| 代码相关 | LanceDB + OpenViking |
| 项目相关 | LanceDB + projects/ |
| 领域知识 | LanceDB + domains/ |
| 历史记录 | LanceDB + episodes/ |
| 精确查询 | 关键词匹配优先 |
| 模糊查询 | 语义相似度优先 |

### Step 3: 执行检索

**LanceDB检索**:
```python
# 伪代码
results = lancedb.search(
    query=expanded_query,
    vector_column="embedding",
    limit=recall_limit,
    filter=f"importance >= {min_importance}"
)
```

**OpenViking检索**:
```bash
# 代码知识检索
ov search "{query}" --uri viking://resources/{domain} --limit 5

# 关键词检索
ov grep "{keyword}" --uri viking://resources/{domain}
```

### Step 4: 结果融合

**去重规则**:
- URI相同 → 保留高分版本
- 内容相似度 > 0.9 → 合并

**排序规则**:
1. 综合评分降序
2. 重要性降序
3. 时效性降序

### Step 5: 结果过滤

**过滤条件**:
- 最小相似度: 0.3
- 最小重要性: 0.5
- 最大返回数: 10

**过滤后处理**:
- 截断过长内容
- 格式化输出
- 添加来源标注

### Step 6: 注入上下文

**注入格式**:
```markdown
## Retrieved Memories

### From: [来源文件]
**Relevance**: [相似度] | **Importance**: [重要性]
[记忆内容]

### From: [来源文件]
...
```

---

## 相关性评分

### 语义相似度

```python
# 使用余弦相似度
similarity = cosine_similarity(query_embedding, memory_embedding)
```

### 时效加权

```python
# 时间衰减函数
days_old = (now - memory.timestamp).days
recency_score = exp(-0.03 * days_old)  # 23天半衰期
```

### 重要性评分

| 重要性 | 分值 | 说明 |
|--------|------|------|
| Critical | 1.0 | 核心规则，必须保留 |
| High | 0.8-0.9 | 重要偏好，优先召回 |
| Medium | 0.6-0.7 | 一般经验 |
| Low | 0.4-0.5 | 参考信息 |
| Minimal | 0.1-0.3 | 低优先级 |

### 综合评分

```python
final_score = (
    similarity * 0.4 +
    recency_score * 0.2 +
    importance * 0.25 +
    access_count_boost * 0.15
)
```

---

## 快捷指令

| 指令 | 功能 |
|------|------|
| `/omni_recall [查询]` | 通用检索 |
| `/omni_recall code [查询]` | 代码知识检索 |
| `/omni_recall project [项目名]` | 项目记忆检索 |
| `/omni_recall domain [领域]` | 领域知识检索 |
| `/omni_recall recent [N天]` | 近期记忆检索 |
| `/omni_recall important` | 重要记忆检索 |

---

## 性能优化

### 索引优化

1. **向量索引**: HNSW索引，加速相似度搜索
2. **倒排索引**: 关键词快速定位
3. **时间索引**: 按时间范围过滤
4. **分层索引**: 按重要性分层

### 缓存策略

1. **HOT缓存**: memory.md常驻内存
2. **查询缓存**: 近期查询结果缓存
3. **向量缓存**: 热门向量预加载

### 异步检索

```python
# 并行检索
async def retrieve_all(query):
    tasks = [
        retrieve_lancedb(query),
        retrieve_openviking(query),
        retrieve_files(query)
    ]
    results = await asyncio.gather(*tasks)
    return merge_results(results)
```

---

## 错误处理

| 错误 | 处理 |
|------|------|
| 检索无结果 | 扩大检索范围 + 降低阈值 |
| 结果过多 | 收紧过滤条件 + 提高阈值 |
| 检索超时 | 返回部分结果 + 异步补全 |
| 向量库错误 | 降级到文件检索 |
