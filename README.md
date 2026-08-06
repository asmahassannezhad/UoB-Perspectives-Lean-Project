# Lean Formalisation Project — Template Repository

> **MATH30024 Perspectives in Mathematics · University of Bristol**

Welcome! This repository is your group's starting point for the Lean
formalisation project. It comes **pre-configured with Lean 4 and Mathlib**, so
you can start proving straight away — no local installation required.

The quickest way to get going is **GitHub Codespaces** (everything runs in your
browser). If you would rather work on your own laptop, see
[Working locally](#working-locally-in-vs-code-optional) at the end.

---

## Quick start (GitHub Codespaces — recommended)

### 1. Create your group's copy of the repository

Click the green **`Use this template`** button (top-right of this page) →
**`Create a new repository`**.

- Give it your **group's name** and make it **Private**.
- **Add your teammates as collaborators right away:**
  **`Settings` → `Collaborators` → `Add people`** — otherwise nobody else can
  open it. Each teammate then accepts the invitation from their email.

### 2. Open your new repository in a Codespace

On your new repository, click **`Code` → `Codespaces`**.

### 3. Choose a 4-core machine

At the top-right of the Codespaces tab, choose **`New with options…`** (not the
default green button), set **`Machine type`** to **`4-core`**, then click
**`Create codespace`**.

> [!NOTE]
> The default 2-core machine is slow for Lean and Mathlib. Larger machines are
> faster but use your monthly Codespaces quota more quickly — the **GitHub
> Student Developer Pack** raises that quota.

### 4. Install the Lean 4 extension

When VS Code opens in the browser, open the **Extensions** panel (the squares
icon in the left bar, or press `Ctrl`/`Cmd` + `Shift` + `X`), search for
**`lean4`**, and install the official **Lean 4** extension published by
`leanprover` — if it is not already installed.

> [!WARNING]
> Do **not** install the older `lean` (Lean 3) extension.

### 5. Open a terminal and source your profile

Open the integrated terminal (**`Terminal` → `New Terminal`**). If `lean` or
`lake` are reported as *command not found*, put them on your `PATH`:

```bash
source ~/.profile
```

### 6. Check that Lean and Elan are installed

```bash
lean --version
elan --version
```

You should see version numbers for both. If you get *command not found*, re-run
`source ~/.profile` (or open a fresh terminal) and try again.

### 7. Download the cached dependencies and build

```bash
lake exe cache get   # download a prebuilt Mathlib (the big time-saver)
lake build           # build the project
```

> [!TIP]
> `lake exe cache get` downloads Mathlib **already compiled**. Always run it
> first — building Mathlib from source can take a very long time.

### 8. Check it works, and start editing

1. Open any `.lean` file in the project's source folder (the capitalised folder
   next to `lakefile.toml`).
2. Wait for the **`∀`** symbol to appear in the **top-right corner** — that
   confirms Lean is active. The first time, the toolchain and Mathlib cache are
   set up, which can take a few minutes; a loading indicator in the bottom
   status bar is normal.
3. Put your cursor on a line of a proof: the **Lean Infoview** opens on the
   right, showing the current goal. If you lose it, reopen with
   `Ctrl`/`Cmd` + `Shift` + `Enter`.

Write your definitions and proofs in files under the source folder (right-click
the folder → **`New File`** to add one).

> [!IMPORTANT]
> Do **not** write `import Mathlib` — it loads the entire library and makes your
> file very slow to open. Import only the parts you need, for example
> `import Mathlib.Data.Real.Basic`.

---

## Working locally in VS Code (optional)

Codespaces is the supported route, but you can also work on your own machine.

### 1. Install the required software

- **VS Code** — <https://code.visualstudio.com>
- **Git** — <https://git-scm.com>
- The **Lean 4** extension (as in step 4 above). On first use it installs Lean
  itself via `elan`; you can also follow the
  [official Lean quickstart](https://docs.lean-lang.org/lean4/doc/quickstart.html).

### 2. Clone your repository

Find the URL on your repository page under **`Code` → `Local` → `HTTPS`**, then:

```bash
git clone <repository-url>
cd <repository-name>
lake exe cache get
```

### 3. Open the project in VS Code

Use **`File` → `Open Folder`** and select the repository's **root** folder (the
one containing `lakefile.toml`). Click **`Yes, I trust the authors`** on the
Workspace Trust prompt, open a `.lean` file, and wait for the `∀` symbol.

### 4. The everyday Git workflow

```bash
git pull                              # get your teammates' latest changes
git status                            # see what you have changed
git add .                             # stage all your changes
git commit -m "Describe your changes" # save a snapshot with a message
git push                              # upload your commits to GitHub
```

> [!TIP]
> **Pull before you start, commit small and often, and push when you pause.**
> If two people edit the same lines, Git reports a *merge conflict* — pulling
> often keeps these rare, and you resolve one by choosing or combining the two
> versions (nothing is lost).

To work on your own part without disturbing `main`, use a branch:

```bash
git checkout -b your-name/your-lemma  # create and switch to a branch
# ... edit, then add / commit as above ...
git push -u origin your-name/your-lemma
```

When it is ready, open a **Pull Request** on GitHub to merge it into `main`.

---

## Troubleshooting

| Problem | Fix |
|---|---|
| `lean` / `lake`: *command not found* | Run `source ~/.profile`, or open a new terminal. |
| No **`∀`** symbol / Lean won't load | Make sure you opened the **folder** (not a single file), trust the workspace, and wait for the first build to finish. |
| The build is very slow | Run `lake exe cache get` **before** `lake build`; use a **4-core** Codespace. |
| Editor is sluggish | Avoid `import Mathlib`; import only the modules you need. |
| Nothing happens on first open | The first build downloads the toolchain and Mathlib — this can take a few minutes. Watch the bottom status bar and be patient. |

---

## Getting help

- Bring broken proofs to the **class sessions / drop-in**.
- The Lean community **Zulip** — the `#new members` stream is famously
  welcoming: <https://leanprover.zulipchat.com>
- Recommended references (see the course handbook): **Mathematics in Lean** and
  **A Glimpse of Lean**.

Happy formalising!
