<!--
Skills: read the shared writing guide bundled with the skill package before filling this template.
This is the body of a pull request, written for the reviewer who has not read the work's documents.
Fill it from the work record: the intent, the spec's acceptance checks, and the evidence delivery recorded.
Keep the project's section order and headings. Report a section you have nothing to fill rather than inventing content.
Use the project's own names for its parts. No preamble; keep prose brief.
Delete these comments in the opened pull request.
-->
## Summary
<!-- REQUIRED. The outcome in a sentence or two, then the one visual that best shows the shape of the change:
pseudocode, a call tree, a file tree, a sequence diagram, or a diff-style sketch of what moved.
Add a second visual only when one cannot carry the point; none when a sentence is clearer. -->

## Evidence
<!-- REQUIRED. One entry per acceptance check (or per part of the outcome when there is no spec):
what showed it before the change and what shows it now. A screenshot for a visible change,
otherwise a named test or command output. Give a "before" only when one was recorded,
and say "not run" for a check with no recorded evidence. -->

## Merge Danger
<!-- REQUIRED. Proposed by the author, confirmed before the pull request opens. -->
**Door:** <!-- one-way or two-way, and why in one sentence. One-way when merging cannot simply be reverted:
data deleted or migrated, a published contract removed or changed, or a change others consume first. -->

**Blast Radius:** <!-- one word for how far the effects reach, then what could break if the change is wrong. -->

## Links
<!-- REQUIRED. The issue tracker item and the work's intent, spec, and plan. -->
