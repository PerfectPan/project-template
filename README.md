# Project Template

A technology-agnostic repository template for starting maintainable, publishable, AI-friendly projects.

Use this template when creating a new project that should have consistent contribution rules, agent instructions, review expectations, and repository hygiene from day one.

## Start a New Project

1. Create a new repository from this template.
2. Replace this README with the new project's name, purpose, and quick start.
3. Fill in the project-specific validation commands in `AGENTS.md` and `CONTRIBUTING.md`.
4. Choose the actual implementation stack and add the source layout.
5. Install local Git hooks:

   ```bash
   ./scripts/install-git-hooks.sh
   ```

6. Enable or replace the stack-specific CI example in `.github/workflows/ci.yml.example`.
7. Keep `.github/workflows/review.yml` enabled for generic review checks.
8. Configure GitHub repository protection after the new repository is created:

   ```bash
   ./scripts/configure-github-repository.sh --repo OWNER/REPO --apply
   ```

9. Update `CHANGELOG.md` for the first release.
10. Keep or replace `LICENSE` according to the project needs.

## Included

- `AGENTS.md` for agent workflow rules.
- `CLAUDE.md` for Claude Code entrypoint instructions.
- `CONTRIBUTING.md` for human contribution flow.
- `SECURITY.md` for vulnerability and sensitive data reporting.
- `docs/README.md` for architecture, development, operations, and reference documentation standards.
- `.github/pull_request_template.md` for PR summaries and validation.
- `.github/ISSUE_TEMPLATE/` for bug and feature reports.
- `.github/workflows/review.yml` for generic repository and PR title checks.
- `.githooks/pre-commit` for local commit-time repository checks.
- `.gitlab/merge_request_templates/default.md` for GitLab-style MR summaries.
- `rfcs/0000-template.md` for substantial design changes.
- `scripts/check-repository.sh` for local and CI repository checks.
- `scripts/check-pr-title.sh` for conventional PR or MR title checks.
- `scripts/install-git-hooks.sh` for installing local Git hooks.
- `scripts/configure-github-repository.sh` for post-create GitHub branch protection setup.
- `.editorconfig` for consistent text formatting.

## Template Maintenance

Keep this repository generic. Do not add language-specific package files, framework defaults, generated output, or project-specific business logic.

Keep collaboration policy in `AGENTS.md` and `CONTRIBUTING.md`, design proposals and decision history in `rfcs/`, and current product or engineering knowledge in `docs/`.
