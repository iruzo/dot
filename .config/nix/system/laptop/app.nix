{ config, pkgs, ... }:

{

  environment = {
    systemPackages = with pkgs; [
      home-manager
      git
      wezterm                # terminal emulator
      neovim
    ];
  };

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
          browser.theme.content-theme = 0;
          "browser.compactmode.show" = { Value = true; Status = "default"; };
          browser.uidensity = 1;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = { Value = true; Status = "default"; };
          extensions.activeThemeID = "{eb8c4a94-e603-49ef-8e81-73d3c4cc04ff}";
          network.cookie.cookieBehavior = 5;
        };
        ExtensionSettings = {
          # # gruvbox
          # "{d3f8e52b-140d-41e8-ae4a-a9710ab6a886}" = {
          #   allowed_types = "theme";
          #   installation_mode = "force_installed";
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/gruvbox-true-dark/latest.xpi";
          # };
          # gruvbox dark
          "{eb8c4a94-e603-49ef-8e81-73d3c4cc04ff}" = {
            allowed_types = "theme";
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/gruvbox-dark-theme/latest.xpi";
          };
          # # catppuccin mocha
          # "{8446b178-c865-4f5c-8ccc-1d7887811ae3}" = {
          #   allowed_types = "theme";
          #   installation_mode = "force_installed";
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/catppuccin-mocha-lavender-git/latest.xpi";
          # };
          # # catppuccin macchiato
          # "{15cb5e64-94bd-41aa-91cf-751bb1a84972}" = {
          #   allowed_types = "theme";
          #   installation_mode = "force_installed";
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/catppuccin-macchiato-lavender2/latest.xpi";
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
          # redirect to alternative privacy friendly frontends
          "7esoorv3@alefvanoon.anonaddy.me" = {
            allowed_types = "extension";
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/libredirect/latest.xpi";
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
          # vimium
          "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
            allowed_types = "extension";
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
