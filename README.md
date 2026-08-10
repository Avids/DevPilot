# DevPilot

> **A gold-standard workflow for disciplined vibe coding.**
>
> Plan first. Research what already works. Specify the outcome. Let AI build. Test everything. Review independently. Keep the knowledge in the repository.

DevPilot is a portable, agent-friendly software development system for people who build software with AI coding agents. It turns ad-hoc "prompt → code → fix → prompt again" development into a repeatable engineering workflow without taking away the speed and creativity that make vibe coding useful.

DevPilot is not another coding agent, framework, or programming language. It is the **development operating system around your AI agents**: a shared set of rules, specifications, architecture records, research practices, prompts, and quality gates that helps different agents work on the same project without repeatedly starting from zero.

It is designed to remain portable across tools such as **Antigravity, OpenCode, Hermes, Codex, Claude Code, GitHub Copilot, and other agentic coding environments**. Tool-specific adapters can change; the project's knowledge stays in the repository.

## Why DevPilot?

Vibe coding is fast, but speed creates new problems: agents code before understanding the problem, scope expands, architecture emerges accidentally, solved infrastructure gets rebuilt, sessions make conflicting decisions, quick fixes create regressions, and important decisions disappear inside chat history.

DevPilot keeps the speed while adding engineering discipline.

```text
IDEA → DISCOVER → RESEARCH → SCOPE → ARCHITECT → SPECIFY → PLAN → BUILD → TEST → REVIEW → DOCUMENT → SHIP
```

The goal is not more paperwork. The goal is **less rework**.

## Core philosophy

1. **AI starts as an adviser, not a programmer.** Understand the problem, users, constraints and desired outcome before meaningful implementation.
2. **Reuse before build.** Check existing project code, framework/platform capabilities, official SDKs, mature libraries and proven services before custom implementation.
3. **Keep architecture simple.** Complexity must earn its place. Prefer the simplest architecture that satisfies real requirements.
4. **Specifications are the contract with AI.** Define behavior, scope, non-goals, rules, edge cases and acceptance criteria before significant implementation.
5. **Decisions belong in the repository.** Preserve architecture decisions, research and specifications instead of leaving them only in chat history.
6. **Test behavior, not AI confidence.** Generated code is not evidence that a feature works.
7. **Separate creation from review.** For meaningful work, use a fresh review pass and, when practical, a different agent/model.
8. **Keep the process proportional.** Small changes stay small; large changes receive more planning and verification.

## Adaptive workflow

**Small:** `Inspect → Root Cause → Smallest Safe Change → Test → Review`

**Medium:** `Inspect → Short Spec → Reuse Research → Plan → Build → Test → Review → Update Docs`

**Large:** `Discovery → Scope → Research → Architecture → ADRs → Specs → Plan → Task Decomposition → Build → Integration → Tests → Independent Review → Documentation`

**Never parallelize ambiguity.** Define architecture, interfaces and ownership boundaries before sending multiple agents to implement work in parallel.

## Feature discipline: NOW / LATER / NOT NOW

| Bucket | Meaning |
|---|---|
| **NOW** | Required for the product to deliver its current core value |
| **LATER** | Valuable, but unnecessary for the current release |
| **NOT NOW** | Complexity, cost, risk or distraction exceeds current value |

AI should help remove unnecessary features, not only suggest more of them.

## Reuse before build

Before building a meaningful subsystem, investigate in this order:

```text
Existing project code/pattern
        ↓
Framework/platform capability
        ↓
Official SDK/API
        ↓
Mature maintained library
        ↓
Proven managed service
        ↓
Custom implementation
```

Do not reinvent mature infrastructure without a reason. But do not install a dependency for every trivial helper either. Dependencies should earn their place through real value, maintenance quality, security, compatibility, licensing and reasonable replacement cost.

## Project knowledge structure

```text
project/
├── AGENTS.md
├── CLAUDE.md                 # optional tool adapter
├── docs/
│   ├── PROJECT_CHARTER.md
│   ├── ARCHITECTURE.md
│   ├── REUSE_RESEARCH.md
│   ├── specs/
│   └── decisions/
├── src/
└── tests/
```

Think of it as:

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

## New project prompt

```text
I want to build:

[describe the idea]

Use the DevPilot workflow.
Act as my product adviser and software architect before acting as a programmer.

First determine:
- the problem and target users;
- key user workflows;
- what the product should and should not do;
- NOW / LATER / NOT NOW features;
- proven products, patterns, platform features, libraries or services we can reuse;
- the simplest suitable architecture;
- data, security, privacy, integration, deployment and operational requirements;
- major risks and unknowns.

Challenge unnecessary complexity and weak assumptions.
Do not begin implementation until the project direction, architecture and first specifications are clear.
```

## New feature prompt

```text
I want to add [feature]. Follow DevPilot. Do not code immediately.

1. Inspect the existing implementation and project docs.
2. Decide whether the feature belongs in the product now.
3. Define scope and non-scope.
4. Research existing project patterns and proven external solutions.
5. Identify architecture, data, API, permission, security and UX implications.
6. Create/update the specification and acceptance criteria.
7. Propose the smallest sensible implementation plan.
8. Implement after the plan is clear.
9. Run relevant tests.
10. Perform an independent review pass.
11. Update affected documentation.
```

## Bug-fix prompt

```text
Investigate this bug using DevPilot. Do not immediately modify code.

First reproduce or understand the failure, identify the root cause, inspect related code and existing patterns, assess regression risk, determine the smallest safe fix, and define how it will be verified.

Then implement, test, review for regressions, and update documentation/specs only when behavior or an important assumption changed.
```

## Code review standard

Review meaningful implementations independently against the specification and architecture. Check functional correctness, missed acceptance criteria, regressions, security/privacy, authorization, validation, failure handling, data/API compatibility, duplication, dependencies, unnecessary complexity, architecture violations, missing tests and maintainability. Report findings by severity and do not invent issues merely to make the review longer.

## Multi-agent development

Parallel agents are useful after work becomes decomposable. Establish approved architecture/specs and stable interfaces first, then split independent tasks across isolated branches/worktrees. Integrate, run the full relevant verification, and perform an independent review. For small tasks, one capable agent is usually better than an agent swarm.

## Agent portability

DevPilot keeps core project knowledge in plain Markdown so it can move between AI development tools. Target environments include Antigravity, OpenCode, Hermes, Codex, Claude Code, GitHub Copilot and other agents capable of reading repository instructions.

`AGENTS.md` should be the portable source of core repository instructions where supported. Tool-specific files should adapt to it rather than create conflicting development methodologies.

## Installation

```bash
git clone https://github.com/Avids/DevPilot.git
cd DevPilot
chmod +x scripts/install.sh
./scripts/install.sh
```

Review installation scripts before running them. For a new project, copy/adapt `project-template/` into the repository. For an existing project, merge deliberately rather than overwriting existing agent instructions or documentation.

## Quality gates

Before calling meaningful work complete, confirm that acceptance criteria are satisfied; relevant tests were actually run; likely regressions were considered; security, permissions, validation and failure paths were checked where relevant; proven functionality was reused appropriately; unnecessary dependencies and architecture were avoided; unrelated code was not changed; documentation remains accurate; and anything that could not be verified is clearly reported.

## The gold-standard vibe coding loop

Pure vibe coding often becomes:

```text
Prompt → Generate → Try → Find Problems → Prompt Again → Repeat
```

DevPilot upgrades it to:

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

## License & attribution

DevPilot is intended to be licensed under the **Apache License 2.0**, a permissive open-source license that allows use, modification, distribution and commercial use while preserving required license and attribution notices.

When distributing modified versions, comply with the Apache License 2.0 requirements, including providing prominent notice of modified files where required and preserving applicable copyright, attribution and `NOTICE` information.

**DevPilot attribution:**

```text
DevPilot
Copyright 2026 Sina
Original project: https://github.com/Avids/DevPilot
```

If you build on DevPilot, attribution to the original DevPilot project is appreciated and should be preserved wherever required by the license and accompanying notices.

> **Important:** This README describes the intended license, but the repository should also contain the full `LICENSE` file and, where used, a `NOTICE` file. Those files control the actual licensing terms; this README is not a substitute for them.

## Core principles

1. Understand before coding.
2. Build the right thing before building more things.
3. Reuse proven solutions before custom infrastructure.
4. Prefer simple architecture.
5. Write specifications for behavior, not bureaucracy.
6. Keep important decisions in the repository.
7. Make the smallest safe change.
8. Test what changed and what it could break.
9. Use independent review for meaningful work.
10. Parallelize implementation, not uncertainty.
11. Never claim verification that was not performed.
12. Keep the workflow proportional to the task.

---

> **DevPilot: Make AI-assisted software development faster without making the resulting software careless.**
