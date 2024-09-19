# fedora-dev-machine-setup | Fedora Workstation 40

## Description

This repo contains Ansible playbooks to configure your system as a development machine upon a clean install.

The playbooks have been tested on:

- **Fedora Workstation 40**

---

## What gets installed and cofigured?

I am a DevSecOps Engineer and my daily job include working with AWS, docker, ansible, terraform, etc. So if you are in a similar profession the installed system will suit your needs. It is also easy to extend using Ansible roles.

Summary of packages that get installed and configured based on roles:

- **role: base**
  - set default system editor to vim instead of nano
  - enable firewalld firewall
  - tune system swappiness so that swapping is greatly reduced
  - upgrade all packages
  - install archiving tools like zip, rar, etc
  - install libreoffice
  - install foliate, an e-book reader
  - install glow, apostrophe and Obsidian markdown viewers/editors
  - install power management tools like [TLP](https://github.com/linrunner/TLP)
  - install development related packages like android-tools, awscli, httpie, clusterssh, docker, filezilla, golang, poetry, etc
  - install code fomatters and linters like black, ruff, ansible-lint, etc
  - setup golang directories
  - install download tools like axel, transmission, wget, aria2
  - install image, audio and video packages like vlc, totem, gimp, imagemagick, etc
  - install and configure ssh server if not set to `laptop_mode`
  - option to turn on night light settings for eye comfort (set `base_permanent_night_light.night_light_enabled` to `True`)
  - enable `fzf` fuzzy finder in zsh terminal
  - install [lazygit](https://github.com/jesseduffield/lazygit)
  - install terminal emulators Tilix and Alacritty
  - install dive, a tool for exploring each layer in a docker image
- **role: zsh**
  - install zsh package and set user shell to zsh
  - install antigen zsh plugin manager
  - copy and enable sample `~/.zshrc` file if one does not exist
    - contains function to stop ssh-agent from asking for encrypted ssh key password repeatedly when launching new terminal
    - adds additional shell aliases and functions in `~/.shell_aliases` and `~/.shell_functions`
  - install ohmyzsh/ohmyzsh and enable some bundled plugins
  - enable bullet train zsh theme (others like p10k can be configured as well)
- **role: terminal_customizations**
  - download and install some nerd fonts from ryanoasis/nerd-fonts; these are mono fonts ideal for use in terminal or programming editors
  - copy and enable sample tilix config file with configured nerd font
  - copy and enable sample tmux config file if one does not exist
  - copy and enable sample `~/.tmux.conf` file with [tmux plugin manager](https://github.com/tmux-plugins/tpm) and several tmux plugins
    - open Tilix terminal and run `tmux` command, or enable custom command option in Tilix
    - edit `~/.tmux.conf` if necessary
- **role: neovim**
  - install neovim packages
  - install [lazyvim](https://www.lazyvim.org) neovim distribution
    - open `nvim` from terminal and let the plugins get installed automatically on the initial launch
- **role: vscode**
  - add Visual Studio Code apt repo
  - install Visual Studio Code
  - install some popular Visual Studio Code extensions
- **role: privacy**
  - install tor
  - configure tor to run at boot and prevent using certain countries as exit nodes
    - edit `/etc/tor/torrc` if necessary
  - install proxychains
  - configure proxychains to use tor. View [my Medium story](https://fazlearefin.medium.com/tunneling-traffic-over-tor-network-using-proxychains-34c77ec32c0f) to see how to use it
    - edit `/etc/proxychains.conf` if necessary
  - install metadata anonymization toolkit
- **role: security**
  - install ClamAV (antivirus) and ClamAV GNOME interface. Manual scan from nautilus or from CLI using `clamscan`; clamd not installed for its huge memory footprint
  - install firejail for sanboxing applications
- **role: virtualization**
  - enable docker ce repo and install docker packages
  - enable Oracle VirtualBox repo and install virtualbox packages
- **role: hashicorp**
  - install vagrant, terraform, packer
- **role: googlechrome**
  - add Google Chrome apt repo
  - install Google Chrome

---

## Step 0 | Pre-requisites for running the ansible playbooks

On the system which you are going to setup using Ansible, perform these steps.

You need to install `ansible` and `git` before running the playbooks.

```bash
/usr/bin/sudo dnf update -y
/usr/bin/sudo dnf install ansible git -y
```

```bash
git clone https://github.com/fazlearefin/fedora-dev-machine-setup.git
cd fedora-dev-machine-setup
```

## Step 1 | Running the playbooks to configure your system

**Invoke the following as yourself, the primary user of the system. Do not run as `root`.**

```bash
ansible-playbook main.yml -vv -e "{ laptop_mode: True }" -e "local_username=$(id -un)" -K
```

Enter the sudo password when asked for `BECOME password:`.

The `main.yml` playbook will take anything from 15 minutes to an hour to complete.

After all is done, give your laptop a new life by rebooting.

> ### What is this `laptop_mode`?

#### Setting this to `True`

- will install some packages like [TLP](https://github.com/linrunner/TLP) for battery economy

#### Setting this to `False`

- will NOT install some packages like [TLP](https://github.com/linrunner/TLP) for battery economy

---

## Known Issues

- If the ansible playbook halts after completing a few tasks, simply run the playbook again. Since most of the tasks are idempotent, running the playbook multiple times won't break anything.
- If your terminal shows any weird characters because of installing one of the zsh themes, simply change the font to a suitable Nerd Font from the terminal's settings.
- If you do not like the fuzzy finder completions in your terminal, remove or comment out the `#fzf` lines in your `~/.zshrc` (this is not a known issue but a feature)
- When launching the terminal, having some [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) plugins like **docker** enabled results in the error: `tee: <snip> No such file or directory`. You can easily fix this by creating the missing directory manually: `mkdir -p ~/.antigen/bundles/robbyrussell/oh-my-zsh/cache/completions`.

---

## Pull Requests and Forks

You are more than welcome to send any pull requests. However, the intention of this repo is to suit my development needs. So it might be better if you *fork* this repo instead for your own needs and personalization.

---

## Donations

If you think my work helped you in some way saving you time and effort, I am happy to receive any amount of donation. However, the code in this repo is completely free; absolutely *no strings attached*.

Bitcoin (BTC): `bc1qzlhpm94vtk2ht67etdutzcy2g5an5v6g36tp0m`
