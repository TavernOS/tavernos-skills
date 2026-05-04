---
name: System Design
trigger: design the system, architecture for, how should this be built, system design, technical architecture, infrastructure, how do we structure this
description: Designs system architectures, technical structures, and complex system diagrams. Use when user says "design the system", "architecture for", "how should this be built", "system design", or asks about technical infrastructure.
agent: frasier
pack: strategy
steps:
  - Capture requirements — what the system must do and the constraints it must respect
  - Sketch the high-level architecture (components, connections, data flow) using boxes-and-arrows in text if no diagram tool is available
  - Specify each component's responsibility and recommend a stack with explicit rationale
  - Surface tradeoffs, scaling considerations, and the highest-risk architectural decisions
  - Apply the design principles — separation of concerns, loose coupling, single source of truth, graceful failure, observability
chaining: true
---

# System Design

## Design output
1. **Requirements summary** — what the system must do
2. **High-level architecture** — components and how they connect
3. **Data flow** — how information moves through the system
4. **Component breakdown** — each major component, its responsibility
5. **Technology choices** — recommended stack with rationale
6. **Tradeoffs** — what was chosen and what was sacrificed
7. **Scaling considerations** — how this grows
8. **Open decisions** — architectural choices still to be made

## Design principles Frasier applies
- Separation of concerns — each component does one thing
- Loose coupling — components can change independently
- Single source of truth — data has one authoritative home
- Fail gracefully — design for the failure case
- Build for observability — you need to see what's happening

## Guidelines
- Draw the architecture in text form using boxes and arrows if diagrams aren't available
- Flag when a choice prioritizes speed-to-market over long-term maintainability
- Identify the highest-risk architectural decisions explicitly
- Chain to Coach to write this up as a technical requirements document
- Chain to Carla for architecture review
