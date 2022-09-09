<br /><br /><br /><div align="center">

<img alt="binaryben's dotfiles" src="./static/logo.png" height="100" />

<h1>&nbsp;</h1><br />

![ISC License](https://img.shields.io/badge/license-ISC-green?style=for-the-badge) &nbsp; ![Project Status](https://img.shields.io/badge/status-🚧%20WIP-yellow?style=for-the-badge)

<strong>It is said that you are your dotfiles. Ergo, this is me. Welcome, make yourself at <code>::1</code>.</strong><br />
<sub>A very opinionated and modern take on `~/.files`. Aimed at creating a personalised standard experience across supported systems. Drop into a similar experience across desktops and servers (for container-based and remote development workflows mainly). Build your own dotfiles using all of the custom coded modules, or take only what you need.</sub>

<br />

![Demo placeholder](https://raw.githubusercontent.com/andreasbm/readme/master/assets/demo.gif)

</div>

* 🦸‍♂️ &nbsp; **Superpowered DX** - bespoke git ( [gud](//github.com/binaryben/gud) ) and tmux ( [tux](//github.com/binaryben/tux) ) modules supercharge the development experience
* 🐝 &nbsp; **Lightweight Prompt** - powerline inspired segments (beeline; currently written in Bash, may move to Nim)
* ☁ &nbsp; **Distributed files** - Support for Resilio synced drive
* ⚙️ &nbsp; **Synced preferences** - Makes the dock and menu bar hide on every macOS computer with ease
* 🔀 &nbsp; **Cross platform** - Software is installed via Dropbear, a meta-package manager
* 🧑‍💻 &nbsp; **Modern tools** - Contemporary (faster, prettier, more intuitive) alternatives used in interactive shells
* ⏪ &nbsp; **Graceful fallbacks** - Zsh, Nerd Fonts or other modern tooling unavailable? No problem!

## Quick start

Once a machine has it's OS installed and your user configured, run the command below to get up and running as fast as possible.

> ⚠️ This is not ready and does not work. DO NOT try to run this.

```
$ curl https://dotfiles.bnry.be/bootstrap | sh
```

<details>
<summary>📖 Table of contents</summary>

<br />

![Divider](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/solar.png)

## Table of Contents

* ➤ [**Quick start**](#)
* ➤ [**Philosophy**](#)

</details>

![Divider](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/solar.png)

## Todo

### CLI Software
- [ ] ssh
- [ ] ssl? hostnames?

### Install Libraries

- [ ] Drivers
- [ ] Desktop Backgrounds
- [ ] Fonts
  - [ ] Nerdfonts
  - [ ] Brands
  - [ ] Libre
  - [ ] Personal
  - [ ] Commercial
- [ ] Logos

[List of CLI apps to trawl through in bed or whenever](https://github.com/toolleeo/cli-apps)

![Divider](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/solar.png)

## 🛟 Supported Systems

Alpine - default container OS and used in iSH on iOS devices
Debian - default server OS
Windows (mainly via RDI) - gaming mainly, some creative software is Windows only
macOS - default OS for professional work


![Divider](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/solar.png)

## ✨ Modernise the Terminal

It is the 21st Century. We have [better ways of doing things](https://github.com/ibraheemdev/modern-unix) now. Let's use them!

Most of these are installed via my Dropbear "droppings", however many are configured in this repo. Where it makes sense, the ~~legacy~~ POSIX commands have been aliased to use the modern equivilants instead, but only in interactive shells.

* Bat
* LSD
* Delta
* dust
* duf
* broot? (or LSD tree?)
* fd
* ripgrep

![Divider](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/solar.png)

## ✨ Make the Terminal Convenient

* Auto environment variables
* Auto python environments
* fzf everywhere
* Navigate at the speed of thoughts
  * [autojump](https://github.com/wting/autojump) or z or [zoxide](https://github.com/ajeetdsouza/zoxide)
* Get help
  * [howdoi](https://github.com/gleitz/howdoi)
  * tldr++

![Divider](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/solar.png)

## 🦸‍♂️ Install Superpowers!

### Git

### Docker

* https://github.com/unixorn/docker-helpers.zshplugin
* https://github.com/sroze/docker-compose-zsh-plugin/blob/master/docker-compose.plugin.zsh
* https://github.com/webyneter/docker-aliases/blob/master/docker-aliases.plugin.zsh

### Tmux

* https://github.com/ChrisPenner/session-sauce


Original dotfiles [logo](https://github.com/jglovier/dotfiles-logo) by [Joel Glovier](https://github.com/jglovier). Remixed with gratitude under the [MIT Licence](https://github.com/jglovier/dotfiles-logo/blob/main/LICENSE).
