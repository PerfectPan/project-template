# Contributing

## Development Setup

Replace this section with project-specific setup instructions.

```bash
# install local Git hooks
./scripts/install-git-hooks.sh

# run repository checks
./scripts/check-repository.sh

# check a PR or MR title
./scripts/check-pr-title.sh "docs: update project template"

# preview GitHub repository protection setup
./scripts/configure-github-repository.sh --repo OWNER/REPO

# install dependencies
# run tests
# run local app or CLI
```

## Contribution Flow

1. Open an issue or discussion for ambiguous work.
2. Choose Spec and Plan artifacts using the [Change Design Gate](#change-design-gate) before substantial work. Review the behavior and technical design before implementing that scope.
3. Create a focused branch with a short descriptive name.
4. Install local Git hooks with `./scripts/install-git-hooks.sh` if this checkout has not already done so.
5. Identify the affected domain concepts, layer boundaries, data flow, and tests before changing code.
6. Implement the change, keeping responsibilities separated and using existing project patterns.
7. Add or update tests for behavior changes.
8. Update `README.md`, `CHANGELOG.md`, `docs/`, `AGENTS.md`, `CONTRIBUTING.md`, or the active Spec and Plan when user-facing behavior, architecture, development workflow, operations, or project policy changes.
9. Run repository checks, title checks, and project-specific format, lint, test, build, and package checks.
10. For a newly created GitHub repository, run the repository setup script with an admin-authorized account.
11. Open a pull request or merge request with a conventional title, motivation, implementation notes, validation, evidence, skipped gates, and follow-up risks.
12. Keep the PR/MR description current after review feedback, rebases, validation reruns, or scope changes.

Small typo corrections, narrow documentation fixes, and repository metadata updates do not need a separate Spec and Plan.

## Required Checks

Replace these placeholders after choosing the project stack:

```bash
# Local Git hooks:
./scripts/install-git-hooks.sh

# Repository checks:
./scripts/check-repository.sh

# PR/MR title:
./scripts/check-pr-title.sh "docs: update project template"

# GitHub repository setup dry run:
./scripts/configure-github-repository.sh --repo OWNER/REPO

# Format:

# Lint:

# Test:

# Build:

# Package or release dry-run:
```

## SDD Workflow And Document Lifecycle

1. Record the problem, affected users or maintainers, in-scope behavior, non-goals, and acceptance conditions.
2. Choose artifacts with the [Change Design Gate](#change-design-gate). Product work defaults to one behavioral Spec and one detailed Plan for the same deliverable. The Spec states interactions and acceptance scenarios. The Plan owns technical design, component and interface changes, data flow, implementation order, and verification.
3. Review the behavior and technical design before implementing the affected scope. The Plan must resolve implementation decisions rather than leave them to the implementer. New behavior revises the Spec. New implementation decisions revise the Plan.
4. Implement inside that boundary. Add evidence for each acceptance condition, or say why existing evidence is enough. Update current-state docs in the same change.
5. Before retiring a completed Spec or Plan, move still-valid behavior, invariants, and operational limits into current-state docs and tests. The final delivery PR may delete the completed files. Keep an unfinished Spec or Plan active.
6. Git history and the delivery PR keep the retired decision. Do not copy completed Specs or Plans into a second archive.

## Change Design Gate

Every change needs a requirement record. Use the smallest set of artifacts that makes behavior and implementation reviewable.

| Change type | Required artifact |
| --- | --- |
| Product behavior | One Spec plus one detailed Plan for the same deliverable |
| Technical refactor without changed user behavior | Detailed Plan with compatibility and acceptance conditions |
| Narrow maintenance, tests, or documentation | Requirement and PR checklist; a separate Plan only when useful |

A Spec defines observable interactions, scope, failure behavior, and acceptance examples. Use stable scenario IDs and Given/When/Then where useful. Link scenarios to tests. A Spec does not prescribe components, interfaces, or execution order. Keep active Specs under [`specs/`](specs/). A small change may keep both sections in the PR description. Split only when each slice has an independently demonstrable outcome.

Shared architecture, compatibility, security, and recovery decisions belong in a reviewed Plan. After implementation, move lasting constraints into current-state architecture or operations docs. This template does not keep an RFC directory. Removing a proposal does not mark unimplemented ideas as delivered.

## Implementation Plans

[`docs/plans/`](docs/plans/) contains active technical design documents. Copy [`0000-template.md`](docs/plans/0000-template.md) and keep only the sections that apply. A product plan links its paired Spec. Explain the current constraints, the decisions, the boundaries, the failure and rollback behavior, and how the change will be verified. A file list alone is not a design.

Keep unknown owners, dates, and interfaces marked「待确认」. A plan may make feature-specific technical decisions, but it cannot silently override current architecture. At completion, migrate lasting constraints into current-state docs and tests, then delete the completed Spec and plan in the final delivery PR. Keep unfinished scope visible.

## Repository Architecture

Maintain the repository around real responsibilities:

- Domain rules describe business or product concepts and should not depend on UI, CLI, persistence, network, or framework adapters.
- Application services coordinate use cases and data flow without owning infrastructure details.
- Infrastructure adapters isolate external systems such as filesystems, databases, HTTP clients, queues, build tools, and hosted services.
- UI, CLI, or API entrypoints translate user or protocol input into application calls.
- Test fixtures and helpers belong near the tests or in clearly named test-support areas.

Avoid splitting code only to satisfy a mechanical one-export rule. Split when a file mixes responsibilities, a component or service needs independent testing, a boundary becomes reusable, or a change would otherwise make review harder. When adding a top-level directory or durable module boundary, document the reason in the PR/MR and record the technical choice in a Plan when the structure affects long-term integration.

## Documentation Standards

Keep each documentation surface focused:

- Use `README.md` for orientation, quick start, and current user-facing behavior.
- Use `CONTRIBUTING.md` for contribution workflow, review expectations, and repository policy.
- Use `AGENTS.md` for AI-agent instructions.
- Use `specs/` for active product behavior and acceptance contracts.
- Use `docs/plans/` for active technical designs and implementation plans. Migrate lasting decisions into current-state docs.
- Use `docs/` for durable current-state knowledge: architecture, development guides, operational runbooks, references, and onboarding tutorials.

Follow `docs/README.md` when adding or reorganizing project documentation. Update docs in the same change as behavior, configuration, command, API, deployment, architecture, or operational changes. Keep examples runnable when possible; otherwise, label them as illustrative and explain the validation gap.

## Pull Request Expectations

Every PR or MR should answer:

- What changed?
- Why is this change needed?
- How was this tested?
- Are there follow-up tasks or risks?
- What evidence proves the behavior, packaging, or deployment claim?
- Which validation gates were skipped, and why?

Use a conventional title:

```text
type(scope): summary
```

Allowed types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`.

Update the description when review feedback, rebases, or follow-up commits change the scope or validation result. Reviewers should be able to understand the final state from the PR/MR without reconstructing it from comments.

## Repository Checks

Do not commit private tokens, local config, generated workspaces, internal hostnames, or personal filesystem paths.

Keep package or deploy contents intentional. If a file should ship, verify it appears in the package or deployment dry-run.

Run `./scripts/check-repository.sh` locally before opening review. This generic check does not replace stack-specific tests, but it catches missing template files, tracked local artifacts, obvious secrets, private paths, and drift in review templates.

## Local Git Hooks

Install local hooks after cloning or creating a repository from this template:

```bash
./scripts/install-git-hooks.sh
```

The pre-commit hook runs `git diff --cached --check` and `./scripts/check-repository.sh` before a commit is created. Hooks are a local guardrail; CI and branch protection remain the authoritative enforcement because hooks can be missing or bypassed.

If `core.hooksPath` is already set to another path, `scripts/install-git-hooks.sh` fails instead of overwriting it. Re-run with `--force` only after confirming the existing hooks can be replaced or moved into `.githooks`.

## Repository Setup

Template files do not carry GitHub branch protection settings into every new repository. After creating a GitHub repository from this template, run:

```bash
./scripts/configure-github-repository.sh --repo OWNER/REPO --apply
```

The setup script requires a GitHub account or token with permission to edit repository settings. It protects the default branch by requiring pull requests, one approving review, fresh reviews after new pushes, linear history, resolved conversations, and the `Review` workflow checks named `repository checks` and `conventional PR title`.

## Security Reports

Use `SECURITY.md` for vulnerability reporting guidance. Do not include secrets, exploit details, or private infrastructure in public issues or pull requests.
