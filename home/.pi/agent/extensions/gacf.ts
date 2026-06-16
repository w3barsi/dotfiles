import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

const GACF_PROMPT = `Stage and commit all changes, splitting unrelated changes into separate coherent commits.

Steps:
1. Inspect all unstaged changes with \`git status\` and \`git diff\` to understand what changed.
2. Group related changes into logical, coherent commit groups. Separate unrelated changes (different features, fixes, docs, tests, unrelated modules) into distinct commits. Do NOT lump everything into one commit.
3. For each group, stage only the files belonging to that group with \`git add <paths>\` (do NOT use \`git add -A\` for a single commit if there are unrelated changes).
4. Inspect the staged diff for that group with \`git diff --cached\`.
5. Write a concise commit message for that group using a Conventional Commits prefix. Choose the best prefix from this standard set:
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
6. Commit that group with its message, then move on to the next group until all changes are committed.

If there is only one logical change across all files, a single commit is fine. Otherwise, create multiple commits.`;

export default function (pi: ExtensionAPI) {
  pi.registerCommand("gacf", {
    description:
      "Git add all and commit full: stage everything and commit generatively with full splitting logic",
    handler: async (args, ctx) => {
      const prompt = args?.trim()
        ? `${GACF_PROMPT}\n\nAdditional instructions from the user:\n${args.trim()}`
        : GACF_PROMPT;

      if (ctx.isIdle()) {
        pi.sendUserMessage(prompt);
      } else {
        pi.sendUserMessage(prompt, { deliverAs: "followUp" });
        ctx.ui.notify("Queued /gacf as a follow-up", "info");
      }
    },
  });
}
