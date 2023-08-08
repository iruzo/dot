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
      btop
      helvum
      pavucontrol
      wezterm

      # workspace
      aerc        # mail
      neovim      # text editor
      ripgrep     # finder
      keepassxc   # password manager
      qutebrowser # used for citrix since citrix is cringe
      pandoc      # document converter
      zathura     # document viewer
      mpv         # image and video viewer
      /* gpt4all */

      # tools
      gcc

      # games
      prismlauncher

      # web apps
      brave
      # (pkgs.chromium.override {
      #   commandLineArgs = [
      #     "--disk-cache=$XDG_RUNTIME_DIR/chromium-cache"
      #     "--no-default-browser-check"
      #     "--no-service-autorun"
      #     "--disable-features=PreloadMediaEngagementData,MediaEngagementBypassAutoplayPolicies"
      #     # Autoplay policy
      #     "--document-user-activation-required"
      #     # Enable Wayland support
      #     "--enable-features=UseOzonePlatform"
      #     "--ozone-platform-hint=auto"
      #     # Disable global Google login
      #     "--disable-sync-preferences"
      #     # Reader mode
      #     "--enable-reader-mode"
      #     "--enable-dom-distiller"
      #     # Dark mode
      #     "--enable-features=WebUIDarkMode"
      #     # Security stuff
      #     "--disable-reading-from-canvas"
      #     "--no-pings"
      #     "--no-first-run"
      #     "--no-experiments"
      #     "--no-crash-upload"
      #     # Chromecast
      #     "--load-media-router-component-extension"
      #     # GPU stuff
      #     "--ignore-gpu-blocklist"
      #     "--enable-gpu-rasterization"
      #     #"--use-gl=egl"
      #     "--enable-zero-copy"
      #     # Accelerated decoding
      #     "--enable-features=VaapiVideoDecoder"

      #     "--disable-wake-on-wifi"
      #     "--disable-breakpad"
      #     "--disable-sync"
      #     "--disable-speech-api"
      #     "--disable-speech-synthesis-api"
      #   ];
      # })

    ];

  };

  programs = {
    noisetorch.enable = true;
    # steam = {
    #   enable = true;
    #   # remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    #   # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    # };
    chromium = {
      enable = true;
      extensions = [
        "kjboibophcgchimahpicagheccpnjnhi" # Theme One Dark
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
        "HefaultSearchProviderSearchURL" = "https://duckduckgo.com/?q={searchTerms}";
        "OsColorMode" = "dark";
        "HasswordManagerEnabled" = false;
        "BrowserSignin" = 0;
        "SyncDisabled" = true;
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
      HardwareAcceleration = false;
      SanitizeOnShutdown = {
        Cache = false;
        Cookies = false;
        Downloads = true;
        FormData = true;
        History = true;
        Sessions = true;
        SiteSettings = true;
        OfflineApps = true;
        Locked = true;
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
        extensions.activeThemeID = "{5ee380f7-abda-467c-ae9a-d30bf8f0d1d6}";
      };
      ExtensionSettings = {
        # one dark
        "{2db5ae19-2e89-4a71-a5f2-da0e2bf69917}" = {
          allowed_types = "theme";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/onedark-vim/latest.xpi";
        };
        # catppuccin
        # "{15cb5e64-94bd-41aa-91cf-751bb1a84972}" = {
        #   allowed_types = "theme";
        #   installation_mode = "force_installed";
        #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/catppuccin-macchiato-lavender2/latest.xpi";
        # };
        # # gruvbox
        # "{08d5243b-4236-4a27-984b-1ded22ce01c3}" = {
        #   allowed_types = "theme";
        #   installation_mode = "force_installed";
        #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/gruvboxgruvboxgruvboxgruvboxgr/latest.xpi";
        # };
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
        "firefox@tampermonkey.net" = {
          allowed_types = "extension";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/tampermonkey/latest.xpi";
        };
        # tampermonkey
        # # tab-volume
        # "{a8e99fca-eb8f-410f-84e9-142eb055c162}" = {
        #   allowed_types = "extension";
        #   installation_mode = "force_installed";
        #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/tab-volume/latest.xpi";
        # };
        # vimium-ff
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          allowed_types = "theme";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
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
        # # SimpleDiscordCrypt
        # "{8166255e-a47b-45ee-89be-28bd3f71d6ad}" = {
        #   allowed_types = "extension";
        #   installation_mode = "force_installed";
        #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/simplediscordcrypt/latest.xpi";
        # };
      };
    };
  };

}
