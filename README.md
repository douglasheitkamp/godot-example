# D&D 5e RPG Prototype - Godot Project

This project implements a 2D RPG inspired by Dragon Warrior/Dragon Warrior with D&D 5e rules.

## Project Structure

```
godot-example/
├── scenes/
│   ├── world.tscn      # Main exploration scene
│   └── combat.tscn     # Turn-based combat scene
├── scripts/
│   ├── character.gd    # Base D&D 5e character class
│   ├── fighter.gd      # Fighter subclass
│   ├── enemy.gd        # Enemy template
│   ├── player.gd       # Player movement and exploration
│   ├── combat_manager.gd  # Turn-based combat flow
│   └── combat_ui.gd    # Combat HUD and menu
├── project.godot       # Project configuration
└── input_map.txt       # Input bindings
```

## Features

### Character System (D&D 5e)
- Six ability scores: STR, DEX, CON, INT, WIS, CHA
- Ability modifiers: (score - 10) / 2
- Hit points and armor class calculation
- Attack rolls with d20 system
- Skill checks with advantage/disadvantage

### Fighter Class
- Second wind action (recover HP)
- Action surge (extra action)
- Extra attack at level 3+
- Defense dueling, great weapon fighting styles

### Combat System (1v1 Grid-based)
- Turn-based combat (initiative-based)
- Action economy (Action, Bonus Action)
- Weapon damage with critical hits on natural 20
- Advantage/disadvantage mechanics

### Exploration
- Grid-based movement
- Location-based random encounters
- Transition to combat on encounter

## Controls

- **WASD / Arrow Keys** - Movement
- **Enter / Space / A** - Attack (in combat)
- **Escape** - Cancel

## Building

To build for Android, use the Godot editor:
1. Open the project in Godot 4.7
2. Go to Export > Android
3. Configure export settings
4. Export project

## License

MIT License
