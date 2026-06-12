---
description: Stage all changes and commit them.
agent: build
model: opencode-go/deepseek-v4-pro
---

Steps:
1. Add all unstaged changes with \`git add -A\`.
2. Inspect the staged changes with \`git diff --cached\`.
3. Write a concise commit message using a Conventional Commits prefix. Choose the best prefix from this standard set:
   - \`build\` — build system or dependency changes
   - \`chore\` — maintenance or tooling
   - \`ci\` — CI configuration changes
   - \`docs\` — documentation changes
   - \`feat\` — new feature
   - \`fix\` — bug fix
   - \`perf\` — performance improvement
   - \`refactor\` — code restructuring (no bug fix or feature)
   - \`revert\` — reverting a previous commit
   - \`style\` — formatting, semicolons, etc.
   - \`test\` — adding or correcting tests
   Format: \`prefix(scope): description\`. Always include a scope that describes the affected module, package, or area (e.g., \`feat(auth): add OAuth login\`, \`fix(ui): correct button alignment\`).
   Use imperative mood ("add" not "added"). Keep the subject under 72 characters.
   Use the context from this agent thread to create the commit message.
4. Commit the changes with that message.

Keep the commit message concise.`;
