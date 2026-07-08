# Documentation Standards

Use `docs/` for durable project knowledge that a maintainer should be able to read without replaying pull requests or chat history. This includes current architecture, development guides, operational runbooks, and factual references.

Keep collaboration policy in `CONTRIBUTING.md`, AI-agent instructions in `AGENTS.md`, issue and review evidence requirements in templates, and automated enforcement in scripts or CI workflows.

## What Belongs Here

- `architecture/` for the current system shape: domain boundaries, module boundaries, data flow, trust boundaries, storage, integrations, deployment topology, and major tradeoffs.
- `development/` for local setup, common development tasks, debugging workflows, test strategy, fixtures, release dry-runs, and stack-specific commands.
- `reference/` for stable factual material such as APIs, CLI commands, configuration, protocols, schemas, error codes, and generated interfaces.
- `operations/` for runbooks, incident response, monitoring, backups, migrations, and rollback procedures when the project has operational responsibilities.
- `tutorials/` for guided onboarding exercises when a new contributor needs a start-to-finish learning path.

Do not create empty directories just to match this list. Add a section when the project has real documentation for that reader need.

## RFC Boundary

Use `rfcs/` for proposals, decision records, and major changes before they become current project facts. After an RFC is accepted and implemented, update the relevant `docs/` page so architecture and development documentation describe the current state.

RFCs explain why a decision was made. `docs/` explains how the project works now.

## Writing Standards

- Give every durable document one clear audience, purpose, and owner area.
- Prefer current-state language over historical narration in `docs/`; link to RFCs for decision history.
- Keep examples runnable when practical; otherwise label them as illustrative and explain the validation gap.
- Link to source files, commands, schemas, dashboards, or RFCs when they are the real source of truth.
- Update docs in the same change as behavior, configuration, command, API, deployment, architecture, or operational changes.
- Keep private tokens, internal hostnames, personal filesystem paths, generated logs, and environment-specific secrets out of documentation.
