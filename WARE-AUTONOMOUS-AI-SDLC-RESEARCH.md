# AI-Driven SDLC Loop Research Report

**Date**: 2026-10-27  
**Project**: D&D 5e RPG Prototype (Godot 4.7)  
**Objective**: Iterate on this project without human intervention and limited human testing

---

## Executive Summary

Your D&D 5e RPG project is an excellent candidate for AI-driven SDLC automation. The project's structure—modular GDScript classes, turn-based combat system, and rule-based mechanics—maps well to testable components. However, Godot's automation ecosystem is **emerging but not mature**, requiring custom tooling for full autonomy.

### Key Findings

| Capability | Maturity | Feasibility for Your Project |
|------------|----------|------------------------------|
| Unit Testing (GDScript) | Alpha | High - Combat math, modifiers, dice rolls |
| CI/CD Integration | Mature | High - GitHub Actions works well |
| Headless Execution | Partial | Medium - Linux xvfb works, macOS limited |
| Visual Regression | None | Low - Not critical for D&D prototype |
| AI Testing Agents | Research | Medium - Custom agents possible |
| Fuzz Testing | None | Medium - High value for D&D mechanics |

---

## Detailed Analysis

### 1. Test Frameworks for Your D&D Project

**Built-in Godot TestServer** is your best starting point:
- Access via **Project > Tools > Tests** in Godot editor
- Uses GDScript for test cases
- Supports `assert()`, test fixtures, and test runners

**Recommended Test Suite for Your Project:**

```
tests/
├── combat/
│   ├── dice_rolls.gd          # Test roll_d20(), advantage/disadvantage
│   ├── modifier_calc.gd       # Test get_modifier() with edge cases
│   ├── ac_calculation.gd      # Test AC = 10 + DEX modifier
│   └── encounter_rate.gd      # Monte Carlo: 15% encounter rate
├── fighter/
│   ├── second_wind.gd         # Test 1d10 + level HP recovery
│   ├── action_surge.gd        # Test extra action availability
│   ├── extra_attack.gd        # Test level 3+ feature
│   └── indomitable.gd         # Test level 5+ reroll
├── enemy/
│   └── simple_combat.gd       # Basic enemy AI behavior
└── integration/
    └── combat_flow.gd         # Full combat loop (player -> enemy -> win/lose)
```

### 2. CI/CD Automation (Most Feasible)

**GitHub Actions Workflow:**

```yaml
name: Godot CI

on: [push, pull_request]

jobs:
  code-quality:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: GodotEngine/godot-action@v2
        with:
          version: "4.7.2"
      - name: Check syntax
        run: godot --path . --check-only
      - name: Run tests (headless)
        run: godot --path . --headless --check-only
  
  combat-math:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: GodotEngine/godot-action@v2
        with:
          version: "4.7.2"
      - name: Test combat logic
        run: godot --path . --headless --scene "res://tests/combat/combat_flow.tscn"
  
  export-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: GodotEngine/godot-action@v2
        with:
          version: "4.7.2"
      - name: Test HTML export
        run: godot --path . --export "HTML" ./build/index.html
```

**Key Insight**: Your project's `project.godot` already has Android export preset configured. You can add HTML5 export for CI testing.

### 3. Screen Readers/Watchers

**Current State**: Limited built-in support.

**Workarounds for Your Project:**

1. **Viewport Capture** for visual verification:
```gdscript
func capture_scene(path):
    var texture = $Viewport.get_texture()
    var image = texture.get_image()
    image.save_png(path)
```

2. **Logging System** for non-visual debugging:
```gdscript
# Add to combat_manager.gd
func log_combat_event(event):
    print("[Combat] %s: %s" % [Time.get_unix_time_from_system(), event])
```

3. **Test Scene with Auto-Execution**:
```gdscript
# tests/test_runner.gd
extends Node

func _ready():
    run_all_tests()
    get_tree().quit()  # Auto-exit after testing

func run_all_tests():
    test_combat_math()
    test_encounter_rate()
    # ... more tests
```

### 4. Custom Skills/Agents for Testing

**Recommended Agent Architecture:**

```
agent/
├── test_generator.gd      # Generates test cases from code comments
├── combat_analyst.gd      # Analyzes combat balance and math
├── fuzz_runner.gd         # Runs fuzz tests on game logic
├── screenshot_comparer.gd # Compares visual output (with tolerance)
└── ci_orchestrator.gd     # Manages CI pipeline stages
```

**Custom Agent: Combat Balance Analyst**

```gdscript
# agents/combat_balance_analyst.gd
extends Node

func analyze_combat_balance():
    var player_hp = 20  # Typical fighter
    var enemy_damage = 7  # Average goblin
    var rounds_to_kill = ceil(player_hp / enemy_damage)
    
    # Verify combat isn't too long or too short
    assert(rounds_to_kill >= 3, "Combat too short - player dies in 1-2 hits")
    assert(rounds_to_kill <= 10, "Combat too long - grueling grind")
```

---

## Recommended Implementation Plan

### Phase 1: Foundation (Week 1)
1. Create test directory structure
2. Write unit tests for `character.gd` (modifier, AC, dice rolls)
3. Set up GitHub Actions CI
4. Create headless test runner scene

### Phase 2: Combat Testing (Week 2)
1. Write combat manager tests (turn order, initiative)
2. Test fighter class features (Second Wind, Action Surge)
3. Monte Carlo tests for encounter rates
4. Integration tests for full combat flow

### Phase 3: Automation (Week 3)
1. Create custom testing agents
2. Implement screenshot comparison for UI
3. Set up automated export testing
4. Create test coverage reporting

### Phase 4: AI-Assisted Testing (Week 4+)
1. Train LLM on D&D 5e rules for test generation
2. Implement fuzz testing for edge cases
3. Create balance analysis tools
4. Add anomaly detection for regressions

---

## Key Recommendations

1. **Start with Godot's built-in TestServer** - It's already in your engine
2. **Prioritize combat math tests** - Your D&D mechanics are deterministic and highly testable
3. **Use Monte Carlo for probability** - 15% encounter rate can be statistically verified
4. **GitHub Actions is your CI backbone** - The `godot-action` is mature and well-maintained
5. **Build custom agents incrementally** - Start with combat analyst, add fuzz runner later

---

## Tools & Resources

| Tool | URL | Status |
|------|-----|--------|
| Godot TestServer | Built-in | Alpha |
| godot-action CI | https://github.com/GodotEngine/godot-action | Mature |
| godot-test (gdunit) | https://github.com/BooleanCat/godot-test | Alpha |
| Godot Behavior Tree | https://github.com/Orama-Interactive/Godot-BehaviorTree | Mature |

---

## Conclusion

Your D&D 5e RPG project is **highly suitable** for AI-driven SDLC automation. The deterministic nature of D&D rules (dice rolls, modifiers, combat math) makes it far easier to test than many game types.

**Most Impactful First Steps:**
1. Write 5-10 unit tests for combat math
2. Set up GitHub Actions CI
3. Create a test runner scene that auto-exits

These steps provide immediate value with minimal setup effort.
