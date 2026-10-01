# Changelog

## Unreleased

- Workflows use `actions/checkout@v7`; actions are referenced by their latest major version tag, not a commit SHA. Downstream repositories take action upgrades from this template instead of editing `review.yml` locally.
- Specs moved from `specs/` to `docs/specs/`, next to `docs/plans/`.
- `configure-github-repository.sh` accepts `--approvals N` (use 0 for a single maintainer) and repeatable `--check NAME` for project CI jobs.
- Removed trailing blank lines that failed `git diff --cached --check` in repositories copying the template files.
- Plans now pair technical decisions with a detailed execution plan: preconditions, completion contract, ordered tasks with exit conditions, validation ledger, and rollback per batch.
- Added `scripts/check-pr-body.sh` and a `PR description` review job that require template sections, real Summary and Validation content, and no agent attribution lines.
- PR title checks now reject CJK characters; bot-generated PRs must use conventional titles too.
- Repository checks share one review-section list, match private paths only at a path boundary, and avoid `grep -q` SIGPIPE failures under `pipefail`.
- Documented `PerfectPan/lint-config` as the shared lint, format, and `tsconfig` source for JavaScript and TypeScript projects.
- Replaced the RFC directory with a behavioral Spec plus a detailed technical Plan. Lasting constraints move to current-state docs; Git history keeps retired artifacts.
- Initial project template.
- Added a generic review workflow for repository checks and conventional PR titles.
- Added local and CI-friendly repository checks for required template files, tracked local artifacts, obvious secrets, private paths, and review-template drift.
- Added installable local pre-commit hooks for staged whitespace and staged repository checks.
- Added a post-create GitHub repository setup script for default branch protection.
- Added documentation standards, contribution and agent guidance for review evidence, validation gates, and repository architecture maintenance.
