# Jaapie&rsquo;s Dotfiles
---------------
## Important Stuff
*    Vim: .vimrc and .vim folder

    My .vimrc file is a conglomeration of a lot of little tips and tricks that
    I found from many others&rsquo; .vimrcs. Thank you for making my
    &lsquo;vimitiation&rsquo; a little easier. I have a number of plugins that
    I include as git submodules. This is something new I learnt about git
    which I think is awesome. Hopefully it makes it easier to keep my plugins
    up-to-date.

*    Bash: .bash_profile/.bashrc

    I recently updated these files so that .bash_profile sources .bashrc. I
    did this so that I can clone this repo onto my linux machine and have it
    just work. The file is also a comglomeration of bits and pieces I&rsquo;ve
    found on the &rsquo;net. I have a minimal prompt consisting of username,
    current directory, and git branch (if applicable).

    I recently stumbled upon
    [this](https://github.com/pengwynn/dotfiles/commit/82c1be26f65193c7799775dc0cf14e13694ce701)
    via Twitter, and thought it was awesome enough to include in my .bashrc.
    So far, I&rsquo;ve include the g function from
    [pengwynn](https://github.com/pengwynn), the o function from
    [porada](https://github.com/porada) and a couple of my own:

    * pud: a power alias for pushd
    * up: takes an integer argument for the number of directory levels you
      want to go up, for example: if you are in `/Users/Jake/dev/dotfiles`,
      `up 3` will take you to `/Users`, just like typing `cd ../../../`

*    Install script

    I include a simple install script that simply links any file/directory
    prepended by an underscore into your $HOME directory. Before actually
    linking it replaces the underscore with a dot, thereby making it a
    dotfile.

## Not So Important Stuff
*    .ackrc: basic file to colourise the output of ack

## Copying
Please feel free to copy whatever you want&mdash;I did.

&mdash;Jacob Degeling (jaapie)
