#!/usr/bin/env bash
set -euo pipefail

repo_root="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$repo_root"

fail() {
  printf 'repository-check: %s\n' "$*" >&2
  exit 1
}

required_files=(
  "AGENTS.md"
  "CLAUDE.md"
  "CONTRIBUTING.md"
  "README.md"
  "SECURITY.md"
  "CHANGELOG.md"
  "docs/delivery.md"
  ".editorconfig"
  ".gitignore"
  ".github/pull_request_template.md"
  ".github/ISSUE_TEMPLATE/bug_report.md"
  ".github/ISSUE_TEMPLATE/feature_request.md"
  ".github/workflows/repository-hygiene.yml"
  ".github/workflows/ci.yml.example"
  ".gitlab/merge_request_templates/default.md"
  "rfcs/0000-template.md"
)

missing=()
for file in "${required_files[@]}"; do
  if [[ ! -f "$file" ]]; then
    missing+=("$file")
  fi
done

if (( ${#missing[@]} > 0 )); then
  printf 'Missing required template files:\n' >&2
  printf '  - %s\n' "${missing[@]}" >&2
  exit 1
fi

tracked_artifact_pattern='(^|/)(node_modules|dist|build|coverage|tmp|temp|\.cache|\.turbo|\.next|\.vite|\.pytest_cache|__pycache__|\.DS_Store)(/|$)|(^|/)\.env($|\.)|\.log$|(^|/)\.omx(/|$)|(^|/)\.codex(/|$)|(^|/)\.claude/settings\.local\.json$'
tracked_artifacts="$(git ls-files | grep -E "$tracked_artifact_pattern" || true)"
if [[ -n "$tracked_artifacts" ]]; then
  printf 'Tracked local, generated, or machine-specific artifacts found:\n%s\n' "$tracked_artifacts" >&2
  exit 1
fi

secret_pattern='AKIA[0-9A-Z]{16}|gh[pousr]_[A-Za-z0-9_]{36,}|xox[baprs]-[A-Za-z0-9-]{10,}|-----BEGIN ([A-Z]+ )?PRIVATE KEY-----'
private_path_pattern='(/Users/[^[:space:]`"'"'"'<>]+|/home/[^[:space:]`"'"'"'<>]+|C:\\Users\\)'
placeholder_pattern='private-token|internal-domain\.example|HOME_PATH_PLACEHOLDER'
findings_file="$(mktemp "${TMPDIR:-/tmp}/repository-check-findings.XXXXXX")"
trap 'rm -f "$findings_file"' EXIT

if git grep -n -I -E "$secret_pattern|$private_path_pattern|$placeholder_pattern" -- . \
  ':!AGENTS.md' \
  ':!CONTRIBUTING.md' \
  ':!SECURITY.md' \
  ':!docs/delivery.md' \
  ':!scripts/repository-check.sh' >"$findings_file"; then
  printf 'Potential secret, private path, or private placeholder found:\n' >&2
  cat "$findings_file" >&2
  exit 1
fi

required_review_sections=(
  "Summary"
  "Motivation"
  "Implementation Notes"
  "Validation"
  "Evidence"
  "Safety Checklist"
  "Follow-up Risks"
)

for template in ".github/pull_request_template.md" ".gitlab/merge_request_templates/default.md"; do
  for section in "${required_review_sections[@]}"; do
    if ! grep -qE "^## ${section}$" "$template"; then
      fail "$template is missing required section: $section"
    fi
  done
done

printf 'repository-check: ok\n'
