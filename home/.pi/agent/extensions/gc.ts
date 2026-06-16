import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

const GC_PROMPT = `Commit changes

Steps:
1. Inspect the staged changes with git diff --cached.
2. Write a concise commit message using a Conventional Commits prefix. Choose the best prefix from this standard
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
3. Commit the changes with that message.

Keep the commit message concise.`;

export default function (pi: ExtensionAPI) {
  pi.registerCommand("gc", {
    description: "Git commit: commit staged changes",
    handler: async (args, ctx) => {
      const prompt = args?.trim()
        ? `${GC_PROMPT}\n\nAdditional instructions from the user:\n${args.trim()}`
        : GC_PROMPT;

      if (ctx.isIdle()) {
        pi.sendUserMessage(prompt);
      } else {
        pi.sendUserMessage(prompt, { deliverAs: "followUp" });
        ctx.ui.notify("Queued /gc as a follow-up", "info");
      }
    },
  });
}
