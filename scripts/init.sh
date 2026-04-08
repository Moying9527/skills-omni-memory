#!/bin/bash
# Omni-Memory Initialization Script
# Usage: bash init.sh [workspace_path]

set -e

WORKSPACE=${1:-~/.workbuddy}
MEMORY_DIR="$WORKSPACE/memory"

echo "🧠 Initializing Omni-Memory System..."
echo "Workspace: $WORKSPACE"

# Create directory structure
echo "📁 Creating directory structure..."
mkdir -p "$MEMORY_DIR"/{episodes,projects,domains,archive,meta}

# Create core files
echo "📝 Creating core files..."

# SESSION-STATE.md
cat > "$MEMORY_DIR/SESSION-STATE.md" << 'EOF'
# SESSION-STATE.md — Active Working Memory

This file is the agent's "RAM" — survives compaction, restarts, distractions.

## Current Task
[None]

## Key Context (Compressed)
[None yet]

## Pending Actions
- [ ] None

## Recent Decisions
[None yet]

## Blockers
[None]

---
*Last updated: [timestamp]*
*Compression ratio: N/A*
EOF

# MEMORY.md
cat > "$MEMORY_DIR/MEMORY.md" << 'EOF'
# MEMORY.md — Core Memory

## User Preferences

## Key Decisions

## Important Facts

## Lessons Learned

## Patterns

---
*Last updated: [timestamp]*
EOF

# index.md
cat > "$MEMORY_DIR/index.md" << 'EOF'
# Memory Index

## Projects

## Domains

## Topics

---
*Last updated: [timestamp]*
EOF

# corrections.md
cat > "$MEMORY_DIR/corrections.md" << 'EOF'
# Corrections Log

## Recent Corrections

---
*Last updated: [timestamp]*
EOF

# Meta files
touch "$MEMORY_DIR/meta/decay-scores.json"
touch "$MEMORY_DIR/meta/reflection-log.md"
touch "$MEMORY_DIR/meta/audit.log"
touch "$MEMORY_DIR/meta/workflow-state.md"

# Initialize decay scores
cat > "$MEMORY_DIR/meta/decay-scores.json" << 'EOF'
{
  "memories": {},
  "lastCleanup": "",
  "config": {
    "decayRate": 0.03,
    "archiveThreshold": 0.05,
    "dormantThreshold": 0.2,
    "fadingThreshold": 0.5
  }
}
EOF

# Initialize workflow state
cat > "$MEMORY_DIR/meta/workflow-state.md" << 'EOF'
# Workflow State

## Current
Status: idle
Step: 0
Task: None
Started: 
Last Updated: 

## Progress
- [ ] Step 1: Compress
- [ ] Step 2: Analyze
- [ ] Step 3: Recall
- [ ] Step 4: Execute
- [ ] Step 5: Extract
- [ ] Step 6: Store

## Context

## Blockers
EOF

echo "✅ Omni-Memory initialization complete!"
echo ""
echo "Directory structure:"
tree -L 2 "$MEMORY_DIR" 2>/dev/null || find "$MEMORY_DIR" -maxdepth 2 -type d

echo ""
echo "Next steps:"
echo "1. Configure memory search in ~/.workbuddy/config.json"
echo "2. Set OPENAI_API_KEY for vector search"
echo "3. Start using /omni_workflow to run tasks"
