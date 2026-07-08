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
2. Write an RFC before substantial changes to public behavior, configuration, trust boundaries, release flow, or repository structure.
3. Create a focused branch with a short descriptive name.
4. Install local Git hooks with `./scripts/install-git-hooks.sh` if this checkout has not already done so.
5. Identify the affected domain concepts, layer boundaries, data flow, and tests before changing code.
6. Implement the change, keeping responsibilities separated and using existing project patterns.
7. Add or update tests for behavior changes.
8. Update `README.md`, `CHANGELOG.md`, `docs/`, `AGENTS.md`, `CONTRIBUTING.md`, or RFCs when user-facing behavior, architecture, development workflow, operations, or project policy changes.
9. Run repository checks, title checks, and project-specific format, lint, test, build, and package checks.
10. For a newly created GitHub repository, run the repository setup script with an admin-authorized account.
11. Open a pull request or merge request with a conventional title, motivation, implementation notes, validation, evidence, skipped gates, and follow-up risks.
12. Keep the PR/MR description current after review feedback, rebases, validation reruns, or scope changes.

Small typo corrections, narrow documentation fixes, and repository metadata updates do not need an RFC.

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

## When to Write an RFC

Use `rfcs/` when a change affects:

- public behavior
- install, deploy, or rollback safety
- trust boundaries
- configuration shape
- release process
- repository structure
- long-term integration strategy
- durable domain boundaries or data flow

RFCs should describe the problem, decision drivers, goals, non-goals, proposed design, architecture impact, validation plan, rollout plan, rollback plan, alternatives, risks, and open questions.

## Repository Architecture

Maintain the repository around real responsibilities:

- Domain rules describe business or product concepts and should not depend on UI, CLI, persistence, network, or framework adapters.
- Application services coordinate use cases and data flow without owning infrastructure details.
- Infrastructure adapters isolate external systems such as filesystems, databases, HTTP clients, queues, build tools, and hosted services.
- UI, CLI, or API entrypoints translate user or protocol input into application calls.
- Test fixtures and helpers belong near the tests or in clearly named test-support areas.

Avoid splitting code only to satisfy a mechanical one-export rule. Split when a file mixes responsibilities, a component or service needs independent testing, a boundary becomes reusable, or a change would otherwise make review harder. When adding a top-level directory or durable module boundary, document the reason in the PR/MR and use an RFC when the structure affects long-term integration.

## Documentation Standards

Keep each documentation surface focused:

- Use `README.md` for orientation, quick start, and current user-facing behavior.
- Use `CONTRIBUTING.md` for contribution workflow, review expectations, and repository policy.
- Use `AGENTS.md` for AI-agent instructions.
- Use `rfcs/` for substantial proposals, decision records, and long-term design changes before they become current project facts.
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
