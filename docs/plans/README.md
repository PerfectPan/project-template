# Implementation Plans

A plan is one technical design document, not a task checklist. Product work pairs it with one behavioral Spec. A technical refactor may use a plan alone.

Start from [`0000-template.md`](0000-template.md). Keep only the sections the change needs: background, outline, detailed design, rollout, verification, and delivery. Delete the rest. Unknown owners and dates stay "unconfirmed".

The document shape matches the `technical-design-docs` skill. Install that skill for writing and review rules. This repository does not copy those rules.

Shared decisions follow [CONTRIBUTING](../../CONTRIBUTING.md#change-design-gate). At completion, move lasting constraints into current-state docs and tests, then delete the finished Spec and plan in the final delivery PR. Keep unfinished scope. Follow the [SDD lifecycle](../../CONTRIBUTING.md#sdd-workflow-and-document-lifecycle).
