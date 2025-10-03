# Contributing

Thanks for helping improve *Econometrics I (Part I)*! This repository is the canonical source for course materials. Follow the steps below when you contribute your own work.

## Student Workflow

1. **Fork** `rgriva/econometrics-fgv-2025` to your personal GitHub account.
2. **Clone** your fork locally and configure the `upstream` remote:
   ```bash
   git clone git@github.com:<your-github-username>/econometrics-fgv-2025.git
   cd econometrics-fgv-2025
   git remote add upstream git@github.com:rgriva/econometrics-fgv-2025.git
   ```
3. **Sync with upstream** before starting new work:
   ```bash
   git fetch upstream
   git checkout main
   git merge upstream/main
   ```
4. **Create a feature branch** for each deliverable, e.g. `ps1/alice_bob_charlie`.
5. **Add your files** under `student_work/<group_name>/<ps_number>/`. Commit only the source files, data, and the PDF report you intend to submit.
6. **Review your changes**:
   ```bash
   git status
   git diff
   ```
7. **Commit with a descriptive message** and push to your fork:
   ```bash
   git commit -am "PS1: add kernel density answers"
   git push origin ps1/alice_bob_charlie
   ```
8. **Open a Pull Request** from your fork's branch into `rgriva/econometrics-fgv-2025:main`. Use the PR description to summarize the deliverable and call out anything the graders should notice.

## Pull Request Checklist

- Merge the latest `upstream/main` before you submit the PR to avoid conflicts.
- Confirm that generated artifacts (e.g. `.pdf`, `.html`, `.synctex.gz`) follow the conventions in `.gitignore`. Do not commit LaTeX auxiliary files.
- Ensure notebooks run from top to bottom without errors if you include them.
- Double-check that you do **not** commit confidential data or solutions for other groups.

## For Teaching Staff

- Prefer branches named `lecture/<topic>` or `ps/<number>` when updating shared material.
- Separate content edits from compiled assets in different commits when feasible; it keeps the history easier to review.
- Tag releases (e.g. `v2025-ps1`) to mark what students should consider the official version.

Happy hacking!
