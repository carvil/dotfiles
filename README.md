# Dotfiles

Some of my dotfiles, zsh themes and fonts.

## Installation

In order to install the dotfiles, run:

    curl -L https://raw.github.com/carvil/dotfiles/master/bootstrap.sh | sh

in your terminal. This will:

- clone this repo;
- symlink all dotfiles (moving existing ones to `/tmp/`);
- clone vundle;
- bundle install vim add-ons.
