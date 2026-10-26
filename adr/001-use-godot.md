# ADR 001: Use Godot Engine

## Context

We need to decide whether to use the Godot Engine for developing a 2D RPG mobile application. Godot is an open-source game engine with the following relevant characteristics:

**Pros:**
- Open source and free (MIT licensed)
- Lightweight and cross-platform (supports Android, iOS, desktop)
- Strong 2D game development capabilities
- Active community and documentation
- GDScript is relatively easy to learn
- Export templates available for mobile platforms

**Cons:**
- Learning curve for those unfamiliar with the engine
- Smaller ecosystem compared to Unity or Unreal
- Mobile performance may require optimization work

## Decision

We will use Godot Engine for this project.

## Status

Accepted.

## Consequences

- Project structure will follow Godot conventions
- Export templates for Android will need to be configured
- Development will leverage Godot's node-based architecture and scene system

## Links

- [Godot Engine official site](https://godotengine.org/)
- [Godot documentation](https://docs.godotengine.org/)
