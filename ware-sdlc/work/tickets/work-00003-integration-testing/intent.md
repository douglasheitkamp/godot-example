# Intent: Integration Testing for D&D 5e RPG

## Objective
Write full combat simulation tests that validate the complete gameplay loop from exploration through combat resolution.

## Scope
- Write combat flow tests that simulate an entire encounter:
  - Player enters combat scene
  - Initiative is rolled and turn order established
  - All combatants take turns
  - Combat ends with win/loss condition
- Test Second Wind usage mid-combat
- Test multiple combatants (player vs. multiple enemies)
- Test combat transition back to exploration
- Test random encounter triggering

## Out of Scope
- Visual regression testing (not critical for this prototype)
- Performance benchmarking

## Success Criteria
- Integration tests simulate complete combat scenarios from start to end
- All combatants behave according to D&D 5e rules
- Win/loss conditions are correctly detected
