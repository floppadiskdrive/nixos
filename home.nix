{ config, pkgs, inputs, ... }:
let 
	dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
	create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
	configs = {
		nvim = "nvim";
		alacritty = "alacritty";
    waybar = "waybar";
	};
in
{
	home.username = "floppadisk";
	home.homeDirectory = "/home/floppadisk";
  programs.git = {
    enable = true;
    settings = {
      user = {
        name  = "floppadisk";
        email = "oscar.ishii@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
  programs.waybar.enable = true;
  programs.firefox.enable = true;
	home.stateVersion = "25.11";

	#xdg.configFile = builtins.mapAttrs ( name: subpath: {
	#	source = create_symlink "${dotfiles}/${subpath}";
	#	recursive = true;
	#}) configs;

	home.packages = with pkgs; [
    alacritty
    fuzzel
    brave
    gnome-calendar
    vesktop
    fzf
    zoxide
    btop
    mpv
    gimp
		neovim
		ripgrep
		nixpkgs-fmt
		lf
		spotify
		adwaita-icon-theme
    bibata-cursors
    pavucontrol
    fastfetch
    prismlauncher
    gnupg
    nautilus
    playerctl
    loupe
    gnome-calculator
    decibels
    papers
    wbg
    mangohud
    libreoffice-qt
    hunspell
	hunspellDicts.sv_SE
	hunspellDicts.en_GB-large
    brightnessctl
    usbutils
    geekbench
    lshw
	wev	
	cheese
	kdePackages.kamoso
	webcamoid
	kdePackages.kleopatra
	tor-browser
	localsend
	];
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
