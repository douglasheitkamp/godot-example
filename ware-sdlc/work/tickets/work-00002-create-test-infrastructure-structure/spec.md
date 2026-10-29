# Spec: Test Infrastructure for D&D 5e RPG

## Overview
This spec documents the test infrastructure implementation for the D&D 5e RPG Prototype, enabling automated validation of combat mechanics and AI-driven SDLC iteration.

## Test Structure

```
tests/
├── test_runner.gd              # Main test runner that executes all tests
├── test_runner.tscn            # Test scene (empty, runs test_runner.gd)
├── combat/
│   ├── dice_rolls.gd           # Unit tests for dice rolls and modifiers
│   └── combat_manager_tests.gd # Unit tests for combat flow
├── fighter/
│   └── fighter_tests.gd        # Unit tests for fighter class features
└── integration/
    └── combat_flow_tests.gd    # Full combat simulation tests
```

## Test Categories

### 1. Character Tests (`test_runner.gd`)
- Default stat initialization
- Modifier calculation: `(stat - 10) / 2` (floor division)
- AC calculation: `10 + DEX modifier`
- Dice roll distributions (1-20 range)
- Skill checks with advantage/disadvantage

### 2. Combat Tests (`combat_manager_tests.gd`)
- Combat initialization
- Initiative sorting (descending order)
- Turn progression
- Combat end state

### 3. Fighter Tests (`fighter_tests.gd`)
- Level-based feature unlocking:
  - Level 1: Second Wind
  - Level 3: Extra Attack
  - Level 5: Indomitable
- Second Wind recovery (1d10 + level HP)
- Action Surge (exhaustion tracking)
- Attack roll and damage calculation
- Critical hit mechanics

### 4. Integration Tests (`combat_flow_tests.gd`)
- Full combat simulation from start to end
- Second Wind usage mid-combat
- Multiple combatants
- Win/loss conditions

## Running Tests

```bash
# Check script syntax
godot --path . --check-only tests/test_runner.gd

# Run all tests (headless)
godot --path . --headless --scene "res://tests/test_runner.tscn"
```

## CI Integration

The GitHub Actions workflow (`/.github/workflows/ci.yml`) runs:

1. **code-quality**: Syntax validation on all GDScript files
2. **combat-tests**: Full test suite execution
3. **export-test**: Verify exports work correctly

## Test Assertions

The test framework provides these assertion helpers:
- `assert(condition, message)` - Basic boolean assertion
- `assert_eq(actual, expected, message)` - Equality check
- `assert_ne(actual, expected, message)` - Inequality check
- `assert_gt(actual, expected, message)` - Greater than
- `assert_lt(actual, expected, message)` - Less than

## Success Criteria

- All tests pass with 0 failures
- Test coverage includes:
  - 100% of modifier calculation logic
  - 100% of AC calculation logic
  - 100% of initiative sorting logic
  - 80%+ of fighter class features
- CI pipeline runs in under 2 minutes

## Future Enhancements

- Monte Carlo testing for probability mechanics (15% encounter rate)
- Fuzz testing for edge cases in combat math
- Visual regression testing for UI
- Performance benchmarking for combat loops
