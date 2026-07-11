"# AI Workspace

This workspace includes a simple structure for:
- agents
- skills
- install scripts for VS Code

## Structure

- agents/ - agent templates
- skills/ - reusable skill folders
- scripts/ - install scripts

## Workflow Agents

The workspace now includes a superhero-themed delivery workflow with agents for:
- Jira ticket retrieval
- ticket analysis
- clarification when details are missing
- planning and confirmation
- implementation
- branch, commit, and PR preparation
- code review and security scanning
- unit and end-to-end test execution

## One-shot workflow

Use the orchestrator prompt to run the full flow from ticket intake to PR preparation with a single prompt:

```text
/alfred
```

Before running the main flow, you can first run the repository adaptor so the workflow is tailored to the repo's conventions:

```text
/batman
```

When you run Alfred, it will first invoke Batman, then ask whether you want a detailed analysis step before continuing.

You can also use the simpler step-based prompts:

```text
/fetch
/analyse
/plan
/implement
/review
```

## Install

Run the installer script with Node.js:

```bash
node ./scripts/install.mjs
```

The script copies agent templates and skill files into your VS Code prompts folder.
" 
