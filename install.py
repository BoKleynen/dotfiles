#!/usr/bin/env python3

import os
import platform
from os.path import expanduser, join, dirname, realpath

home_links = {
    ".ghcup/config.yaml": "ghcup/config.yaml",
    ".ghcup/config.yaml": "ghcup/config.yaml",
    ".asdfrc": "link/.asdfrc",
    ".editorconfig": "link/.editorconfig",
    ".gitconfig": "link/.gitconfig",
    ".gitignore": "link/.gitignore",
    ".tool-versions": "link/.tool-versions",
    ".zshrc": "zsh/.zshrc",
    ".zshenv": "zsh/.zshenv",
}

macos_links = {
    ".cargo/config.toml": "cargo/config-linux.toml",
}

linux_links = {
    ".cargo/config.toml": "cargo/config-osx.toml",
}

home = expanduser("~")
dotfiles = dirname(realpath(__file__))

for dst, src in home_links.items():
    try:
        os.symlink(join(dotfiles, src), join(home, dst))
    except:
        os.remove(join(home, dst))


if platform.system() == "Darwin":
    for dst, src in macos_links.items():
        try:
            os.symlink(join(dotfiles, src), join(home, dst))
        except:
            os.remove(join(home, dst))

if platform.system() == "linux":
    for dst, src in linux_links.items():
        try:
            os.symlink(join(dotfiles, src), join(home, dst))
        except:
            os.remove(join(home, dst))
