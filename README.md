# DevPilot

> **A gold-standard workflow for disciplined vibe coding.**
>
> Plan first. Research what already works. Specify the outcome. Let AI build. Test everything. Review independently. Keep the knowledge in the repository.

DevPilot is a portable, agent-friendly software development system for people who build software with AI coding agents. It turns ad-hoc "prompt → code → fix → prompt again" development into a repeatable engineering workflow without taking away the speed and creativity that make vibe coding useful.

DevPilot is not another coding agent, framework, or programming language. It is the **development operating system around your AI agents**: a shared set of rules, specifications, architecture records, research practices, prompts, and quality gates that helps different agents work on the same project without repeatedly starting from zero.

It is designed to remain portable across tools such as **Antigravity, OpenCode, Hermes, Codex, Claude Code, GitHub Copilot, and other agentic coding environments**. Tool-specific adapters can change; the project's knowledge stays in the repository.

---

## Why DevPilot?

Vibe coding makes software development dramatically faster, but speed creates a new class of problems:

- agents start coding before the problem is understood;
- attractive but unnecessary features expand the scope;
- architecture emerges accidentally from individual prompts;
- AI rebuilds solved infrastructure instead of using proven solutions;
- different sessions make contradictory technical decisions;
- a quick fix creates regressions somewhere else;
- the agent that wrote the code reviews its own assumptions;
- important decisions disappear inside chat history;
- a project becomes harder for both the human and the next AI agent to understand.

DevPilot keeps the speed while adding engineering discipline.

The core loop is:

```text
IDEA
  ↓
DISCOVER
  ↓
RESEARCH
  ↓
SCOPE
  ↓
ARCHITECT
  ↓
SPECIFY
  ↓
PLAN
  ↓
BUILD
  ↓
TEST
  ↓
REVIEW
  ↓
DOCUMENT
  ↓
SHIP
```

The goal is not more paperwork. The goal is **less rework**.

---

## The DevPilot philosophy

### 1. AI starts as an adviser, not a programmer

For a new product or major feature, the first job of the agent is to understand the problem, challenge assumptions, identify the user and workflow, and decide what should and should not be built.

Coding begins only when the direction is sufficiently clear.

### 2. Reuse before build

Before creating a meaningful subsystem, investigate solutions in this order:

```text
Existing project code/pattern
        ↓
Framework/platform capability
        ↓
Official SDK/API
        ↓
Mature maintained library
        ↓
Managed service
        ↓
Custom implementation
```

Do not reinvent authentication, cryptography, file parsers, payment infrastructure, queues, validation engines, or other mature infrastructure without a good reason.

At the same time, do not install a dependency for every ten-line helper. Reuse should reduce risk and maintenance, not create dependency bloat.

### 3. The simplest architecture that works wins

Complexity must earn its place.

Start with the simplest architecture that satisfies the real requirements. Prefer a well-structured modular application over premature microservices. Add caches, queues, event buses, distributed services, search infrastructure, or orchestration only when a real requirement justifies them.

### 4. Specifications are the contract with AI

Humans should not need to supervise every generated line of code. They should be able to supervise **intent and behavior**.

A useful feature specification captures:

- problem and goal;
- non-goals;
- users and user flow;
- functional requirements;
- business rules;
- permissions;
- data/API implications;
- existing functionality to reuse;
- edge, empty, loading, and failure states;
- acceptance criteria;
- testing expectations;
- risks and migration concerns.

The agent implements against that contract.

### 5. Decisions belong in the repository, not only in chat

Architecture choices, feature requirements, rejected alternatives, and reuse research should survive the AI session that created them.

DevPilot uses lightweight project documents and Architecture Decision Records (ADRs) so a future agent can understand **why** the system looks the way it does.

### 6. Test behavior, not confidence

"It should work" is not verification.

The agent should run the relevant automated checks, test the acceptance criteria, inspect likely regression areas, and clearly report anything it could not verify.

### 7. Separate creation from review

For meaningful changes, use a fresh review pass—and, where practical, a different agent/model—to challenge the implementation.

Review for correctness, regressions, security, unnecessary complexity, duplication, maintainability, architecture compliance, and specification compliance.

### 8. Small changes stay small

DevPilot is deliberately adaptive. A button-label change should not require a product charter and architecture review.

The process expands with risk and complexity.

---

## Adaptive workflow: Small / Medium / Large

### Small

Examples: isolated bug, copy change, small styling correction, narrow refactor.

```text
Inspect → understand root cause → smallest safe change → test → review
```

Avoid unnecessary documents. Update an existing spec only if behavior materially changes.

### Medium

Examples: meaningful feature, integration, new workflow, schema/API change with contained impact.

```text
Inspect
  ↓
Short specification
  ↓
Reuse research when relevant
  ↓
Implementation plan
  ↓
Build
  ↓
Tests
  ↓
Review
  ↓
Update docs
```

### Large

Examples: new application, major subsystem, major architectural change, cross-cutting feature.

```text
Product discovery
  ↓
NOW / LATER / NOT NOW scope
  ↓
Existing-solution research
  ↓
Architecture
  ↓
ADRs
  ↓
Feature specifications
  ↓
Implementation plan
  ↓
Task decomposition
  ↓
Isolated/parallel implementation where useful
  ↓
Integration
  ↓
Tests
  ↓
Independent review
  ↓
Documentation
```

**Never parallelize ambiguity.** Establish architecture, interfaces, data contracts, and ownership boundaries before sending multiple agents to implement work in parallel.

---

## Feature discipline: NOW / LATER / NOT NOW

AI is very good at suggesting features. Good product development also requires removing them.

Every significant feature idea should be challenged and placed into one of three buckets:

| Bucket | Meaning |
|---|---|
| **NOW** | Required for the product to deliver its current core value |
| **LATER** | Valuable, but not necessary for the current release |
| **NOT NOW** | Complexity, cost, risk, or distraction exceeds current value |

This prevents an MVP from quietly becoming a CRM + ERP + chat platform + analytics suite + AI assistant before the core workflow works well.

---

## Research before implementation

For non-trivial technical decisions, the agent should not rely only on model memory.

Research current, proven approaches. Prefer sources in roughly this order:

1. official framework/platform documentation;
2. official SDK/API documentation;
3. standards and primary technical sources;
4. mature, actively maintained projects;
5. reputable engineering references;
6. community discussions for practical experience—not as the sole authority.

For candidate dependencies, consider:

- maintenance activity and project health;
- security history;
- license;
- compatibility;
- ecosystem adoption;
- dependency footprint;
- API stability;
- replacement cost;
- whether the capability already exists in the stack.

Record important conclusions in `REUSE_RESEARCH.md` or the relevant specification/ADR so the same question does not need to be rediscovered every session.

---

## Recommended project knowledge structure

A DevPilot-enabled repository can use this structure:

```text
project/
├── AGENTS.md
├── CLAUDE.md                    # optional tool adapter
├── docs/
│   ├── PROJECT_CHARTER.md
│   ├── ARCHITECTURE.md
│   ├── REUSE_RESEARCH.md
│   ├── specs/
│   │   ├── feature-name.md
│   │   └── ...
│   └── decisions/
│       ├── ADR-001-example.md
│       └── ...
├── src/
└── tests/
```

Think of the layers this way:

```text
AGENTS.md        = constitution
SKILL.md         = operating procedure
PROJECT_CHARTER  = product direction
ARCHITECTURE     = system map
SPEC             = behavioral contract
ADR              = decision history
REUSE_RESEARCH   = why we reused/built something
TESTS            = executable evidence
CODE             = implementation
```

---

## New project workflow

When starting from an idea, do **not** ask the agent to immediately scaffold the app.

Start with something like:

```text
I want to build:

[describe the idea]

Use the DevPilot workflow.

Act as my product adviser and software architect before acting as a programmer.

First help determine:
- the problem and target users;
- the key user workflows;
- what the product should and should not do;
- NOW / LATER / NOT NOW features;
- existing proven products, patterns, platform features, libraries, or services we can reuse;
- the simplest suitable architecture;
- data, security, privacy, integration, deployment, and operational requirements;
- major risks and unknowns.

Challenge unnecessary complexity and weak assumptions.
Do not begin implementation until the project direction, architecture, and first specifications are clear.
```

Expected outputs include a project charter, initial feature scope, architecture, important ADRs, reuse research, and specifications for the first implementation slice.

---

## New feature workflow

```text
I want to add:

[feature]

Follow DevPilot. Do not code immediately.

1. Inspect the existing implementation and relevant project docs.
2. Determine whether this feature belongs in the product now.
3. Define scope and non-scope.
4. Look for existing project patterns and proven external solutions.
5. Identify architecture, data, API, permission, security, and UX implications.
6. Create or update the feature specification and acceptance criteria.
7. Propose the smallest sensible implementation plan.
8. Implement after the plan is clear.
9. Run relevant tests.
10. Perform an independent review pass.
11. Update affected documentation.
```

---

## Bug-fix workflow

A bug report should not trigger random edits.

```text
Investigate this bug using DevPilot.

Do not immediately modify code.

First:
- reproduce or clearly understand the failure;
- identify the root cause;
- inspect related code and existing project patterns;
- identify affected areas and regression risk;
- determine the smallest safe fix;
- define how the fix will be verified.

Then implement the fix, run the relevant tests, review for regressions, and update documentation/specs only if behavior or an important assumption changed.
```

Fix root causes rather than hiding symptoms.

---

## Refactoring workflow

Refactoring should preserve behavior unless a behavior change is explicitly specified.

Before refactoring:

- identify the concrete problem;
- explain why refactoring is worth the risk;
- establish tests or behavioral checks;
- define the intended boundary of the refactor;
- avoid unrelated cleanup;
- prefer incremental, reversible changes.

Aesthetic preference alone is not enough reason for a large rewrite.

---

## Code review standard

A strong review prompt:

```text
Review this implementation independently against the specification and architecture.

Do not modify code yet.

Check for:
- functional bugs;
- missed acceptance criteria;
- regressions;
- security/privacy issues;
- incorrect authorization or validation;
- race conditions and failure handling;
- data/API compatibility;
- duplicated functionality;
- unnecessary dependencies;
- unnecessary complexity;
- architecture violations;
- missing tests;
- maintainability problems.

Report findings by severity and include the evidence/reasoning for each finding.
Do not invent issues merely to produce a longer review.
```

After review findings are accepted, fix them and rerun the affected checks.

---

## Multi-agent development

Multiple agents can dramatically speed up implementation—but only after the work is decomposable.

Good parallelization:

```text
Approved architecture/spec
          ↓
Stable interfaces/contracts
          ↓
Task decomposition
          ↓
┌────────────┬────────────┬────────────┐
│ Frontend   │ Backend    │ Tests/docs │
│ Agent      │ Agent      │ Agent      │
└────────────┴────────────┴────────────┘
          ↓
Integration
          ↓
Full verification
          ↓
Independent review
```

Use separate branches/worktrees when agents modify code in parallel. Keep tasks independent enough that agents are not constantly editing the same files or redefining each other's contracts.

For small tasks, one agent is usually better than an agent swarm.

---

## Agent portability

DevPilot's core project knowledge is intentionally plain Markdown so it does not depend on one vendor.

The same repository can be opened by different AI development tools. Each tool may use a thin adapter or global configuration, but it should ultimately follow the same project truth.

Target environments include:

- Antigravity
- OpenCode
- Hermes
- Codex
- Claude Code
- GitHub Copilot
- other agents that can read repository instructions and Markdown

`AGENTS.md` should be treated as the portable source of core repository instructions where supported. Tool-specific instruction files should reference or remain consistent with the same rules rather than creating a second, conflicting methodology.

---

## Installation

Clone DevPilot:

```bash
git clone https://github.com/Avids/DevPilot.git
cd DevPilot
```

Review the installer before running it, then use the included installation script where appropriate:

```bash
chmod +x scripts/install.sh
./scripts/install.sh
```

For a new project, copy/adapt the contents of `project-template/` into the project repository and complete the project-specific documents as development begins.

Do not blindly overwrite existing `AGENTS.md`, `CLAUDE.md`, rules, skills, or project documentation. Merge DevPilot into established repositories deliberately.

---

## Repository contents

DevPilot is organized around a few reusable building blocks:

```text
DevPilot/
├── global/             # universal development principles
├── skills/             # reusable software-development procedure
├── project-template/   # files to seed a DevPilot-enabled project
├── prompts/            # reusable entry points for common tasks
├── docs/               # workflow guidance/templates
└── scripts/            # installation/setup helpers
```

The exact adapters can evolve as AI coding tools evolve. The methodology should remain stable.

---

## Quality gates

Before calling meaningful work complete, the agent should be able to answer:

- Does the implementation satisfy the acceptance criteria?
- Were relevant tests actually run?
- Did existing tests remain green?
- Were likely regression areas checked?
- Were authorization, validation, security, and failure paths considered where relevant?
- Did we reuse existing/proven functionality where appropriate?
- Did we avoid unnecessary dependencies and architecture?
- Did we change unrelated code?
- Does the implementation still match the documented architecture?
- Were important decisions/specifications updated?
- What could not be verified?

If the answer to an important question is unknown, report it as unknown rather than silently assuming success.

---

## What DevPilot is *not*

DevPilot is not:

- a demand for large design documents before every edit;
- waterfall development renamed for AI;
- a replacement for automated tests;
- a replacement for human product judgment;
- permission for agents to install every popular library they find;
- an excuse for premature enterprise architecture;
- tied to one model or coding product;
- a guarantee that AI-generated code is correct.

It is a lightweight control system for getting the benefits of AI coding without surrendering engineering judgment.

---

## The gold-standard vibe coding loop

Traditional vibe coding often looks like:

```text
Prompt → generate lots of code → try it → find problems → prompt again → repeat
```

DevPilot upgrades that loop to:

```text
UNDERSTAND
   ↓
DECIDE WHAT IS WORTH BUILDING
   ↓
RESEARCH WHAT ALREADY WORKS
   ↓
SPECIFY THE DESIRED BEHAVIOR
   ↓
CHOOSE THE SIMPLEST SOUND DESIGN
   ↓
LET AI IMPLEMENT
   ↓
VERIFY WITH TESTS
   ↓
CHALLENGE WITH INDEPENDENT REVIEW
   ↓
PRESERVE THE KNOWLEDGE
   ↓
SHIP
```

That is **disciplined vibe coding**: AI provides speed and implementation leverage; specifications provide direction; proven solutions reduce unnecessary invention; tests provide evidence; review provides challenge; repository knowledge provides continuity.

---

## Core principles

1. **Understand before coding.**
2. **Build the right thing before building more things.**
3. **Reuse proven solutions before writing custom infrastructure.**
4. **Prefer simple architecture.**
5. **Write specifications for behavior, not bureaucracy.**
6. **Keep important decisions in the repository.**
7. **Make the smallest safe change.**
8. **Test what changed and what it could break.**
9. **Use independent review for meaningful work.**
10. **Parallelize implementation, not uncertainty.**
11. **Never claim verification that was not performed.**
12. **Keep the workflow proportional to the task.**

---

## Status

DevPilot is an evolving development methodology. AI coding tools change quickly, so tool-specific adapters and installation paths may evolve. The core workflow is intentionally vendor-neutral.

Contributions, experiments, and improvements should preserve the main objective:

> **Make AI-assisted software development faster without making the resulting software careless.**

---

## License

No license has been declared in this README. Add a `LICENSE` file before treating the repository as generally reusable open-source software.
