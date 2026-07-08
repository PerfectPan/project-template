# Project Template

A technology-agnostic repository template for starting maintainable, publishable, AI-friendly projects.

Use this template when creating a new project that should have consistent contribution rules, agent instructions, review expectations, and repository hygiene from day one.

## Start a New Project

1. Create a new repository from this template.
2. Replace this README with the new project's name, purpose, and quick start.
3. Fill in the project-specific validation commands in `AGENTS.md` and `CONTRIBUTING.md`.
4. Choose the actual implementation stack and add the source layout.
5. Enable or replace the stack-specific CI example in `.github/workflows/ci.yml.example`.
6. Run `./scripts/repository-check.sh` and keep it in CI as a generic repository-hygiene gate.
7. Update `CHANGELOG.md` for the first release.
8. Keep or replace `LICENSE` according to the project needs.

## Included

- `AGENTS.md` for agent workflow rules.
- `CLAUDE.md` for Claude Code entrypoint instructions.
- `CONTRIBUTING.md` for human contribution flow.
- `SECURITY.md` for vulnerability and sensitive data reporting.
- `docs/delivery.md` for the cross-project delivery and evidence contract.
- `.github/pull_request_template.md` for PR summaries and validation.
- `.github/ISSUE_TEMPLATE/` for bug and feature reports.
- `.github/workflows/repository-hygiene.yml` for generic repository-hygiene checks.
- `.gitlab/merge_request_templates/default.md` for GitLab-style MR summaries.
- `rfcs/0000-template.md` for substantial design changes.
- `scripts/repository-check.sh` for local and CI repository hygiene checks.
- `.editorconfig` for consistent text formatting.

## Template Maintenance

Keep this repository generic. Do not add language-specific package files, framework defaults, generated output, or project-specific business logic.
