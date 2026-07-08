# Delivery Contract

This template keeps delivery and review expectations technology-agnostic. A new project should replace stack-specific placeholders, but keep the evidence, validation, and repository hygiene contract intact.

## Required Project Wiring

Every project created from this template should define:

- project purpose and quick start in `README.md`
- setup, contribution, and validation commands in `CONTRIBUTING.md`
- agent workflow and required commands in `AGENTS.md`
- vulnerability and sensitive-data reporting in `SECURITY.md`
- a PR or MR template that asks for motivation, implementation notes, validation, evidence, and risks
- CI that runs `./scripts/repository-check.sh` plus stack-specific format, lint, test, build, and package or release dry-run commands
- an RFC path for changes that affect public behavior, trust boundaries, configuration shape, rollout, rollback, or repository structure

## Review Evidence Standard

PRs and MRs should be reviewable from their final description. The description should name:

- what changed and why
- domain boundaries, data flow, or public contracts touched by the change
- exact commands run, with skipped gates and concrete blockers
- logs, screenshots, package output, deployed URLs, or other artifacts that prove user-visible claims
- compatibility, migration, rollout, rollback, and follow-up risks

When review feedback changes the code or validation result, update the PR/MR description instead of leaving the final state buried in comments.

## Repository Hygiene Gate

`./scripts/repository-check.sh` is intentionally small and stack-neutral. It checks:

- required template files exist
- GitHub PR and GitLab MR templates keep the same required sections
- local artifacts and generated output are not tracked
- obvious credentials, private keys, local filesystem paths, and placeholder private references do not appear in tracked content

This gate does not replace project-specific tests. It is the baseline every project can run before choosing a stack.

## First-Project Checklist

After creating a real project from this template:

- replace placeholder validation commands in `AGENTS.md` and `CONTRIBUTING.md`
- keep `.github/workflows/repository-hygiene.yml` enabled unless the project has an equivalent hygiene gate
- copy or adapt `.github/workflows/ci.yml.example` into a real stack CI workflow
- add `.env.example` or equivalent configuration documentation if runtime configuration is needed
- run format, lint, tests, build, package or release dry-run, and `./scripts/repository-check.sh`
- update `CHANGELOG.md` for the first user-facing release
