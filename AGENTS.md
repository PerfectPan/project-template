# Agent Guidelines

This repository is intended to become a maintainable, publishable project. Treat every change as if it may be reviewed, packaged, indexed, and installed by users.

## Working Rules

- Keep changes scoped to the user request and nearby code.
- Prefer existing project patterns over new abstractions.
- Do not commit local config, credentials, generated logs, temporary workspaces, build artifacts, or machine-specific paths.
- Do not add private tokens, internal hostnames, private repository names, or personal filesystem paths.
- Use `rg` for searches when available.
- Update tests and documentation when behavior changes.

## Project-Specific Commands

Keep the repository-hygiene command active, and replace the remaining placeholders after choosing the project stack:

```bash
# Repository hygiene:
./scripts/repository-check.sh

# Format:

# Lint:

# Test:

# Build:

# Package or release dry-run:

# Security or package-specific hygiene scan:
```

Do not claim implementation work is complete until the relevant commands pass, or until skipped commands are explained with concrete blockers.

## Documentation

- Keep `README.md` focused on orientation, quick start, and current user-facing behavior.
- Use `CONTRIBUTING.md` for contribution workflow.
- Use `rfcs/` for substantial design proposals.
- Update `CHANGELOG.md` for user-facing changes unless the change is docs-only or repository-only.

## AI Delivery Workflow

When an AI agent completes implementation work:

1. Inspect `git status --short --branch`.
2. Verify generated files, secrets, machine paths, and build artifacts are not staged.
3. Run the required verification gates and record the exact commands.
4. Commit pending changes with a concise conventional commit message.
5. Push the branch and verify the remote head.
6. Create or reuse a GitHub Pull Request when the task is not landing directly on `main`.
7. Include a delivery summary with motivation, implementation notes, validation, and follow-up risks.

## Delivery and Review Evidence

- Treat `docs/delivery.md`, the PR/MR template, and CI as one shared delivery contract.
- PR/MR descriptions must include motivation, implementation notes, exact validation commands, skipped gates with reasons, and follow-up risks.
- If a claim depends on logs, screenshots, package output, deployed behavior, or generated artifacts, attach or link the evidence in the PR/MR.
- Update the PR/MR description after substantial code changes, review-driven revisions, rebases that change behavior, or validation reruns.
- Keep GitHub PR and GitLab MR templates in sync if the project uses both hosting styles.

## Git

- Branch names should be short and descriptive, such as `feat/release-source`.
- Commit messages should be concise and use conventional prefixes when they fit.
- Signed commits are preferred when local git signing is configured.
- Do not rewrite or discard user changes unless explicitly requested.

## Publish Safety Check

Before pushing public-facing or package-facing changes, scan for accidental private references. Adjust globs for the project stack:

```bash
rg --hidden --no-ignore -n "private-token|secret|internal-domain.example|HOME_PATH_PLACEHOLDER" . \
  --glob '!.git/**' \
  --glob '!.omx/**' \
  --glob '!AGENTS.md' \
  --glob '!CONTRIBUTING.md' \
  --glob '!SECURITY.md'
```
