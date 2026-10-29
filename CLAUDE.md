# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

D&D 5e RPG Prototype - A 2D turn-based RPG built with Godot 4.7, inspired by classic Dragon Warrior games with D&D 5e rules.

## Architecture

### Node-based Structure
- **CharacterBody2D**: Player movement and exploration (`scripts/player.gd`)
- **Node**: Combat system components (manager, UI, character classes)

### Core Systems

**Character System** (`scripts/character.gd`)
- Six ability scores: STR, DEX, CON, INT, WIS, CHA
- Modifier calculation: `(score - 10) / 2` (floor division)
- AC = 10 + DEX modifier (unarmored)
- D20-based attack rolls and skill checks with advantage/disadvantage

**Fighter Class** (`scripts/fighter.gd`)
- Extends character with level-based features
- Second wind (recover 1d10 + level HP)
- Action surge (extra action)
- Extra attack at level 3+
- Indomitable (reroll fails) at level 5+

**Combat System** (`scripts/combat_manager.gd`)
- Turn-based, initiative-driven
- `CombatActor` class encapsulates combatants
- Sorts turn order by initiative (descending)
- Round tracking with `next_turn()` advancing index circularly

**Exploration** (`scripts/player.gd`)
- Grid-based movement (32px tiles)
- 15% random encounter rate per tile transition
- Transitions to `combat.tscn` on encounter

## Project Structure

```
├── scenes/
│   ├── world.tscn      # Main exploration scene (CharacterBody2D player)
│   └── combat.tscn     # Turn-based combat scene
├── scripts/
│   ├── character.gd    # Base D&D 5e character class
│   ├── fighter.gd      # Fighter subclass with class features
│   ├── enemy.gd        # Simple enemy template
│   ├── player.gd       # Player movement and exploration
│   ├── combat_manager.gd  # Turn-based combat flow
│   └── combat_ui.gd    # Combat HUD
├── project.godot       # Project config (main_scene: world.tscn)
└── input_map.txt       # WASD movement, Enter/Space/A attack, Escape cancel
```

## Building

- **Android**: Godot editor > Export > Android > Configure and export
- Export preset configured in `project.godot` (preset.00)

## Key Patterns

- Use `roll_d20()` for random 1-20 rolls
- Critical hits on natural 20 (double damage)
- Use `get_modifier(stat)` for ability score calculations
- Combat uses `CharacterBody2D` for player, `Node` for combatants
