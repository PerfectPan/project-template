# Project Template

A technology-agnostic repository template for starting maintainable, publishable, AI-friendly projects.

Use this template when creating a new project that should have consistent contribution rules, agent instructions, review expectations, and repository hygiene from day one.

## Start a New Project

1. Create a new repository from this template.
2. Replace this README with the new project's name, purpose, and quick start.
3. Fill in the project-specific validation commands in `AGENTS.md` and `CONTRIBUTING.md`.
4. Choose the actual implementation stack and add the source layout.
5. Install the shared checks and the local Git hooks:

   ```bash
   gh extension install PerfectPan/gh-repo-checks
   ./scripts/install-git-hooks.sh
   ```

6. Replace `.github/workflows/ci.yml.example` with a real `.github/workflows/ci.yml` for the project stack; the repository check accepts either file.
7. Keep `.github/workflows/review.yml` enabled for generic review checks.
8. Configure GitHub repository protection after the new repository is created:

   ```bash
   gh repo-checks protect --repo OWNER/REPO --apply
   ```

9. Choose a release tool (changesets or Rush change files) before the first release; it generates package changelogs. See `CONTRIBUTING.md` Release Notes.
10. Pick the license by project type: tools and libraries keep the MIT `LICENSE`; applications switch to GPL-3.0-only. See `CONTRIBUTING.md` License.

## Included

- `AGENTS.md` for agent workflow rules. Claude Code, Codex and other agents read it directly, so there is no separate `CLAUDE.md`.
- `CONTRIBUTING.md` for human contribution flow.
- `SECURITY.md` for vulnerability and sensitive data reporting.
- `docs/README.md` for architecture, development, operations, and reference documentation standards.
- `.github/pull_request_template.md` for PR summaries and validation.
- `.github/ISSUE_TEMPLATE/` for bug and feature reports.
- `.github/workflows/review.yml` for the repository, PR title, and PR description checks from [`PerfectPan/gh-repo-checks`](https://github.com/PerfectPan/gh-repo-checks).
- `.githooks/pre-commit` for local commit-time repository checks.
- `.gitlab/merge_request_templates/default.md` for GitLab-style MR summaries.
- `docs/specs/0000-template.md` for active product behavior.
- `docs/plans/0000-template.md` for active technical decisions and detailed execution plans.
- `.github/repo-checks.conf` for this repository's additions to the shared repository check.
- `scripts/install-git-hooks.sh` for installing local Git hooks.
- `.editorconfig` for consistent text formatting.

## License

MIT. See [LICENSE](LICENSE). Projects created from this template choose their own license; see step 10 above.

## Template Maintenance

Keep this repository generic. Do not add language-specific package files, framework defaults, generated output, or project-specific business logic.

Keep collaboration policy in `AGENTS.md` and `CONTRIBUTING.md`, active behavior in `docs/specs/`, active technical decisions and execution plans in `docs/plans/`, and current product or engineering knowledge in `docs/`.
