{
    description = "Kamil's Darwin system flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        nix-darwin = {
            url = "github:LnL7/nix-darwin";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager }:
        let
        configuration = { pkgs, config, ... }: {
# List packages installed in system profile. To search by name, run:
# $ nix-env -qaP | grep wget
            environment.systemPackages = [ 
                pkgs.neovim
                pkgs.tmux
                pkgs.alacritty
                pkgs.mkalias
                pkgs.colima
                pkgs.jq
                pkgs.btop
                pkgs.neofetch
                pkgs.eza
                pkgs.ripgrep
                pkgs.ffmpeg
                pkgs.discord
                pkgs.fzf
                pkgs.nodejs_20
                pkgs.go
                pkgs.zoxide
                pkgs.starship
                pkgs.oh-my-zsh
                pkgs.rustup
                pkgs.lazygit
            ];

            home-manager.backupFileExtension = "backup";
            nix.configureBuildUsers = true;
            nix.useDaemon = true;

            homebrew = {
                enable = true;
                casks = [
                    "brave-browser"
                        "the-unarchiver"
                ];
                onActivation.cleanup = "zap";
            };

            fonts.packages = [
                (pkgs.nerdfonts.override { fonts = ["JetBrainsMono"]; })
            ];

            system.defaults = {
                finder.FXPreferredViewStyle = "clmv";
                loginwindow.GuestEnabled = false;
                NSGlobalDomain.KeyRepeat = 2;
                NSGlobalDomain.InitialKeyRepeat = 15;
                NSGlobalDomain.ApplePressAndHoldEnabled = false;
                dock = {
                    orientation = "left";
                };
            };

            system.keyboard = {
                enableKeyMapping = true;
                remapCapsLockToEscape = true;
            };

            system.activationScripts.applications.text = let
                env = pkgs.buildEnv {
                    name = "system-applications";
                    paths = config.environment.systemPackages;
                    pathsToLink = "/Applications";
                };
            in
                pkgs.lib.mkForce ''
# Set up applications.
                echo "setting up /Applications..." >&2
                rm -rf /Applications/Nix\ Apps
                mkdir -p /Applications/Nix\ Apps
                find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
                while read -r src; do
                    app_name=$(basename "$src")
                        echo "copying $src" >&2
                        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
                        done
                        '';

# Auto upgrade nix package and the daemon service.
            services.nix-daemon.enable = true;
# nix.package = pkgs.nix;

# Necessary for using flakes on this system.
            nix.settings.experimental-features = "nix-command flakes";

# Create /etc/zshrc that loads the nix-darwin environment.
            programs.zsh.enable = true;  # default shell on catalina

# Set Git commit hash for darwin-version.
                system.configurationRevision = self.rev or self.dirtyRev or null;

# Used for backwards compatibility, please read the changelog before changing.
# $ darwin-rebuild changelog
            system.stateVersion = 5;

# The platform the configuration will be used on.
            nixpkgs.hostPlatform = "x86_64-darwin";
            nixpkgs.config.allowUnfree = true;


            users.users.kamilkoziol = {
                name = "kamilkoziol";
                home = "/Users/kamilkoziol";
            };
        };
    in
    {
# Build darwin flake using:
# $ darwin-rebuild build --flake .#Kamils-MacBook-Pro
        darwinConfigurations."Kamils-MacBook-Pro" = nix-darwin.lib.darwinSystem {
            modules = [ 
                configuration 
                nix-homebrew.darwinModules.nix-homebrew
                {
                    nix-homebrew = {
                        enable = true;
                        user = "kamilkoziol";
                    };
                }
            home-manager.darwinModules.home-manager {
                home-manager = {
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    users.kamilkoziol = import ./home.nix;
                };
            }
            ];
        };


# Expose the package set, including overlays, for convenience.
        darwinPackages = self.darwinConfigurations."Kamils-MacBook-Pro".pkgs;
    };
}
