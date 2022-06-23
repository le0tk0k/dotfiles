.PHONY: color
color:
	awk 'BEGIN{s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;for (colnum = 0; colnum<77; colnum++) {r = 255-(colnum*255/76);g = (colnum*510/76);b = (colnum*255/76);if (g>255) g = 510-g;printf "\033[48;2;%d;%d;%dm", r,g,b;printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;printf "%s\033[0m", substr(s,colnum+1,1);}printf "\n";}'

.PHONY: link
link:
	ln -snfv ~/dotfiles/config/tmux/tmux.conf ~/.config/tmux/tmux.conf
	ln -snfv ~/dotfiles/config/starship/starship.toml ~/.config/starship.toml
