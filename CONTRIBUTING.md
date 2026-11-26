# Contributing

## Development Setup

Replace this section with project-specific setup instructions.

```bash
# install local Git hooks
./scripts/install-git-hooks.sh

# run repository checks
gh repo-checks repository

# check a PR or MR title
gh repo-checks pr-title "docs: update project template"

# check a PR or MR description from a file or stdin
gh repo-checks pr-body pr-body.md

# preview GitHub repository protection setup
gh repo-checks protect --repo OWNER/REPO

# install dependencies
# run tests
# run local app or CLI
```

## Contribution Flow

1. Open an issue or discussion for ambiguous work.
2. Check the [Change Design Gate](#change-design-gate). Write an implementation plan only when the change meets the gate; bugfixes and routine changes go straight to implementation and PR/MR summary.
3. Create a focused branch with a short descriptive name.
4. Install local Git hooks with `./scripts/install-git-hooks.sh` if this checkout has not already done so.
5. Identify the affected domain concepts, layer boundaries, data flow, and tests before changing code.
6. Implement the change, keeping responsibilities separated and using existing project patterns.
7. Add or update tests for behavior changes.
8. Update `README.md`, `docs/`, `AGENTS.md`, `CONTRIBUTING.md`, or the active Plan when user-facing behavior, architecture, development workflow, or project policy changes.
9. Run repository checks, title checks, and project-specific format, lint, test, build, and package checks.
10. For a newly created GitHub repository, run `gh repo-checks protect --apply` with an admin-authorized account.
11. Open a pull request or merge request with a conventional title, a summary of what changed and why, validation with skipped gates, and any risks.
12. Keep the PR/MR description current after review feedback, rebases, validation reruns, or scope changes.

## Required Checks

Replace these placeholders after choosing the project stack:

```bash
# Local Git hooks:
./scripts/install-git-hooks.sh

# Repository checks:
gh repo-checks repository

# PR/MR title:
gh repo-checks pr-title "docs: update project template"

# PR/MR description:
gh repo-checks pr-body pr-body.md

# GitHub repository setup dry run:
gh repo-checks protect --repo OWNER/REPO

# Format:

# Lint:

# Test:

# Build:

# Package or release dry-run:
```

## CI Execution Policy

The full CI example in `.github/workflows/ci.yml.example` runs for Ready PRs when they are opened, updated with
new commits (`synchronize`), reopened, or changed from Draft to Ready. The job skips Draft PR events. Keep the
existing `push` to `main` trigger, and preserve any project-specific manual or other necessary triggers when
adopting this policy; the Draft condition applies only to pull requests. Replace the placeholder command with
the project's real checks before treating the example as runnable CI.

Keep work in Draft until local checks are finished. GitHub reports a skipped job as successful, even when it is
required by branch protection; this is not evidence that tests ran. After marking a PR Ready, confirm the full
CI job actually executed and passed for the current head and merge result before merging. Existing release PR
flows that return to Draft after version updates keep their maintainer-controlled Ready step.

The separate `Review` workflow is intentionally lightweight: repository hygiene, title and description checks.
Keep it active on Draft PRs and metadata edits so authors get feedback before requesting full CI. Bot authors
remain exempt only from the description check. Full CI has no metadata-edit trigger; follow the project's
instructions for refreshing checks after metadata-only or base-only changes.

Template files do not configure branch protection or rulesets. Preserve the repository's required check names
and inspect its current merge requirements when adopting this policy; a skipped full-CI check must not be used
as proof that a Ready PR is safe to merge. See [Repository Setup](#repository-setup) for separately authorized
repository configuration.

## Plan Lifecycle And Retirement

1. Draft a plan from [`docs/plans/0000-template.md`](docs/plans/0000-template.md) only when triggered by the [Change Design Gate](#change-design-gate). Keep `Status: blocked` while a material scope, interface, data, or rollout decision is unresolved.
2. Review the goals, boundaries, and key decisions before implementing; update the plan if design choices change mid-flight.
3. Implement within that scope, adding tests and updating current-state `docs/` in the same change.
4. Retire the plan as soon as its code scope lands on the default branch. Do not keep a completed plan in `docs/plans/` waiting on deferred manual checks or future polish. In the final delivery PR/MR:
   - Move any remaining manual verification or follow-up work to issues.
   - Migrate lasting knowledge that code cannot express (invariants, ownership/trust boundaries, tradeoffs, external quirks, validation limits) into current-state `docs/` (and local `Why:` comments in code).
   - Delete the completed plan file. Git history and the delivery PR/MR keep the full execution record.

## Change Design Gate

Most changes need only a clear PR/MR description (`## Summary` and `## Validation`), not a separate document.

| Change scope | Required artifact |
| --- | --- |
| Bugfix, localized feature/refactor, tests, dependencies, or docs | PR/MR description explaining what changed, why, and how it was verified |
| New subsystem or package, public contract/schema/protocol change, major design tradeoffs, or multi-PR/multi-session work | One Plan in [`docs/plans/`](docs/plans/) |

## Implementation Plans

[`docs/plans/`](docs/plans/) holds active Plans only while non-trivial work is in flight. Copy [`0000-template.md`](docs/plans/0000-template.md) and keep only the sections that apply. State the problem, goals, non-goals, boundaries, rejected alternatives, failure/rollback behavior, and verification; a file list alone is not a design.

Keep unknown owners, dates, and interfaces marked "unconfirmed". A plan may make feature-specific technical decisions, but it cannot silently override current architecture. Follow [Plan Lifecycle And Retirement](#plan-lifecycle-and-retirement) when the code lands.

## Repository Architecture

Maintain the repository around real responsibilities:

- Domain rules describe business or product concepts and should not depend on UI, CLI, persistence, network, or framework adapters.
- Application services coordinate use cases and data flow without owning infrastructure details.
- Infrastructure adapters isolate external systems such as filesystems, databases, HTTP clients, queues, build tools, and hosted services.
- UI, CLI, or API entrypoints translate user or protocol input into application calls.
- Test fixtures and helpers belong near the tests or in clearly named test-support areas.

For JavaScript or TypeScript projects, take shared lint, format, and `tsconfig` rules from the `PerfectPan/lint-config` repository instead of copying them; see its README. Other stacks choose their own tooling.

Avoid splitting code only to satisfy a mechanical one-export rule. Split when a file mixes responsibilities, a component or service needs independent testing, a boundary becomes reusable, or a change would otherwise make review harder. When adding a top-level directory or durable module boundary, document the reason in the PR/MR and record the technical choice in a Plan when the structure affects long-term integration.

## Documentation Standards

Keep each documentation surface focused:

- Use `README.md` for orientation, quick start, and current user-facing behavior.
- Use `CONTRIBUTING.md` for contribution workflow, review expectations, and repository policy.
- Use `AGENTS.md` for AI-agent instructions.
- Use `docs/plans/` for active implementation plans while non-trivial work is in flight; retire them when code lands.
- Use `docs/` (`guides/`, `reference/`, `architecture/`, `development/`) for durable current-state knowledge that code alone cannot express.

Follow `docs/README.md` when adding or reorganizing project documentation. Update docs in the same change as behavior, configuration, command, API, deployment, architecture, or operational changes. Keep examples runnable when possible; otherwise, label them as illustrative and explain the validation gap.

## Pull Request Expectations

The PR/MR template has three sections:

- **Summary**: what changed and why, with links to the issue or Plan when there is one.
- **Validation**: the commands you ran and their results, evidence for behavior or packaging claims, and skipped gates with reasons.
- **Risks** (optional): compatibility, rollout, rollback, or follow-up risks. Delete it when there are none.

Use a conventional title:

```text
type(scope): summary
```

Allowed types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`.

Titles are English; `gh repo-checks pr-title` rejects CJK characters. Bot-generated PRs follow the same rule, so configure release and dependency bots to emit titles such as `chore(release): version packages` or `chore(deps): bump <package> to <version>`.

Summary and Validation must be present and contain real content, not template placeholders; other sections are optional. Do not include agent attribution lines such as "Generated with <tool>"; the author is accountable for the content. `gh repo-checks pr-body` enforces these rules, and the `PR description` job runs it on every pull request event, including description edits. PRs opened by bot accounts skip the description check, because dependency and release bots write their own bodies; they still must pass the title check. A skipped job still satisfies the required status check.

Update the description when review feedback, rebases, or follow-up commits change the scope or validation result. Reviewers should be able to understand the final state from the PR/MR without reconstructing it from comments.

## Release Notes

Release notes come from the release tool. Packages released with changesets or Rush record each user-facing change as a change file (`pnpm changeset` or `rush change`) in the same PR, and the tool writes each package's `CHANGELOG.md` at release time. Do not edit generated changelogs or keep a hand-written root `CHANGELOG.md` beside them. A project without a release tool publishes its notes in GitHub Releases.

## License

Choose the license by project type when the repository is created:

- Applications (services, desktop or web apps, agents) use GPL-3.0-only, so distributed modifications stay open source. Replace `LICENSE` with the GPL text (`gh api licenses/gpl-3.0 --jq .body > LICENSE`) and set package metadata to `GPL-3.0-only`.
- Tools and libraries (CLIs, packages, configs, templates) use MIT, which this template ships in `LICENSE`. Package metadata uses `MIT`.

Record the choice in the README. Change it later only as a deliberate project decision, and keep third-party notices for code or data copied from other projects.

## Repository Checks

Do not commit private tokens, local config, generated workspaces, internal hostnames, or personal filesystem paths.

Keep package or deploy contents intentional. If a file should ship, verify it appears in the package or deployment dry-run.

The review checks come from [`PerfectPan/gh-repo-checks`](https://github.com/PerfectPan/gh-repo-checks): CI runs them through its GitHub Action (`uses: PerfectPan/gh-repo-checks@v1`), and locally they run as a GitHub CLI extension (`gh extension install PerfectPan/gh-repo-checks`). Do not copy the check scripts into this repository; change them upstream. Repository-specific additions, such as extra required files or forbidden patterns, go in `.github/repo-checks.conf`, and repository-specific scripts run as extra steps after the shared check.

Run `gh repo-checks repository` locally before opening review. This generic check does not replace stack-specific tests, but it catches missing template files, tracked local artifacts, obvious secrets, private paths, and drift in review templates.

Workflows reference actions by their latest major version tag, such as `actions/checkout@v7`, not by commit SHA. Runtimes in CI and version files follow the current LTS line of the language, such as the Node.js Active LTS major, and move to the next LTS line in one change when it starts. Workflow files copied from this template take action upgrades from the template rather than local edits.

## Local Git Hooks

Install local hooks after cloning or creating a repository from this template:

```bash
./scripts/install-git-hooks.sh
```

The pre-commit hook runs `git diff --cached --check` and `gh repo-checks repository --staged` before a commit is created; without the extension it warns and skips the repository check. Hooks are a local guardrail; CI and branch protection remain the authoritative enforcement because hooks can be missing or bypassed.

If `core.hooksPath` is already set to another path, `scripts/install-git-hooks.sh` fails instead of overwriting it. Re-run with `--force` only after confirming the existing hooks can be replaced or moved into `.githooks`.

## Repository Setup

Template files do not carry GitHub branch protection settings into every new repository. After creating a GitHub repository from this template, run:

```bash
gh repo-checks protect --repo OWNER/REPO --apply
```

The command requires a GitHub account or token with permission to edit repository settings. It protects the default branch by requiring pull requests, one approving review (fresh after new pushes), linear history, resolved conversations, and the `Review` workflow checks named `repository checks`, `conventional PR title`, and `PR description`.

A repository with a single maintainer cannot approve its own pull requests; pass `--approvals 0` to keep the other protections without a review requirement. Add the project's CI job names with `--check NAME` (repeatable) so they are required too. If the repository already uses a ruleset, add these checks to the ruleset instead of layering classic branch protection on top.

Labels are not copied either. GitHub's defaults include `bug` and `enhancement` but not `task`, and an issue template's label only applies when the label exists, so create it once:

```bash
gh label create task --repo OWNER/REPO --color 0E8A16 --description "Maintenance, refactoring, dependency, or tooling work"
```

## Security Reports

Use `SECURITY.md` for vulnerability reporting guidance. Do not include secrets, exploit details, or private infrastructure in public issues or pull requests.
