---
name: ai-software-development
description: Plan, research, specify, build, test, and review software.
license: MIT
compatibility: Works with coding agents that support Agent Skills or can read SKILL.md.
metadata:
  version: "2.0.0"
---
# AI Software Development

## When to use
Use for new software projects, meaningful features, bug fixes, refactors, migrations, architecture decisions, and technical planning.

## Core principle
Think before coding. Reuse before building. Specify before implementing. Test and review before declaring success.

## Classify first
- SMALL: localized, low-risk change. Inspect -> fix -> test -> review.
- MEDIUM: meaningful feature/change. Inspect -> short spec -> reuse research if relevant -> plan -> implement -> test -> review.
- LARGE/NEW PROJECT: product discovery -> scope -> research -> architecture -> specs -> plan -> staged implementation -> tests -> independent review -> docs.

Do not force a heavyweight process onto trivial work.

## New-project gate
Do not begin major implementation until you have helped the user decide:
1. Target users and problems.
2. Main user journeys.
3. NOW / LATER / NOT NOW features.
4. Explicit non-goals.
5. Roles and permissions.
6. Data and integrations.
7. Security/privacy requirements.
8. Scale, hosting, budget, and maintenance assumptions.
9. Simplest suitable architecture.
10. Initial acceptance criteria.

## Reuse-before-build gate
Before creating a non-trivial subsystem, inspect/research in this order:
1. Existing code and patterns in the repository.
2. Framework/platform built-ins.
3. Official SDK/API.
4. Mature maintained open-source library.
5. Proven managed service.
6. Custom implementation only when justified.

Prefer official/current documentation and primary sources. Check maintenance, security, license, compatibility, dependency footprint, lock-in, replacement cost, and whether the dependency is actually necessary. Do not add a package for trivial code.

Record important reuse decisions in `docs/REUSE_RESEARCH.md` and major architecture decisions as ADRs.

## Architecture rules
Prefer the simplest architecture that meets real requirements. Default to a modular monolith unless there is a demonstrated need for distributed services. Do not introduce queues, caches, event buses, search infrastructure, microservices, Kubernetes, or extra databases without a requirement and documented reason.

## Specification rules
For meaningful features document: problem, goal, non-goals, users, flow, requirements, business rules, reuse decision, data/API/permission impact, states/errors, edge cases, acceptance criteria, tests, risks, and rollback/migration needs.

## Implementation rules
- Inspect before editing.
- Follow existing conventions.
- Make the smallest safe change.
- Do not modify unrelated code.
- Do not hide errors, weaken tests, or bypass security to make tests pass.
- Avoid speculative abstractions.
- Keep interfaces stable unless the approved plan requires a breaking change.

## Verification
Run the most relevant tests, lint/type checks, build checks, and targeted manual verification available. Compare the result against acceptance criteria. Report what was verified and what could not be verified.

## Independent review
For medium/large work, prefer a fresh review pass or separate agent/model after implementation. Review for correctness, regressions, security, unnecessary complexity, duplication, data/API compatibility, and spec compliance. Fix material findings and re-run verification.

## Parallel agents
Parallelize only after architecture/interfaces are clear. Give agents independent tasks and preferably separate branches/worktrees. Integrate centrally and run the full relevant test suite after merge.

## Required project memory
Keep these current when applicable:
- `docs/PROJECT_CHARTER.md`
- `docs/ARCHITECTURE.md`
- `docs/REUSE_RESEARCH.md`
- `docs/specs/*.md`
- `docs/decisions/ADR-*.md`

Load `references/WORKFLOW.md` when a detailed phase-by-phase procedure is needed. Use files in `templates/` to create project documentation.
