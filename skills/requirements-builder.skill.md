---
name: Requirements Builder
trigger: gather requirements, what do we need, requirements for, help me spec this out, business requirements, technical requirements
description: Captures, structures, and formalizes business or technical requirements from conversations, interviews, or briefs. Use when user says "gather requirements", "what do we need", "requirements for", or "help me spec this out".
agent: coach
pack: requirements
steps:
  - Identify which requirement categories apply — functional, non-functional, business, user, integration
  - Capture each requirement as a clear, testable statement with acceptance criteria where possible
  - Assign ID, category, priority (Must / Should / Nice), and source per requirement
  - Flag conflicting requirements explicitly; ask clarifying questions before formalizing vague inputs
  - Chain to write-prd to wrap requirements in a full PRD, or Frasier for architectural assessment
chaining: true
---

# Requirements Builder

## Requirements categories
- **Functional** — what the system/product/process must do
- **Non-functional** — how it must perform (speed, scale, security)
- **Business** — the business rules and constraints it must follow
- **User** — what the end user needs to accomplish
- **Integration** — what it must connect to or work with

## Output format
Each requirement:
- **ID**: REQ-001
- **Category**: [Functional/Non-functional/Business/User/Integration]
- **Requirement**: [Clear, testable statement]
- **Priority**: [Must have / Should have / Nice to have]
- **Source**: [Who or what drove this requirement]

## Guidelines
- Every requirement must be testable — include acceptance criteria where possible
- Ask clarifying questions before formalizing if inputs are vague
- Flag conflicting requirements explicitly
- Chain to Coach's PRD writer to wrap requirements in a full document
- Chain to Frasier if architectural implications need to be assessed
