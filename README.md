# dots-nordic

My configuration files to use with i3+picom, using the Nord color palate.



NOTE: The ´Configurations´ folder assumes you have 

´XDG_CONFIG_HOME=$HOME/Configurations´

in a shell script in ´/etc/profile.d/´, if not, either symlink it with ´$HOME/.config´ or just rename it.



For the zshrc to be loaded properly, you should add ´ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"´ to ´/etc/zsh/zshrc´
(sometimes placess in ´/etc/zshrc´). Also note that it requires certian files and folers to exist. I recommend
cloing oh-my-zsh into ´$HOME/.zsh´.
