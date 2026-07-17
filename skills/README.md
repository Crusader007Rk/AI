# Skills

Place reusable skills in this folder.

Each skill should live in its own subfolder containing a SKILL.md file.

## How skills relate to the agents

The agent system now uses:
- categorized agent folders under agents/ for workflow-specific roles,
- a coordinator agent that creates or updates repository instructions,
- reusable skills that provide focused operational guidance for implementation, review, planning, and ticket handling.

These skills should stay repo-agnostic where possible and help agents perform consistent work without re-analyzing the repository every time.
