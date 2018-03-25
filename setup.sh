#!/bin/bash

set -e

install_cmdline() {
    echo "Installing command line tools..."
    if [[ -z $(xcode-select -p) ]]; then
        xcode-select --install
        echo "Press return when the installation of the command line tools is complete"
        read
    fi
}

export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

install_homebrew() {
    echo "Installing homebrew..."
    if ! which brew >/dev/null 2>&1; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
}

install_dotfiles() {
    if [[ ! -d $HOME/Preferences ]]; then
        git clone git@github.com:piger/Preferences.git $HOME/Preferences
    fi
}

cat <<EOF
+-----------------------------------------------------------------------------------------+
| This script will install some basic software packages: command line tools, virtualenv,  |
| homebrew and then will create a virtualenv for Ansible.                                 |
|                                                                                         |
| Interrupt now pressing CTRL-c or press Enter to proceed.                                |
+-----------------------------------------------------------------------------------------+
EOF
read

umask 022

install_cmdline
install_homebrew
install_dotfiles
echo "Running Ansible to complete the installation..."
ansible-playbook runbook.yml
