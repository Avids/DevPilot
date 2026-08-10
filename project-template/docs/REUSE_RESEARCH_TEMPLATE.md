# Reuse Research

The goal is to avoid rebuilding mature solutions while avoiding unnecessary or risky dependencies.

## Decision rule

Evaluate solutions in this order:

1. Existing project code
2. Built-in language/framework/platform capability
3. Official vendor SDK/library
4. Mature open-source library
5. Managed external service
6. Custom code

## Candidate evaluation

### Problem

What capability do we need?

### Candidate 1 — [name]

**Type:** Built-in / Official SDK / OSS / Service

**Official source:**

**What it solves:**

**Compatibility:**

**Maintenance status:**

**Security considerations:**

**License:**

**Dependency footprint:**

**Pros:**

- 

**Cons:**

- 

### Candidate 2 — [name]

...

## Decision

**Selected approach:**

**Reason:**

**Why we are not building this ourselves:**

or

**Why custom code is justified:**

## Review trigger

Re-evaluate this decision if:

- The dependency becomes unmaintained.
- A major security issue appears.
- The framework adds an equivalent built-in feature.
- The dependency becomes a major performance or maintenance burden.
