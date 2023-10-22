# { config, pkgs, ...}: let
#   inherit (pkgs.stdenv.hostPlatform) isLinux;
# in {
{ config, pkgs, ...}:

{

  nixpkgs.config.allowUnfree = true;

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      # anurati
      fira-code
      fira-code-symbols
      (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
      # pkgs.nur.repos.nekowinston.apple-sf-mono
    ];
    fontconfig = {
      defaultFonts = {
        # serif = [ "SF Serif" ];
        # sansSerif = [ "SF Serif" ];
        # monospace = [ "SF Mono" ];
        serif = [ "Fira Code" ];
        sansSerif = [ "Fira Code" ];
        monospace = [ "Fira Code" ];
      };
    };
  };

  users.defaultUserShell = pkgs.dash;

  environment.sessionVariables = rec {
    GTK_THEME="Adwaita:dark";

    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_STATE_HOME  = "$HOME/.local/state";

    # Not officially in the specification
    XDG_BIN_HOME    = "$HOME/.local/bin";
    PATH = [
      "${XDG_BIN_HOME}"
    ];
  };

  users.users.ruzo = {
    isNormalUser = true;
    shell = pkgs.yash;

    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "video"
      "audio"
      "networkmanager"
      "libvirtd"
      # "docker" "lxd" # Allow access to the sockets without root
    ];

    packages = with pkgs; [
      xdg-utils
      xdg-user-dirs

      # general
      man
      curl
      git
      unzip
      btop                   # system monitor
      sshfs                  # mount dirs through ssh
      helvum                 # control connections between audio inputs and outputs
      pavucontrol            # pulse audio volume control
      wezterm                # terminal emulator
      tor-browser-bundle-bin # tor

      # workspace
      aerc            # mail
      neovim          # text editor
      unstable.vscode # text editor
      ripgrep         # finder
      keepassxc       # password manager
      mpv             # image and video
      obs-studio      # video-audio recorder
      zathura         # document viewer
      pandoc          # document converter
      imagemagick     # image editor
      libreoffice     # office
      mat2            # clean metadata
      # gpt4all     # run data models locally

      # tools
      gcc

      # games
      prismlauncher

      # web apps
      brave
      (pkgs.chromium.override {
        commandLineArgs = [
          "--disk-cache=$XDG_RUNTIME_DIR/chromium-cache"
          "--no-default-browser-check"
          "--no-service-autorun"
          "--disable-features=PreloadMediaEngagementData,MediaEngagementBypassAutoplayPolicies"
          # Autoplay policy
          "--document-user-activation-required"
          # Enable Wayland support
          "--enable-features=UseOzonePlatform"
          "--ozone-platform-hint=auto"
          # Disable global Google login
          "--disable-sync-preferences"
          # Reader mode
          "--enable-reader-mode"
          "--enable-dom-distiller"
          # Dark mode
          "--enable-features=WebUIDarkMode"
          # Security stuff
          "--disable-reading-from-canvas"
          "--no-pings"
          "--no-first-run"
          "--no-experiments"
          "--no-crash-upload"
          # Chromecast
          "--load-media-router-component-extension"
          # GPU stuff
          "--ignore-gpu-blocklist"
          "--enable-gpu-rasterization"
          #"--use-gl=egl"
          "--enable-zero-copy"
          # Accelerated decoding
          "--enable-features=VaapiVideoDecoder"

          "--disable-wake-on-wifi"
          "--disable-breakpad"
          "--disable-sync"
          "--disable-speech-api"
          "--disable-speech-synthesis-api"
        ];
      })

    ];

  };

  programs = {
    gnupg.agent.enable = true;
    noisetorch.enable = true;
    steam = {
      enable = true;
      # remotePlay.openFirewall = true;      # Open ports in the firewall for Steam Remote Play
      # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
    chromium = {
      enable = true;
      extensions = [
        "olhelnoplefjdmncknfphenjclimckaf" # Theme Catppuccin Frappe
        # "fjofdcgahcnlkdjapcbeonbnmjdnfcki" # Theme gruvbox
        # "njcgdakjdifgccdgnoiphpnihcfopcmj" # Theme devtools gruvbox
        # "bkdgflcldnnnapblkhphbgpggdiikppg" # DuckDuckGo
        "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # Ublock Origin
        "edibdbjcniadpccecjdfdjjppcpchdlm" # I still dont care about cookies
        "ldpochfccmkkmhdbclfhpagapcfdljkj" # Decentraleyes
        "lckanjgmijmafbedllaakclkaicjfmnk" # Clear urls
        "oldceeleldhonbafppcapldpdifcinji" # Grammar checker
        "hfjbmagddngcpeloejdejnfgbamkjaeg" # Vimium C
        "hlepfoohegkhhmjieoechaddaejaokhf" # Refined Github
        "kajibbejlbohfaggdiogboambcijhkke" # Mailvelope
        "hbplgmpfdabobhnadbfpknppljdfkiia" # SimpleDiscordCrypt
      ];
      # Enterprise policy list: https://chromeenterprise.google/policies/
      # chrome://policy shows applied policies and syntax errors.
      extraOpts = {
        "HomepageLocation" = "https://start.duckduckgo.com";
        "DefaultSearchProviderSearchURL" = "https://duckduckgo.com/?q={searchTerms}";
        "OsColorMode" = "dark";
        "PasswordManagerEnabled" = false;
        "BrowserSignin" = 0;
        "SyncDisabled" = true;
        "HardwareAccelerationModeEnabled" = true;
      };
    };
  };

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;
    # forceWayland = true;
    policies = {
      PasswordManagerEnabled = false;
      DisableFirefoxAccounts = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemtry = true;
      DisplayBookmarksToolbar = "never";
      NoDefaultBookmarks = true;
      SearchSuggestEnabled = true;
      HardwareAcceleration = true;
      SanitizeOnShutdown = {
        Cache = false;
        Cookies = false;
        Downloads = true;
        FormData = false;
        History = true;
        Sessions = false;
        SiteSettings = false;
        OfflineApps = false;
        Locked = false;
      };
      SearchEngines = {
        Default = "DuckDuckGo";
        DefaultPrivate = "DuckDuckGo";
        Force = true;
        PreventInstalls = false;
      };
      FirefoxHome = {
        Search = false;
        Pocket = false;
        Snippets = false;
        TopSites = false;
        Highlights = false;
      };
      # Homepage = {
      #   URL = "https://duckduckgo.com";
      #   Locked = true;
      # };
      DefaultDownloadDirectory = "$\{home\}/Downloads";
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      Preferences = {
        browser.theme.content-theme = 0;
        browser.compactmode.show = true;
        browser.uidensity = 1;
        toolkit.legacyUserProfileCustomizations.stylesheets = true;
        extensions.activeThemeID = "{5ee380f7-abda-467c-ae9a-d30bf8f0d1d6}";
      };
      ExtensionSettings = {
        # gruvbox
        # "{d3f8e52b-140d-41e8-ae4a-a9710ab6a886}" = {
        #   allowed_types = "theme";
        #   installation_mode = "force_installed";
        #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/gruvbox-true-dark/latest.xpi";
        # };
        # catppuccin
        "{5ee380f7-abda-467c-ae9a-d30bf8f0d1d6}" = {
          allowed_types = "theme";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/catppuccin-frappe-lavender/latest.xpi";
        };
        # ublock
        "uBlock0@raymondhill.net" = {
          allowed_types = "extension";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };
        # clearurls
        "{74145f27-f039-47ce-a470-a662b129930a}" = {
          allowed_types = "extension";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
        };
        # dark reader
        "addon@darkreader.org" = {
          allowed_types = "extension";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
        };
        # decentraleyes
        "jid1-BoFifL9Vbdl2zQ@jetpack" = {
          allowed_types = "extension";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/decentraleyes/latest.xpi";
        };
        # i still dont care about cookies
        "idcac-pub@guus.ninja" = {
          allowed_types = "extension";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/istilldontcareaboutcookies/latest.xpi";
        };
        # multi-account-containers
        "@testpilot-containers" = {
          allowed_types = "extension";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/multi-account-containers/latest.xpi";
        };
        # temporary-containers
        "{c607c8df-14a7-4f28-894f-29e8722976af}" = {
          allowed_types = "extension";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/temporary-containers/latest.xpi";
        };
        # tampermonkey
        "firefox@tampermonkey.net" = {
          allowed_types = "extension";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/tampermonkey/latest.xpi";
        };
        # # tab-volume
        # "{a8e99fca-eb8f-410f-84e9-142eb055c162}" = {
        #   allowed_types = "extension";
        #   installation_mode = "force_installed";
        #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/tab-volume/latest.xpi";
        # };
        # vim
        "tridactyl.vim@cmcaine.co.uk" = {
          allowed_types = "theme";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/tridactyl-vim/latest.xpi";
        };
        # languagetool
        "languagetool-webextension@languagetool.org" = {
          allowed_types = "extension";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/languagetool/latest.xpi";
        };
        # refined-github
        "{a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad}" = {
          allowed_types = "extension";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/refined-github-/latest.xpi";
        };
        # mailvelope
        "jid1-AQqSMBYb0a8ADg@jetpack" = {
          allowed_types = "extension";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/mailvelope/latest.xpi";
        };
        # Discord container
        "@contain-discord" = {
          allowed_types = "extension";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/discord-container/latest.xpi";
        };
        # SimpleDiscordCrypt
        "{8166255e-a47b-45ee-89be-28bd3f71d6ad}" = {
          allowed_types = "extension";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/simplediscordcrypt/latest.xpi";
        };
      };
    };
  };

}
