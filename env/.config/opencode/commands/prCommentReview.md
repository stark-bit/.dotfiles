---
description: Review PR comment validity and suggest fixes
---
Here are current branch's PR review comments:
!`gh api "repos/$(gh repo view --json owner,name --jq '.owner.login + "/" + .name')/pulls/$(gh pr view --json number --jq '.number')/comments" --jq '.[] | {file: .path, comment: .body}'`

For each comment, assess whether it:
- Is technically correct
- Improves code quality or maintainability
- Is consistent with existing codebase patterns
- Is meaningful vs a nitpick

Dismiss comments that are:
- Stylistic preferences without clear benefit
- Inconsistent with the rest of the codebase
- AI boilerplate that adds noise

For valid comments, present options to address them.
Report at the end with only a 2-4 sentence summary of findings.


