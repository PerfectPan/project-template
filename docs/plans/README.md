# Implementation Plans

Active Plans own the technical design and execution sequence. Product work pairs one Plan with one behavioral Spec. A technical refactor may use a Plan alone. Split only for independently deliverable work and record dependencies.

Start from [`0000-template.md`](0000-template.md). Link the Spec and current architecture. Resolve component responsibilities, interface changes, data flow, tradeoffs, failure handling, and recovery before implementation. Each task identifies what changes, its owning files or components, tests, and an exit condition.

Keep unresolved designs blocked. Feature-specific technical decisions belong here. Shared decisions follow the same review rules in [CONTRIBUTING](../../CONTRIBUTING.md#change-design-gate). A file inventory alone is not a Plan.

At completion, migrate enduring constraints to current-state documentation and tests, then delete the paired completed Spec and Plan in the final delivery PR. Preserve unfinished scope. Follow the [SDD lifecycle](../../CONTRIBUTING.md#sdd-workflow-and-document-lifecycle).
