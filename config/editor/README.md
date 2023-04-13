# Editor Config

> In the docs below, *Code* refers to [the open-source project by Microsoft](https://github.com/microsoft/vscode) as well as other projects that are based on the source code of *Code*. This includes desktop variants: *[Visual Studio Code](https://code.visualstudio.com/)* (VS Code) and *[VSCodium](https://vscodium.com/)* (Codium); and browser-based variants: *[GitHub Codespaces](https://github.com/features/codespaces)* and *[OpenVSCode Server](https://github.com/gitpod-io/openvscode-server)*.
>
> Where documentation is relevant to a specific *Code* distribution (i.e. *VSCode* or *VSCodium*, but not both), it will be noted. Otherwise assume the docs refer to all derivatives of *Code*.

I prefer to use Code as my default IDE — with a LOT of extensions — and [Micro](https://micro-edito.github.io/) as my default `$EDITOR`. Sometimes I play with Neo/Vim but less often lately.

## Code

I install both Codium *and* VS Code on any computer I control. This is because if there is ever an issue with Codium, I rarely have the time to immediately fix it and need something I can drop into and keep working right away.

This does mean that I need to spend some time ensuring both editors behave similarly when setting up my dotfiles. That said, Codium is usually pretty rock solid, and I have found alternative ways (read: FOSS extensions 💪 and some hacks 😢) to get 99% feature parity across both editors.

### Getting started

<detail>
<summary>Prequisties:</summary>

For embedded programming:

* [PlatformIO Core (CLI)](https://docs.platformio.org/en/stable/core/installation/index.html)
* Arduino CLI

</detail>

<!-- TODO: This should automatically be handled by Dropbear -->

Install the [Sync Settings](https://github.com/zokugun/vscode-sync-settings) extension by Baptiste Augrain ([@daiyam](https://github.com/daiyam))

<!-- TODO: Does code/codium get installed to the path automatically? -->

```bash
$ codium --install-extension zokugun.sync-settings
# and
$ code --install-extension zokugun.sync-settings
```

***

From within Code, open the command palette and run:

```bash
> Sync Settings: Open the repository settings
```

Edit and save the file with the following:

> **Note**
> Replace `$XDG_DOTFILES` with the local path to this repo as the extension does not expand environment variables

```yaml
# hostname: (optional)
profile: main
repository:
  type: file
  path: $XDG_DOTFILES/config/editor
```

***

Then run this from the command palette:

```bash
> Sync Settings: Download (repository -> user)
```

> **Note**
> You probably want to make a coffee ☕️ after running the last command. You can see logs of what it is doing under the Output tab (Shared).

> **Warning**
> Do not restart the editor from the Monkey Patch notification. It will still be installing more extensions and will automatically restart on its' own.

***

Things to log in to once extensions are installed:

* CodeTime
* GitHub Copilot
* GitHub
* Atlassian
* ChatGPT
* CodeGPT

### Keyboard Shortcuts

I use ^Space as my leader for Tmux and Code. Here are some of my frequently used modal commands:

Todo:

* [ ] Split editor and terminal windows (|_)
* [ ] Switch focus (Alt-Arrow/hjkl)
  * [ ] Editor
  * [ ] Terminal
  * [ ] Outline
  * [ ] Active pane
  * [ ] Bookmarks
* [ ] Reload editor

| Chord | VS Code Command | Tmux Command |
|:------:|:-------:|:-------:|
| <kbd>^Space ^Space</kbd> | Quick open file | Next window |
| <kbd>^Space ^Enter</kbd> | Switch focus between editor and terminal |
| <kbd>^Space A</kbd> |  |
| <kbd>^Space B</kbd> |  |
| <kbd>^Space C</kbd> |  |
| <kbd>^Space D</kbd> |  |
| <kbd>^Space E</kbd> |  |
| <kbd>^Space F</kbd> |  |
| <kbd>^Space G</kbd> |  |
| <kbd>^Space H</kbd> |  |
| <kbd>^Space I</kbd> |  |
| <kbd>^Space J</kbd> |  |
| <kbd>^Space K</kbd> |  |
| <kbd>^Space L</kbd> |  |
| <kbd>^Space M</kbd> |  |
| <kbd>^Space N</kbd> | Fuzzy <strong>[N]</strong>ew file |
| <kbd>^Space O</kbd> |  |
| <kbd>^Space P</kbd> |  |
| <kbd>^Space Q</kbd> |  |
| <kbd>^Space R</kbd> |  | Reload Tmux config |
| <kbd>^Space S</kbd> |  |
| <kbd>^Space T</kbd> |  |
| <kbd>^Space U</kbd> |  |
| <kbd>^Space V</kbd> |  |
| <kbd>^Space W</kbd> |  |
| <kbd>^Space X</kbd> |  |
| <kbd>^Space Y</kbd> |  |
| <kbd>^Space Z</kbd> |  |
| <kbd>^Space Space</kbd> | |
| <kbd>^Space Esc</kbd> | |

> **Note**
> Character keys are also mapped with ctrl as well for mistypes

### Features

* [x] Live share (pair/mob programming support)
* [x] Remote SSH / Container
* [x] Code Pair AI (via [Tabnine](https://www.tabnine.com/)[^pair])
* [x] Synced settings without ties to one cloud provider
* [x] Support for "profiles" based on persona (home vs. work) and workspace languages [^profiles]
* [ ] **Git platforms integration**
  * [x] GitHub
  * [x] Gitlab
  * [x] Atlassian
  * [ ] Gitea
* [ ] **Comprehensive languages support**
  * [ ] Syntax highlighting
  * [ ] [Test integrations](https://github.com/hbenl/vscode-test-explorer#test-adapters)
  * [ ] Integrated debugging
  * [ ] Linting

> Settings and extensions are managed using the [*Sync Settings*](https://open-vsx.org/extension/zokugun/sync-settings) extension. This was chosen over using the built-in sync feature of *VSCode* because the sync feature is unavailable to run on non-Microsoft builds of *Code* and is dependant on *GitHub*.

[^pair]: I may try to replace Tabnine with an open source alternative, but for now I am happy just being able to try something that can be used in various editors.

[^profiles]: More needs to be done on the profiles feature but it is largely workable for now. I need the ability to be able to use several languages together in a workspace.

### Profiles

> 🚧 This is being changed. Possibly looking at using [native profiles](https://code.visualstudio.com/docs/editor/profiles).
>
> Ultimately, profiles will mainly be used to control which extensions are active. Possibly also for demo purposes

Symlink the `./product.json` file to:

* **Windows:** `%APPDATA%\VSCodium\product.json` or `%USERPROFILE%\AppData\Roaming\VSCodium\product.json`
* **macOS:** `~/Library/Application Support/VSCodium/product.json`
* **Linux:** `$XDG_CONFIG_HOME/VSCodium/product.json` or `~/.config/VSCodium/product.json`

### Todo

* [ ] Configure Markdown
  * [x] "Markdown Preview Github Styling" to use dark mode
  * [x] Open in preview instead of edit
  * [ ] Open in edit when viewing diff
* [ ] Create solid keybindings (using <kbd>⌃Space</kbd> as leader)
  * [ ] [Terminal](https://itnext.io/easy-enhancements-for-vs-codes-terminal-6dda2c22ee5c)
* [ ] Differentiate between similar but different subdirectories
  * [ColorTabs](https://marketplace.visualstudio.com/items?itemName=orepor.color-tabs-vscode-ext) is promising, but cannot style anything I have showing. Have submitted a [feature request (#68)](https://github.com/oreporan/color-tabs-vscode/issues/68).
* [ ] Confirm [Flake8/Black working well together](https://sbarnea.com/lint/black/)
* [ ] Get a "true" word count of Markdown documents (reading time is bonus)

**Find extensions for:**

* [x] ~~Emoji in Markdown~~ (Using Espanso instead)
* [ ] Utilities / Dev toolbox
  * [ ] Regex editor/validator
  * [ ] Time conversion
  * Will create these as Powertool scripts/commands
* [ ] Better copy/paste (maybe integrate into OS instead?)
* [x] Todo lists
* [x] Markdown notes in Action bar
* [ ] Dash docs integration
* [ ] [Test Explorer Adapters](https://github.com/hbenl/vscode-test-explorer#test-adapters)
  * [x] Python
  * [ ] Node
  * [x] C++
  * [ ] PHP
  * [ ] Modern languages
* [x] Spell checking (may need to investigate [Spell Right](https://marketplace.visualstudio.com/items?itemName=ban.spellright) if Code Spell Check is too slow)

### Language support

* [x] **Markup Languages** (Part of Lite)
  * [x] HTML
    * [x] CSS3 / Sass
  * [x] **Markdown**
    * [x] Mermaid
    * [x] Footnotes
    * [x] Github theme <!-- Can I change theme based on git platform in current repo? -->
    * [x] Maths
  * [x] MJML
  * [x] Handlebars / Mustache
  * [x] JSON / YAML
  * [x] TOML
* [x] **Data** (Part of Full)
  * [x] SQLite Browser
  * [x] GraphQL
  * [x] [SQL Tools](https://vscode-sqltools.mteixeira.dev/en/home/)
  * [x] Redis
  * [x] [REST Explorer](https://www.thunderclient.com/)
* [ ] **Node / Typescript**
  * [ ] React
    * [ ] Next
  * [ ] Svelte
  * [ ] Vue
    * [ ] Nuxt
    * [ ] Vue Peek
    * [ ] Volar
      * [ ] Configure [take-over mode](https://github.com/johnsoncodehk/volar/discussions/471)
  * [ ] Express
  * [ ] Desktop
    * [ ] Electron
    * [ ] Neutrino
  * [ ] Vite
  * [ ] Webpack
* [ ] **Mobile**
  * [ ] React Native
  * [ ] Flutter
  * [ ] Swift
  * [ ] NativeScript Vue
* [x] **PHP**
  * [x] Laravel
* [ ] **Python / [Data Science](https://python.land/data-science) / Academic**
  * [x] R
  * [ ] Academic tools
    * [ ] BibTex Reference Manager
    * [x] [Quarto](https://quarto.org/)
    * [ ] LaTeX support
  * [x] Django
  * [x] Flask
  * [x] Linting
  * [ ] **Embedded**
    * [ ] Micropython (RPi Pico, etc)
* [x] **C/C++**
  * [x] [Debugger](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools) (Intellisense disabled; plus [Test Explorer Adapter/s](https://github.com/hbenl/vscode-test-explorer#c))
  * [x] [Syntax](https://marketplace.visualstudio.com/items?itemName=jeff-hykin.better-cpp-syntax)
  * [x] [CMake](https://marketplace.visualstudio.com/items?itemName=twxs.cmake)
  * [x] [Intellisense](https://marketplace.visualstudio.com/items?itemName=tdennis4496.cmantic) (with [Clangd](https://marketplace.visualstudio.com/items?itemName=llvm-vs-code-extensions.vscode-clangd))
  * [ ] **Embedded**
    * [ ] Arduino
    * [ ] ARM
* [ ] [**C#/.NET**](https://viatsko.github.io/awesome-vscode/#c-asp-net-and-net-core)
  * [ ] [Roslynator](https://marketplace.visualstudio.com/items?itemName=josefpihrt-vscode.roslynator)
  * [ ] **Unity** [^unity]
* [x] **Modern** (aka "Other")
  * [x] Deno
  * [x] Nim
  * [x] Go
  * [x] Rust

[^unity]: Helpful tip about getting Unity plugins working from within VSCodium [can be found here on Reddit](https://www.reddit.com/r/vsCodium/comments/t33sj9/comment/hz8n7ou/?utm_source=share&utm_medium=web2x&context=3). Also some pointers about possible plugins to use.

## Micro

This is installed via Dropbear. I am not currently using any plugins, so there is nothing to do here.

## Vim

I should probably [just not](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim). Am I gonna not? 🤷‍♂️

## Other

* [ ] Investigate using [Sonarlint](https://www.sonarsource.com/products/sonarlint/)
