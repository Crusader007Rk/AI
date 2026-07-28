"# AI Workspace

This workspace includes a simple structure for:
- agents
- skills
- install scripts for VS Code

## Structure

- agents/ - categorized agent templates
- skills/ - reusable skill folders
- scripts/ - install scripts
- .github/instructions/ - repo-specific instructions generated for agent reuse

## Agent layout

The agents are now organized by flow category:

- fetch/ - intake and request gathering agents
- plan/ - planning and coordination agents
- design/ - design and UX reasoning agents
- implement/ - implementation and coding agents
- review/ - validation and review agents
- workflow/ - orchestrator and coordinator agents

## Coordinator agent

The repository now includes a coordinator agent named LunaWatch Tower.

Its job is to:
- analyze the repository once and create or update a repo instructions file,
- reuse that file so future runs do not need to re-analyze the repo repeatedly,
- delegate the work to the most suitable specialist agent based on the ticket and complexity.

The generated instructions file lives at:
- .github/instructions/repo-instructions.md

## Workflow Agents

The workspace includes a superhero-themed delivery workflow with agents for:
- intake and ticket triage
- planning and coordination
- design direction and UX reasoning
- implementation and coding support
- review and validation
- test execution and regression checks

## One-shot workflow

Use the orchestrator prompt to run the full flow from ticket intake through delegation and repo guidance creation:

```text
/lunawatch-tower
```

You can also use the more focused prompts:

```text
/fetch
/plan
/design
/implement
/review
/test
```

For an alias reference, see `.github/instructions/phase-aliases.md`.

For the orchestrator architecture and agent wiring, see `.github/instructions/agent-architecture-diagram.md`.

Embedded architecture diagram:

![Agent Architecture](.github/instructions/agent-architecture.png)

## Architecture

The orchestrator is adaptive: it selects only the phases required by the task.
For example, a documentation change may use `/fetch` + `/implement` + `/review`, while a feature request may use `/fetch` + `/plan` + `/design` + `/implement` + `/review` + `/test`.

The workflow also includes explicit user confirmation after fetch, plan, and design phases before moving to the next phase.

## Install

Run the installer script with Node.js:

```bash
node ./scripts/install.mjs
```

The script copies agent templates and skill files into `.github/agents` and `.github/skills` in your workspace, making them automatically available in VS Code.

If you want to install them into your global VS Code prompts folder instead, set the environment variable first:

```powershell
$env:VSCODE_USER_PROMPTS_FOLDER = "C:\Users\YourUsername\AppData\Roaming\Code\User\prompts"
node ./scripts/install.mjs
```
" 
