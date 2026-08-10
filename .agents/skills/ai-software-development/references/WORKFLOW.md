# AI Development Workflow

## Purpose

This workflow is for AI-assisted software development where the user controls product decisions and AI helps with product planning, architecture, research, implementation, testing and review.

**Think before coding. Reuse before building. Specify before implementing. Test before declaring success.**

## Phase 0 — Intake
Classify the work: new project, feature, bug, refactor, migration, performance/security improvement. Ask only questions that materially affect the solution; inspect the repository when it already contains the answer.

## Phase 1 — Product planning
For a new product or major feature, act first as a product/technical adviser. Define target users, pain points, outcome, user journeys, must-have features, later features, excluded features, roles/permissions, integrations, data, security/privacy and hosting/budget/scale assumptions. Classify features as NOW, LATER or NOT NOW. Deliver `PROJECT_CHARTER.md`.

## Phase 2 — Research before architecture
Research in order: existing repository patterns; official framework docs; official vendor SDKs; mature open-source libraries; established architectural patterns; managed services; custom code last. Compare fit, maintenance, security, license, complexity, lock-in, cost, support and replacement difficulty. Deliver `REUSE_RESEARCH.md`.

## Phase 3 — Architecture
Propose the simplest architecture satisfying current requirements and reasonable near-term growth. Prefer simple over clever, modular monolith over microservices unless justified, framework capability over custom infrastructure, and managed services where appropriate. Cover only relevant frontend, backend, database, auth, storage, APIs, jobs, notifications, search, caching, deployment, monitoring, backup and security boundaries. Record important decisions as ADRs.

## Phase 4 — Specification
No medium or large feature should go directly from idea to code. Create a short spec covering problem, goal, non-goals, users, flow, functional requirements, business rules, reuse decision, data/API/permission impact, states/errors, edge cases, acceptance criteria, tests, risks and rollout/migration/rollback.

## Phase 5 — Implementation plan
Identify affected files/modules, new components, existing code to reuse, dependencies, schema/API changes, tests, migration/rollout work and risks. Tasks should have one clear responsibility.

## Phase 6 — Implementation
Read relevant code first, reuse existing patterns, make the smallest coherent change, add/update tests and validate each step. Parallel work requires settled interfaces and isolated branches/worktrees.

## Phase 7 — Validation
Run relevant unit, integration and end-to-end tests plus type checks, lint, build and security/dependency scans where available. Validate written acceptance criteria.

## Phase 8 — Independent review
Use fresh context or a different model for meaningful changes. Review correctness, regressions, security, data integrity, API/schema compatibility, complexity, duplication, error handling, tests and architecture/spec compliance. Fix material findings and rerun validation.

## Phase 9 — Finish and document
Update documentation where behavior or important technical decisions changed. Summarize implemented work, reused solutions, dependency changes, tests, known limitations and follow-ups, then commit/merge.

## Workflow by task size

- Tiny: `Inspect -> Change -> Validate`
- Bug: `Investigate -> Root cause -> Fix plan -> Implement -> Regression test -> Validate`
- Medium: `Investigate -> Spec -> Reuse research -> Plan -> Implement -> Test -> Review`
- Large: `Product decision -> Research -> Spec -> Architecture -> ADR -> Task breakdown -> Worktrees/agents -> Integration -> Full test -> Review`
- New project: `Problem -> Product charter -> Research -> Architecture -> Initial specs -> Implementation roadmap -> Staged development`
