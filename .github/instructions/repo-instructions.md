# Repository Instructions

This file is maintained by LunaWatch Tower and should be updated when the repository structure, architecture, or development conventions change.

## Repository Overview
- Describe the project purpose and primary domain here.
- Note the main entry points, services, and modules.

## Structural Patterns
- Describe the main folders and their responsibilities.
- Explain the layering or architectural pattern used in the repository.

## Coding Standards
- Document naming conventions, formatting rules, and style expectations.
- Note linting, formatting, or type-checking requirements.

## Dependencies
- List the main external libraries, frameworks, and internal modules.
- Record dependency boundaries and any important integration points.

## Architecture and Flow
- Summarize how requests or data flow through the system.
- Highlight important services, controllers, models, utilities, and state boundaries.

## Testing Expectations
- Document the test strategy, test locations, and expected validation steps.

## Implementation Notes
- Record any repo-specific caveats, conventions, or prior decisions that future agents should know.

## Agent Routing Map

Use this routing map when selecting the appropriate subagent and model tier for a task.

| Phase | Suggested subagent | Model tier | When to use |
| --- | --- | --- | --- |
| Fetch | Kid Flash / Impulse / Jesse Quick | lightweight / balanced / strong | Intake, triage, context gathering, or research-heavy requests |
| Plan | Batman / Robin / Nightwing / Batgirl | balanced / lightweight / balanced / strong | Breakdown, risk analysis, sequencing, and dependency planning |
| Design | Donna Troy / Artemis / Cassie Sandsmark | lightweight / balanced / strong | UX direction, interaction flow, and design strategy |
| Implement | Superboy / Steel / Guardian | lightweight / balanced / strong | Code changes, feature delivery, bug fixes, and integration |
| Review | M’gann / J’onn / Connor | lightweight / balanced / strong | Validation, regression checks, review, and final acceptance |
| Test | Harley Quinn / Deadshot / King Shark | lightweight / balanced / strong | Quick regression checks, focused validation, and broad test coverage |

## Adaptive Routing Rules
- Choose only the phases required by the request.
- Prefer the lightest subagent and model tier that can complete the task safely.
- Escalate to stronger reasoning or coding agents when the task is complex, risky, or cross-cutting.
