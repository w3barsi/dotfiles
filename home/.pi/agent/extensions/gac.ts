import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

const GAC_PROMPT = `Stage all changes and commit them.

Steps:
1. Add all unstaged changes with git add -A.
2. Inspect the staged changes with git diff --cached.
3. Write a concise commit message using a Conventional Commits prefix. Choose the best prefix from this standard
  set:
   - build — build system or dependency changes
   - chore — maintenance or tooling
   - ci — CI configuration changes
   - docs — documentation changes
   - feat — new feature
   - fix — bug fix
   - perf — performance improvement
   - refactor — code restructuring (no bug fix or feature)
   - revert — reverting a previous commit
   - style — formatting, semicolons, etc.
   - test — adding or correcting tests
     Format: prefix(scope): description. Always include a scope that describes the affected module, package, or
     area (e.g., feat(auth): add OAuth login, fix(ui): correct button alignment).
     Use imperative mood ("add" not "added"). Keep the subject under 72 characters.
4. Commit the changes with that message.
5. After committing, output the commit message as your very last line, prefixed with \`[commit]\`. Example: \`[commit] feat(ui): lorem ipsum dolor sit amet\` Make sure to send it in a new line so that the message can be parsed.

Keep the commit message concise.`;

export default function (pi: ExtensionAPI) {
  pi.registerCommand("gac", {
    description: "Git add all and commit: stage everything and commit",
    handler: async (args, ctx) => {
      const prompt = args?.trim()
        ? `${GAC_PROMPT}\n\nAdditional instructions from the user:\n${args.trim()}`
        : GAC_PROMPT;

      if (ctx.isIdle()) {
        pi.sendUserMessage(prompt);
      } else {
        pi.sendUserMessage(prompt, { deliverAs: "followUp" });
        ctx.ui.notify("Queued /gac as a follow-up", "info");
      }
    },
  });
}
