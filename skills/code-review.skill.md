---
name: Code Review
trigger: code review, review this code, what's wrong with this code, check my code, is this secure, debug this, find the bug
description: Reviews code for bugs, security issues, performance problems, and style. Use when user shares code and asks for "code review", "review this", "what's wrong with this code", "check my code", or "is this secure".
agent: carla
pack: editorial
steps:
  - Read the code, understand what it's supposed to do, and identify edge cases that matter
  - Walk the review checklist — correctness, security, performance, readability, error handling, testability, dependencies
  - For each issue found, classify severity (Critical/High/Medium/Low) and locate it precisely
  - Write each finding with a concrete fix, not just a description of what's wrong
  - Close with a summary of critical issues and an overall ship/no-ship assessment
chaining: false
---

# Code Review

## Review checklist
1. **Correctness** — Does it do what it's supposed to do? Edge cases handled?
2. **Security** — Injection risks, authentication issues, exposed secrets, input validation
3. **Performance** — Unnecessary loops, N+1 queries, memory issues, blocking calls
4. **Readability** — Naming, comments, function length, cognitive complexity
5. **Error handling** — What happens when things fail? Are errors caught and logged?
6. **Testing** — Is this testable? Are there obvious test cases missing?
7. **Dependencies** — Are imported libraries necessary, up to date, trustworthy?

## Output format
For each issue found:
- **Severity**: [Critical / High / Medium / Low]
- **Location**: [Line number or function name]
- **Issue**: What's wrong
- **Fix**: Specific suggestion or corrected code snippet

End with:
- Summary of critical issues (if any)
- Overall assessment: Ready to ship / Needs work / Significant problems

## Guidelines
- Be specific — vague feedback like "this could be cleaner" is not useful
- Show the fix, don't just describe it
- Flag security issues as Critical regardless of other context
