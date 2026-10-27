# ADR 002: Humble Bundle Purchase

## Context

A Godot Game Development Mega Bundle is available on Humble Bundle for $22.99 USD. Based on the bundle page, it includes:

**Contents (20 items):**
- Godot export templates (Android, iOS)
- Multiple game templates (RPG, platformer, puzzle, etc.)
- Asset packs (sprites, tiles, UI assets)
- Development tools and utilities
- Learning resources and courses

**Potential benefits:**
- Immediate access to export templates for Android/iOS deployment
- 20+ templates and assets to accelerate development
- Cost-effective at ~$1.15 per item
- One-time purchase supports content creators

**Considerations:**
- Cost: $22.99 USD
- May include assets/templates not relevant to our specific 2D RPG vision
- Could create decision fatigue or scope creep if we start from someone else's template
- Godot's built-in tools may be sufficient for our needs

## Decision

**Decline the purchase** - Build using Godot's built-in tools and open resources.

## Rationale

- Godot Engine is already free and open source
- Export templates can be downloaded directly from Godot's official渠道
- Starting from scratch gives us full control over the codebase
- Open asset libraries (Godot Asset Library, Itch.io) offer free alternatives
- Avoiding external dependencies keeps the project lightweight

## Status

Accepted.

## Consequences

- We will use Godot's built-in export template system
- Assets will be sourced from free/open libraries as needed
- Project remains fully self-contained and transparent

## Links

- [Humble Bundle: Godot Game Development Mega Bundle](https://www.humblebundle.com/software/godot-game-development-mega-bundle-20-complete-game-templates-software)
- [Godot Export Templates](https://godotengine.org/download/)

## Links

- [Humble Bundle: Godot Game Development Mega Bundle](https://www.humblebundle.com/software/godot-game-development-mega-bundle-20-complete-game-templates-software)
