# Editor Config

> In the docs below, *Code* refers to [the open-source project by Microsoft](https://github.com/microsoft/vscode) as well as other projects that are based on the source code of *Code*. This includes desktop variants: *[VSCode](https://code.visualstudio.com/)* and *[VSCodium](https://vscodium.com/)*; and browser-based variants: *[GitHub Codespaces](https://github.com/features/codespaces)* and *[OpenVSCode Server](https://github.com/gitpod-io/openvscode-server)*.
>
> Where documentation is relevant to a specific *Code* distribution (i.e. *VSCode* or *VSCodium*, but not both), it will be noted. Otherwise assume the docs refer to all derivatives of *Code*.

To put it as simply as possible, I usually prefer to use Code as my default IDE and Micro as my default `$EDITOR`. Sometimes I1 also play with Neo/Vim.

## Code

I tend to install both Codium *and* VSCode now. This is because if there is ever an issue with Codium, I rarely have the time to immediately fix it and need something I can drop into and keep working right away. This does mean though that I need to spend some time ensuring both editors behave similarly when setting up my dotfiles. That said, Codium is usually pretty rock solid, and I have found alternative ways (read: FOSS extensions 💪) to get 99% feature parity across both editors.

### Getting started

Install the Sync Settings extension by Zokugun

```bash
$ codium --install-extension zokugun.sync-settings
# or
$ code --install-extension zokugun.sync-settings
```

From within Code, open the command palette and run:

```bash
> Sync Settings: Open the repository settings
```

Edit and save the file with the following (replace `$DOTFILES` with the local path to this repo as the extension does not expand `$ENV_VARIABLES`):

```yaml
# hostname: (optional)
profile: main
repository:
  type: file
  path: $DOTFILES/config/editor
```

Then run this from the command pallette:

```bash
> Sync Settings: Download (repository -> user)
```

> **Note**
> You probably want to make a coffee ☕️ after running the last command. You can see logs of what it is doing under the Output tab (Shared).

> **Warning**
> Do not restart the editor from the Monkey Patch notification. It will still be installing more extensions and will automatically restart on its' own.

### Features:

- [x] Live share (pair/mob programming support)
- [x] Remote SSH / Container
- [x] Code Pair AI (via [Tabnine](https://www.tabnine.com/)[^pair])
- [x] Synced settings without ties to one cloud provider
- [x] Support for "profiles" based on persona (home vs. work) and workspace languages [^profiles]
- [ ] **Git platforms integration**
  - [x] GitHub
  - [x] Gitlab
  - [x] Atlassian
  - [ ] Gitea
- [ ] **Comprehensive languages support**
  - [ ] Syntax highlighting
  - [ ] [Test integrations](https://github.com/hbenl/vscode-test-explorer#test-adapters)
  - [ ] Integrated debugging
  - [ ] Linting

> Settings and extensions are managed using the [*Sync Settings*](https://open-vsx.org/extension/zokugun/sync-settings) extension. This was chosen over using the built-in sync feature of *VSCode* because the sync feature is unavailable to run on non-Microsoft builds of *Code* and is dependant on *GitHub*.

[^pair]: I may try to replace Tabnine with an open source alternative, but for now I am happy just being able to try something that can be used in various editors.

[^profiles]: More needs to be done on the profiles feature but it is largely workable for now. I need the ability to be able to use several languages together in a workspace.

### Profiles:

> 🚧 This is being changed. Possibly looking at using [native profiles](https://code.visualstudio.com/docs/editor/profiles).
> 
> Ultimately, profiles will mainly be used to control which extensions are active. Possibly also for demo purposes

Symlink the `./product.json` file to:

* **Windows:** `%APPDATA%\VSCodium\product.json` or `%USERPROFILE%\AppData\Roaming\VSCodium\product.json`
* **macOS:** `~/Library/Application Support/VSCodium/product.json`
* **Linux:** `$XDG_CONFIG_HOME/VSCodium/product.json` or `~/.config/VSCodium/product.json`

### Todo

- [ ] Configure Markdown
  - [x] "Markdown Preview Github Styling" to use dark mode
  - [x] Open in preview instead of edit
  - [ ] Open in edit when viewing diff
- [ ] Create solid keybindings (using <kbd>⌃Space</kbd> as leader)
  - [ ] [Terminal](https://itnext.io/easy-enhancements-for-vs-codes-terminal-6dda2c22ee5c)
- [ ] Differentiate between similar but different subdirectories
  - [ColorTabs](https://marketplace.visualstudio.com/items?itemName=orepor.color-tabs-vscode-ext) is promising, but cannot style anything I have showing. Have submitted a [feature request (#68)](https://github.com/oreporan/color-tabs-vscode/issues/68).
- [ ] Confirm [Flake8/Black working well together](https://sbarnea.com/lint/black/)
- [ ] Get a "true" word count of Markdown documents (reading time is bonus)

**Find extensions for:**

- [x] ~~Emoji in Markdown~~ (Using Espanso instead)
- [ ] Utilities / Dev toolbox
  - [ ] Regex editor/validator
  - [ ] Time conversion
  - Will create these as Powertool scripts/commands
- [ ] Better copy/paste (maybe integrate into OS instead?)
- [x] Todo lists
- [x] Markdown notes in Action bar
- [ ] Dash docs integration
- [ ] [Test Explorer Adapters](https://github.com/hbenl/vscode-test-explorer#test-adapters)
  - [x] Python
  - [ ] Node
  - [x] C++
  - [ ] PHP
  - [ ] Modern languages
- [x] Spell checking (may need to investigate [Spell Right](https://marketplace.visualstudio.com/items?itemName=ban.spellright) if Code Spell Check is too slow)

### Language support

- [x] **Markup Languages** (Part of Lite)
  - [x] HTML
    - [x] CSS3 / Sass
  - [x] **Markdown**
    - [x] Mermaid
    - [x] Footnotes
    - [x] Github theme <!-- Can I change theme based on git platform in current repo? -->
    - [x] Maths
  - [x] MJML
  - [x] Handlebars / Mustache
  - [x] JSON / YAML
  - [x] TOML
- [x] **Data** (Part of Full)
  - [x] SQLite Browser
  - [x] GraphQL
  - [x] [SQL Tools](https://vscode-sqltools.mteixeira.dev/en/home/)
  - [x] Redis
  - [x] [REST Explorer](https://www.thunderclient.com/)
- [ ] **Node / Typescript**
  - [ ] React
    - [ ] Next
  - [ ] Svelte
  - [ ] Vue
    - [ ] Nuxt
    - [ ] Vue Peek
    - [ ] Volar
      - [ ] Configure [take-over mode](https://github.com/johnsoncodehk/volar/discussions/471)
  - [ ] Express
  - [ ] Desktop
    - [ ] Electron
    - [ ] Neutrino
  - [ ] Vite
  - [ ] Webpack
- [ ] **Mobile**
  - [ ] React Native
  - [ ] Flutter
  - [ ] Swift
  - [ ] NativeScript Vue
- [x] **PHP**
  - [x] Laravel
- [ ] **Python / [Data Science](https://python.land/data-science) / Academic**
  - [x] R
  - [ ] Academic tools
    - [ ] BibTex Reference Manager
    - [x] [Quarto](https://quarto.org/)
    - [ ] LaTeX support
  - [x] Django
  - [x] Flask
  - [x] Linting
  - [ ] **Embedded**
    - [ ] Micropython (RPi Pico, etc)
- [x] **C/C++**
  - [x] [Debugger](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools) (Intellisense disabled; plus [Test Explorer Adapter/s](https://github.com/hbenl/vscode-test-explorer#c))
  - [x] [Syntax](https://marketplace.visualstudio.com/items?itemName=jeff-hykin.better-cpp-syntax)
  - [x] [CMake](https://marketplace.visualstudio.com/items?itemName=twxs.cmake)
  - [x] [Intellisense](https://marketplace.visualstudio.com/items?itemName=tdennis4496.cmantic) (with [Clangd](https://marketplace.visualstudio.com/items?itemName=llvm-vs-code-extensions.vscode-clangd))
  - [ ] **Embedded**
    - [ ] Arduino
    - [ ] ARM
- [ ] [**C#/.NET**](https://viatsko.github.io/awesome-vscode/#c-asp-net-and-net-core)
  - [ ] [Roslynator](https://marketplace.visualstudio.com/items?itemName=josefpihrt-vscode.roslynator)
  - [ ] **Unity** [^unity]
- [x] **Modern** (aka "Other")
  - [x] Deno
  - [x] Nim
  - [x] Go
  - [x] Rust

[^unity]: Helpful tip about getting Unity plugins working from within VSCodium [can be found here on Reddit](https://www.reddit.com/r/vsCodium/comments/t33sj9/comment/hz8n7ou/?utm_source=share&utm_medium=web2x&context=3). Also some pointers about possible plugins to use.
## Micro

This is installed via Dropbear. I am not currently using any plugins, so there is nothing to do here.

## Vim

I should probably just not. Am I gonna not? 🤷‍♂️

## Other

- [ ] Investigate using [Sonarlint](https://www.sonarsource.com/products/sonarlint/)
