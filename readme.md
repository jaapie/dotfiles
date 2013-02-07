# Jaapie&rsquo;s Dotfiles
---
## Important Stuff
*	Vim: .vimrc and .vim folder

	My .vimrc file is a conglomeration of a lot of little tips and tricks that I found from many others&rsquo; .vimrcs. Thank you for making my &lsquo;vimitiation&rsquo; a little easier. I have a number of plugins that I include as git submodules. This is something new I learnt about git which I think is awesome. Hopefully it makes it easier to keep my plugins up-to-date.

*	Bash: .bash_profile/.bashrc

	I recently updated these files so that .bash_profile sources .bashrc. I did this so that I can clone this repo onto my linux machine and have it just work.The file is also a comglomeration of bits and pieces I&rsquo;ve found on the &rsquo;net. I have a minimal prompt consisting of username, current directory, and git branch (if applicable).

* 	Mac OS X sensible defaults script: Gratuitously stolen from @mathiasbynens

	I have commented out most stuff as I didn&rsquo;t like what it did.

*	Install script

	I include a simple install script that simply links any file/directory prepended by an underscore into your $HOME directory. Before actually linking it replaces the underscore with a dot, thereby making it a dotfile.

## Not So Important Stuff
*	.ackrc: basic file to colourise the output of ack

## Copying
Please feel free to copy whatever you want&emdash;I did.

&mdash;Jacob Degeling (jaapie)
