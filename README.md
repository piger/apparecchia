# apparecchia

Quick and dirty provisioning script for a basic system administrator workstation.

## Usage

Just run `./setup.sh` and follow the on screen instructions; `sudo` will ask for your password to install Homebrew.
If something goes wrong you can re-run this script as many times as you need.

### LastPass

    brew cask install lastpass
    open '/usr/local/Caskroom/lastpass/latest/LastPass Installer/LastPass Installer.app'

### rbenv

It needs to run `rbenv init` or no dice.
