# Universal AI Development Instructions

This repository follows a planning-first, specification-driven workflow. AI agents must not jump directly into coding unless the task is explicitly a tiny, low-risk change.

## 1. Core operating rules

Before changing code, the agent must:

1. Understand the user problem and desired outcome.
2. Inspect the existing codebase, documentation, architecture, tests, and dependencies.
3. Decide whether the request is a bug, small change, medium feature, large feature, refactor, migration, or new project.
4. Reuse existing project patterns and proven libraries before creating new abstractions.
5. Identify risks, side effects, security impact, data impact, and backward-compatibility concerns.
6. Propose a plan before implementation for any non-trivial task.
7. Keep changes as small and local as reasonably possible.
8. Never modify unrelated code just to make the implementation easier.
9. Never hide errors or weaken tests to make a change pass.
10. Run relevant validation after implementation.

## 2. Planning gate for new projects

For a new project, do not start implementation until the planning gate is complete.

The AI must guide the user through:

- Product goal and target users
- Core user problems
- Must-have features
- Nice-to-have features
- Features that should NOT be built now
- User roles and permissions
- Main workflows
- Data model and data ownership
- External integrations
- Authentication and security needs
- Performance and scale assumptions
- Hosting/deployment constraints
- Budget and maintenance expectations
- Legal/privacy/compliance considerations where relevant
- Testing strategy
- Observability and backup needs

Then produce:

- `docs/PROJECT_CHARTER.md`
- `docs/ARCHITECTURE.md`
- `docs/REUSE_RESEARCH.md`
- initial feature specifications under `docs/specs/`
- ADRs under `docs/decisions/` for important architecture choices

The user must approve the direction before major implementation begins.

## 3. Architecture policy

Choose the simplest architecture that satisfies the actual requirements.

Default preferences:

- Prefer a modular monolith over microservices unless there is a clear reason not to.
- Prefer managed infrastructure over self-hosting when cost, privacy, or control do not require otherwise.
- Prefer the framework's built-in features over custom infrastructure.
- Prefer boring, proven technology over novel technology unless the new technology provides a clear measurable benefit.
- Avoid introducing queues, event buses, caches, background workers, search engines, or distributed systems until a real requirement justifies them.
- Avoid premature optimization.
- Avoid speculative abstractions for features that do not exist yet.
- Separate concerns, but do not create layers that only add ceremony.

For each major architecture decision, document context, options considered, decision, why it was selected, tradeoffs, and reversal cost.

## 4. Feature policy

Every feature should answer:

- What user problem does this solve?
- Who needs it?
- What happens if we do not build it?
- Is there an existing feature, library, platform capability, or service that already solves it?
- What is the smallest version that provides useful value?
- What are the acceptance criteria?

Do not add a feature because it is technically interesting.

Use three buckets:

- **Now:** necessary for the product to work or deliver its current goal.
- **Later:** useful, but not required for the current release.
- **Not now:** adds complexity without enough current value.

## 5. Reuse-before-build policy

Before writing a substantial new implementation, search for an existing solution in this order:

1. Existing code already in this repository.
2. Built-in capability of the current language/framework/platform.
3. Official SDK or library from the service/vendor involved.
4. Mature, actively maintained open-source package.
5. Well-supported external service if it removes significant complexity.
6. Custom implementation only when the options above are unsuitable.

The AI must not copy random code from blogs, snippets, Stack Overflow, social media, or unknown repositories directly into production code.

For each meaningful third-party dependency, evaluate exact fit, maintenance, compatibility, documentation, license, security, size, transitive dependencies, replacement difficulty, and whether the framework already provides the capability.

Record important decisions in `docs/REUSE_RESEARCH.md`.

## 6. Task classification

### Tiny / low-risk change
`Inspect -> Change -> Validate -> Summarize`

### Bug
`Reproduce/Understand -> Root cause -> Proposed fix -> Implement -> Regression test -> Validate`

Do not patch symptoms when the root cause can reasonably be fixed.

### Medium feature
`Investigate -> Short spec -> Plan -> Implement -> Tests -> Review -> Update docs`

### Large feature / architectural change
`Research -> Spec -> Architecture decision -> Break into tasks -> Implement in isolated branches/worktrees -> Integrate -> Full validation -> Independent review -> Update docs`

## 7. Specification requirements

A specification must contain problem, goal, non-goals, user flow, functional requirements, business rules, data changes, API/interface changes, permissions/security, error/empty/loading states, edge cases, acceptance criteria, testing requirements, and rollout/migration considerations.

Use `docs/SPEC_TEMPLATE.md`.

## 8. Implementation rules

While coding:

- Follow existing project conventions.
- Prefer small, understandable functions and modules.
- Avoid duplicating logic.
- Reuse existing components and utilities.
- Do not add dependencies without documenting why.
- Do not change public APIs, database schemas, auth behavior, or data contracts without explicitly calling it out.
- Preserve backward compatibility unless the approved plan says otherwise.
- Keep secrets out of source code.
- Validate inputs at trust boundaries.
- Handle expected failure states explicitly.
- Add or update tests for changed behavior.

## 9. Testing and validation

Before declaring a task complete:

- Run the smallest relevant test set first.
- Run broader tests when the change can affect other areas.
- Run lint/type checks/build checks if the project uses them.
- Confirm acceptance criteria one by one.
- Test negative/error cases where relevant.
- Check that unrelated behavior was not changed.
- For UI work, verify loading, empty, error, mobile/responsive, and accessibility behavior where applicable.
- For data changes, verify migration and rollback/recovery considerations.

Never delete, disable, or weaken a valid test simply because the new implementation fails it.

## 10. Review policy

For medium or large work, perform an independent review after implementation.

The reviewer should check correctness, security, regression risk, data integrity, API compatibility, concurrency where relevant, error handling, unnecessary complexity, duplicate logic, performance, missing tests, and deviation from the approved spec.

Where practical, use a different AI model or a fresh context for review.

## 11. Parallel-agent policy

Parallel agents are useful only when tasks are genuinely independent. Use isolated branches or Git worktrees for parallel tasks. Avoid parallel implementation when agents are likely to edit the same files or when the architecture/interface is not settled.

## 12. Documentation maintenance

Documentation is the project's long-term memory for both humans and AI. Keep it concise and current. Update relevant docs when a change affects architecture, public behavior, data model, APIs, setup/deployment, important dependencies, security assumptions, or major product decisions. Do not create documentation for trivial implementation details that are obvious from the code.

## 13. Completion report

After implementation, report what changed, why it changed, files/areas affected, tests/validation performed, remaining risks or follow-up work, and whether documentation was updated. Do not claim completion if required tests could not be run. State what could not be verified.
