{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "kamilkoziol";
  home.homeDirectory = "/Users/kamilkoziol";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
  	pkgs.hello
  ];

  programs.zsh = {
    enable = true;
    shellAliases = {
        switch = "darwin-rebuild switch --flake ~/.dotfiles";
    };
};

  programs.git = {
    enable = true;
    userName = "Kamil Kozioł";
    userEmail = "koziol.kamil@protonmail.com";
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
      ".config/alacritty.toml".source = ./.config/alacritty.toml;
      ".config/starship.toml".source = ./.config/starship.toml;
      ".config/lazygit/config.yml".source = ./.config/lazygit/config.yml;
      ".tmux.conf".source = ./.tmux.conf;
      ".zshrc".source = ./.zshrc;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
