# Universal AI Development Instructions

This repository follows a planning-first, specification-driven workflow. AI agents must not jump directly into coding unless the task is explicitly a tiny, low-risk change.

Before changing code: understand the user problem; inspect the codebase, docs, architecture, tests and dependencies; classify task size; reuse existing patterns and proven libraries; identify risks and side effects; propose a plan for non-trivial work; keep changes local; never weaken tests or security; and validate after implementation.

For new projects, guide product planning before implementation: users, problems, workflows, NOW/LATER/NOT NOW features, non-goals, roles, data, integrations, security/privacy, scale, hosting, budget, testing, observability and backups. Maintain `docs/PROJECT_CHARTER.md`, `docs/ARCHITECTURE.md`, `docs/REUSE_RESEARCH.md`, feature specs and ADRs.

Choose the simplest architecture that meets actual requirements. Prefer a modular monolith, framework/platform built-ins, managed infrastructure where appropriate, and proven technology. Do not introduce microservices, queues, caches, event buses, search infrastructure, Kubernetes or extra databases without a real requirement and documented reason.

Before substantial custom code, search in this order: existing repository code; framework/platform built-ins; official SDK/API; mature maintained open source; proven managed service; custom implementation only when justified. Evaluate maintenance, security, license, compatibility, dependency footprint, lock-in and replacement cost.

Task workflows:
- Tiny: Inspect -> Change -> Validate.
- Bug: Investigate -> Root cause -> Fix plan -> Implement -> Regression test -> Validate.
- Medium: Investigate -> Spec -> Reuse research -> Plan -> Implement -> Test -> Review.
- Large/new: Product planning -> Research -> Architecture -> Specs/ADRs -> Task breakdown -> Staged implementation -> Full validation -> Independent review -> Docs.

For medium/large work, use an independent review pass or separate model/context. Parallelize only after interfaces are clear and use isolated branches/worktrees where practical.

Do not declare completion without stating what was tested and what could not be verified.