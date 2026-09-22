# <Design title>

Copy this file when starting a plan. Keep the sections that apply to a new system, a change, or a migration, and delete the rest. If an owner, reviewer, or date is unknown, write "unconfirmed". Do not invent them.

Writing and review rules live in the `technical-design-docs` skill when it is installed. This file is only the document shape.

<!-- Keep the sections that apply to a new system, a change, or a migration. Merge sections in a small design and delete the rest. If an owner, reviewer, or date is unknown, write "unconfirmed". Do not invent them. -->

- Status: draft / in review / accepted
- Owner: <name or team>
- Reviewer: <name or team>
- Last updated: <date>
- Paired Spec: <path, or none>

## Contents

<!-- List the top-level sections you keep. Delete this comment before review. -->

## 1. Background and goals

### 1.1 Current behavior and constraints

State the existing behavior and limits that this design depends on. For a new system, state the demand and the external constraints. Important conclusions need evidence from code, an interface, data, or an earlier decision.

### 1.2 Problem

State the concrete problem. For a change or migration, state why it is worth changing: cost, risk, failure mode, or a missing capability.

### 1.3 Goals and success criteria

List results the design must achieve and that someone can check.

### 1.4 Non-goals

State related problems this design will not handle, so the review does not expand.

## 2. Outline

### 2.1 Design principles

Keep only principles that actually constrain a choice.

### 2.2 Boundaries and responsibilities

Name the systems or domains involved, who owns each, and what each owns. If ownership moves, say what changes. Add a diagram when the relationship is hard to follow in prose.

### 2.3 Main path

Describe the target path. Add a before/after comparison only when the difference changes the review. A new system does not need a diagram of the current state.

### 2.4 Design decisions

For each important choice, state the alternatives considered and why this one was chosen.

## 3. Detailed design

<!-- Keep the subsections you need, and add domain-specific ones. -->

### 3.1 Entry points and request path

### 3.2 Interfaces

### 3.3 Domain model, state, and data ownership

### 3.4 State transitions and lifecycle

### 3.5 Concurrency, idempotency, and retries

### 3.6 Failures and recovery

### 3.7 Compatibility and migration

### 3.8 Security and privacy

### 3.9 Metrics, logs, and traces

## 4. Rollout and stability

<!-- Keep this when the change ships or migrates data. For a local tool, describe release and recovery at the actual risk. -->

### 4.1 Gates and rollout stages

State the entry conditions, the rollout steps, and when to stop widening the rollout.

### 4.2 Signals and alerts

List success, failure, latency, and quality signals, and who owns each.

### 4.3 Rollback

State the trigger, the steps, the data impact, and the expected recovery time.

## 5. Verification

<!-- Keep the checks that match the risk. A local tool or a low-risk change needs the important checks, not all four. -->

### 5.1 Functional checks

### 5.2 Failure and retry checks

### 5.3 Compatibility checks

### 5.4 End-to-end acceptance

## 6. Delivery plan and effort

Keep this when more than one person delivers the change. Mark unconfirmed owners and dates as "unconfirmed". Estimates must state their basis, assumptions, and dependencies. An estimate is not a team commitment.

### 6.1 Work split

| Component or domain | Change | Owner | Depends on | Effort |
| --- | --- | --- | --- | --- |
| <component> | <deliverable> | <owner> | <dependency> | <range or person-days> |

### 6.2 Schedule

| Stage | Work | Precondition | When | Deliverable |
| --- | --- | --- | --- | --- |
| <stage> | <work> | <precondition> | <range> | <artifact or milestone> |

### 6.3 Release order and milestones

State cross-component compatibility, the required release order, and the milestones used to track progress.

## 7. Risks, open questions, and follow-up

| Item | Type | Impact | Owner | Next step or deadline |
| --- | --- | --- | --- | --- |
| <item> | risk / open question / follow-up | <impact> | <owner> | <next step> |

## Appendix

Put evidence, rejected options, and long references here when they would break the main review.
