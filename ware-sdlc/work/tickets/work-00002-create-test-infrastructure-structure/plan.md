# Plan: Test Infrastructure Implementation

## Phase 1: Foundation (Current - work-00002)

### Tasks
1. Create test directory structure (`tests/`, `tests/combat/`, etc.)
2. Implement `test_runner.gd` with assertion framework
3. Write unit tests for `character.gd`:
   - Modifier calculation tests
   - AC calculation tests
   - Dice roll distribution tests
   - Skill check tests
4. Write unit tests for `combat_manager.gd`:
   - Combat initialization tests
   - Initiative sorting tests
   - Turn progression tests
5. Write unit tests for `fighter.gd`:
   - Level feature tests
   - Second Wind tests
   - Action Surge tests
   - Attack tests

### Acceptance Criteria
- `godot --path . --check-only tests/test_runner.gd` passes
- All unit tests pass with 0 failures
- Test runner outputs clear pass/fail summary

### Estimated Effort: 4 points

## Phase 2: Integration Testing (work-00003)

### Tasks
1. Write full combat simulation tests
2. Test Second Wind usage mid-combat
3. Test multiple combatants
4. Test win/loss conditions

### Acceptance Criteria
- Integration tests simulate complete combat scenarios
- Tests verify combat flow from start to end

### Estimated Effort: 3 points

## Phase 3: CI/CD Setup (work-00004)

### Tasks
1. Configure GitHub Actions workflow
2. Add syntax checking job
3. Add test execution job
4. Add export verification job

### Acceptance Criteria
- CI runs on push/PR
- All three jobs pass
- Pipeline completes in under 2 minutes

### Estimated Effort: 2 points

## Phase 4: Advanced Testing (work-00005)

### Tasks
1. Monte Carlo testing for 15% encounter rate
2. Fuzz testing for combat math edge cases
3. Custom testing agents for AI-assisted testing
4. Test coverage reporting

### Acceptance Criteria
- Probability tests verified statistically
- Edge cases covered
- Agent architecture documented

### Estimated Effort: 4 points

## Total Estimated Effort: 13 points

## Notes
- Tests use Godot's built-in `assert()` function
- Test runner exits with code 0 on success, 1 on failure
- Headless mode (`--headless`) used for CI execution
- CI uses `GodotEngine/godot-action@v2` GitHub Action
