# Intent: D&D 5e RPG Prototype

## Problem

We want to create a 2D RPG game inspired by Dragon Quest/Dragon Warrior, but with D&D 5e rules. The prototype needs to establish the core gameplay loop: open world exploration and turn-based combat using D&D 5e mechanics.

## Proposed Outcome

1. A Godot project with a fighter class character using D&D 5e stats (HP, AC, ability scores, proficiency bonus)
2. Open world exploration with grid-based movement
3. 1:1 turn-based combat on a grid (no positioning, like Dragon Warrior)
4. Skill checks with advantage/disadvantage mechanics
5. Random encounters based on location
6. Single area prototype that demonstrates the complete loop

## Hard Constraints

- Must use Godot Engine (ADR 001 accepted)
- No external assets from Humble Bundle (ADR 002 declined)
- Prototype scope: single class (fighter), single area, core mechanics only

## Explicit Non-Goals

- Multiplayer support (future consideration)
- Full D&D 5e ruleset implementation
- Multiple classes or races
- Complex spell systems

## UI Style (Answered)

Modern RPG style: HUD with health/magic bars, action buttons at bottom of screen.
