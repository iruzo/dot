{ config, pkgs, ... }:

{

  # environment = {
  #   systemPackages = with pkgs; [
  #     home-manager
  #     git
  #     wezterm                # terminal emulator
  #     neovim
  #   ];
  # };

  programs = {

    steam = {
      enable = true;
      # remotePlay.openFirewall = true;      # Open ports in the firewall for Steam Remote Play
      # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      package = pkgs.steam.override {
        extraEnv.MANGOHUD = 1;
        extraPkgs = p: with p; [corefonts protontricks];
      };
    };

    firefox = {
      enable = true;
      package = pkgs.firefox-esr;
      # package = pkgs.firefox-esr.override { nativeMessagingHosts = [ pkgs.pipewire-screenaudio.packages.${pkgs.system}.default ]; });
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
          PreventInstalls = true;
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
          "browser.compactmode.show" = true;
          "browser.theme.content-theme" = 0;
          "browser.uidensity" = 1;
          "extensions.activeThemeID" = "{15cb5e64-94bd-41aa-91cf-751bb1a84972}";
          "network.cookie.cookieBehavior" = 5;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        ExtensionSettings = {
          # # gruvbox
          # "{d3f8e52b-140d-41e8-ae4a-a9710ab6a886}" = {
          #   allowed_types = "theme";
          #   installation_mode = "force_installed";
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/gruvbox-true-dark/latest.xpi";
          # };
          # # gruvbox dark
          # "{eb8c4a94-e603-49ef-8e81-73d3c4cc04ff}" = {
          #   allowed_types = "theme";
          #   installation_mode = "force_installed";
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/gruvbox-dark-theme/latest.xpi";
          # };
          # # catppuccin mocha
          # "{8446b178-c865-4f5c-8ccc-1d7887811ae3}" = {
          #   allowed_types = "theme";
          #   installation_mode = "force_installed";
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/catppuccin-mocha-lavender-git/latest.xpi";
          # };
          # catppuccin macchiato
          "{15cb5e64-94bd-41aa-91cf-751bb1a84972}" = {
            allowed_types = "theme";
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/catppuccin-macchiato-lavender2/latest.xpi";
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
          # redirect to alternative privacy friendly frontends
          "7esoorv3@alefvanoon.anonaddy.me" = {
            allowed_types = "extension";
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/libredirect/latest.xpi";
          };
          # user agent switcher
          "{a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7}" = {
            allowed_types = "extension";
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/user-agent-string-switcher/latest.xpi";
          };
          # flags
          "{1018e4d6-728f-4b20-ad56-37578a4de76b}" = {
            allowed_types = "extension";
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/flagfox/latest.xpi";
          };
          # web archives
          "{d07ccf11-c0cd-4938-a265-2a4d6ad01189}" = {
            allowed_types = "extension";
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/view-page-archive/latest.xpi";
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
          # privacy badger
          "jid1-MnnxcxisBPnSXQ@jetpack" = {
            allowed_types = "extension";
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
          };
          # canvas blocker - prevent fingerprinting on js apis
          "CanvasBlocker@kkapsner.de" = {
            allowed_types = "extension";
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/canvasblocker/latest.xpi";
          };
          # ping blocker
          "{8bd6d796-c31a-40ff-8cb1-92459b6443d9}" = {
            allowed_types = "extension";
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ping-blocker/latest.xpi";
          };
          # sponsor block for youtube
          "sponsorBlocker@ajay.app" = {
            allowed_types = "extension";
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
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
          # auto tab discard
          "{c2c003ee-bd69-42a2-b0e9-6f34222cb046}" = {
            allowed_types = "extension";
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/auto-tab-discard/latest.xpi";
          };
          # tampermonkey
          "firefox@tampermonkey.net" = {
            allowed_types = "extension";
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/tampermonkey/latest.xpi";
          };
          # # vimium
          # "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          #   allowed_types = "extension";
          #   installation_mode = "force_installed";
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
          # };
          # tridactyl
          "tridactyl.vim@cmcaine.co.uk" = {
            allowed_types = "extension";
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/tridactyl-vim/latest.xpi";
          };
          # # tabby
          # "tabby@whatsyouridea.com" = {
          #   allowed_types = "extension";
          #   installation_mode = "force_installed";
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/tabby-window-tab-manager/latest.xpi";
          # };
          # # tab-volume
          # "{a8e99fca-eb8f-410f-84e9-142eb055c162}" = {
          #   allowed_types = "extension";
          #   installation_mode = "force_installed";
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/tab-volume/latest.xpi";
          # };
          # # pipewire screenaudio
          # "pipewire-screenaudio@icenjim" = {
          #   allowed_types = "extension";
          #   installation_mode = "force_installed";
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/pipewire-screenaudio/latest.xpi";
          # };
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
          # turbo download manager
          "jid0-dsq67mf5kjjhiiju2dfb6kk8dfw@jetpack" = {
            allowed_types = "extension";
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/turbo-download-manager/latest.xpi";
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
          # augmented steam
          "{1be309c5-3e4f-4b99-927d-bb500eb4fa88}" = {
            allowed_types = "extension";
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/augmented-steam/latest.xpi";
          };
          # amazon price tracker
          "amptra@keepa.com" = {
            allowed_types = "extension";
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/keepa/latest.xpi";
          };
        };
      };
    };

  };

}
