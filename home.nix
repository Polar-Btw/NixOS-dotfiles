{ config, pkgs, ...}:
{
	# basic settings
	home.username = "aryu";
	home.homeDirectory = "/home/aryu";
	home.stateVersion = "26.05";

	programs.bash = {
  	enable = true;

  	shellAliases = {
		nrs= "sudo nixos-rebuild switch --flake ~/Documents/nixos-dotfiles-kde";
  		anime = "ani-cli -v";
  		ls = "tree";
		sync = "sudo nix flake update --flake ~/Documents/nixos-dotfiles-kde";
		vi = "nvim";
	};

  	# bash prompt
	initExtra = ''
    	export PS1='\n\[\e[97;1m\]┌──(\[\e[38;5;117m\]\u\[\e[97m\]@\[\e[38;5;117m\]\h\[\e[97m\])\[\e[97m\]-\[\e[97m\][\[\e[38;5;225m\]\w\[\e[97m\]]\n\[\e[97m\]└─\[\e[38;5;225m\]\\$\[\e[0m\] '  	
		'';
	};

	programs.kitty = {
  		enable = true;

  		# Typography
  		font = {
    		name = "JetBrainsMono Nerd Font";
    		size = 12;
  		};

 		 # Theme, Visuals, and Core Window Settings
  		settings = {
		
		# --- Theme (Tokyo Night) ---
		foreground = "#c0caf5";
		background = "#1a1b26";
		selection_background = "#283457";
		selection_foreground = "#c0caf5";
		url_color = "#73daca";
		cursor = "#c0caf5";
		cursor_text_color = "#1a1b26";

		# Tabs
		active_tab_background = "#7aa2f7";
		active_tab_foreground = "#16161e";
		inactive_tab_background = "#292e42";
		inactive_tab_foreground = "#545c7e";
		tab_bar_background = "#15161e";

		# Windows border colors
		active_border_color = "#7aa2f7";
		inactive_border_color = "#292e42";

		# normal colors
		color0 = "#15161e";
		color1 = "#f7768e";
		color2 = "#9ece6a";
		color3 = "#e0af68";
		color4 = "#7aa2f7";
		color5 = "#bb9af7";
		color6 = "#7dcfff";
		color7 = "#a9b1d6";

		# bright colors
		color8 = "#414868";
		color9 = "#f7768e";
		color10 = "#9ece6a";
		color11 = "#e0af68";
		color12 = "#7aa2f7";
		color13 = "#bb9af7";
		color14 = "#7dcfff";
		color15 = "#c0caf5";

		# extended colors
		color16 = "#ff9e64";
		color17 = "#db4b4b";

		# --- Eye Candy ---
		background_opacity = "0.85";
		background_blur = 1;

		# Cursor Trail
		cursor_trail = 1;
		cursor_trail_decay = "0.1 0.4";
		cursor_trail_start_threshold = 2;

		# --- Window Settings ---
		confirm_os_window_close = 0;
		};
	};

# make custom logo
home.file.".config/fastfetch/custom_logo.txt".text = ''

           __        ____      __
          /  \       \   \    /  \
          \   \       \   \  /   /
           \   \       \   \/   /
      ______\   \______ \      /
     /                 \ \    /     /\
    /_______    ________\ \   \    /  \
           /   /           \   \  /   /
          /   /             \  / /   /
 ________/   /               \/ /   /_____
/           /                  /          \
\______    /                  /   ________/
      /   / /\               /   /
     /   / /  \             /   /
    /   /  \   \  _________/   /______
    \  /    \   \ \                  /
     \/     /    \ \______    ______/
           /      \       \   \
          /   /\   \       \   \
         /   /  \   \       \   \
         \__/    \___\       \__/
'';

	# Fastfetch settings
	programs.fastfetch = {
    		enable = true;
		settings = {
			logo = {
				source = "~/.config/fastfetch/custom_logo.txt";
				padding = { right = 3; };
			};
			display = {
				size = { binaryPrefix = "si"; };
				color = "blue";
				separator = "  ";
				};
			modules = [
			"os"
			"kernel"
			"packages"
			"de"
			"wm"
			"terminalfont"
			"uptime"
			"shell"
			"cpu"
			"gpu"
			"memory"
			"disk"
			"weather"
			{ type = "datetime"; key = "Date"; format = "{1}-{3}-{11}"; }
			{ type = "datetime"; key = "Time"; format = "{14}:{17}:{20}"; }
			"break"
			"colors"
      		];
    	};
    };
}
