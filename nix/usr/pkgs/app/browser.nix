{ config, pkgs, inputs, ... }:

{

  home = {
    sessionVariables.BROWSER = "firefox";
    file."firefox-gnome-theme" = {
      target = ".mozilla/firefox/default/chrome/firefox-gnome-theme";
      source = inputs.firefox-gnome-theme;
    };
  };

  programs = {

    firefox = {
      enable = true;
      package = pkgs.firefox-esr;
      profiles.default = {
        search.default = "DuckDuckGo";
        search.force = true;
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          # catppuccin-macchiato-lavender2 # theme
          web-archives                   # web arcuives
          clearurls                      # clean urls
          auto-tab-discard               # discard not used tabs
          user-agent-string-switcher     # user agent switcher
          libredirect                    # redirect to alternative privacy friendly frontends
          darkreader                     # dark background
          decentraleyes                  # stop resource injection
          istilldontcareaboutcookies     # auto accept/refuse cookies
          languagetool                   # check grammar and syntax
          mailvelope                     # email encryption
          multi-account-containers       # containers
          refined-github                 # better github ui
          temporary-containers           # temp containers
          ublock-origin                  # adblock
          vimium-c                       # vim movements
          keepa                          # amazon price tracker
          # simplediscordcrypt             # discord message encrypt
          # discord-container              # discord container
        ];
        settings = {
          userChrome = ''
            @import "firefox-gnome-theme/userChrome.css";
          '';
          userContent = ''
            @import "firefox-gnome-theme/userContent.css";
          '';
          "app.normandy.api_url" = "";
          "app.normandy.enabled" = false;
          "app.shield.optoutstudies.enabled" = false;
          "app.update.auto" = false;
          "beacon.enabled" = false;
          "breakpad.reportURL" = "";
          "browser.aboutConfig.showWarning" = false;
          "browser.toolbars.bookmarks.showOtherBookmarks" = false;
          "browser.toolbars.bookmarks.showInPrivateBrowsing" = false;
          "browser.toolbars.bookmarks.visibility" = "never";
          "browser.cache.offline.enable" = false;
          "browser.theme.content-theme" = 0;
          "browser.compactmode.show" = { Value = true; Status = "default"; };
          "browser.crashReports.unsubmittedCheck.autoSubmit" = false;
          "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
          "browser.crashReports.unsubmittedCheck.enabled" = false;
          "browser.disableResetPrompt" = true;
          "browser.formfill.enable" = false;
          "browser.newtab.preload" = false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
          "browser.newtabpage.enabled" = false;
          "browser.newtabpage.enhanced" = false;
          "browser.newtabpage.introShown" = true;
          "browser.quitShortcut.disabled" = true;
          "browser.safebrowsing.appRepURL" = "";
          "browser.safebrowsing.blockedURIs.enabled" = false;
          "browser.safebrowsing.downloads.enabled" = false;
          "browser.safebrowsing.downloads.remote.enabled" = false;
          "browser.safebrowsing.downloads.remote.url" = "";
          "browser.safebrowsing.enabled" = false;
          "browser.safebrowsing.malware.enabled" = false;
          "browser.safebrowsing.phishing.enabled" = false;
          "browser.selfsupport.url" = "";
          "browser.send_pings" = false;
          "browser.sessionstore.privacy_level" = 0;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.startup.homepage_override.mstone" = "ignore";
          "browser.tabs.crashReporting.sendReport" = false;
          "browser.tabs.firefox-view" = false;
          "browser.uidensity" = 1;
          "browser.urlbar.groupLabels.enabled" = false;
          "browser.urlbar.quicksuggest.enabled" = false;
          "browser.urlbar.speculativeConnect.enabled" = false;
          "browser.urlbar.trimURLs" = false;
          "browser.warnOnQuitShortcut" = false;
          "datareporting.healthreport.service.enabled" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "datareporting.policy.dataSubmissionEnabled" = false;
          "device.sensors.ambientLight.enabled" = false;
          "device.sensors.enabled" = false;
          "device.sensors.motion.enabled" = false;
          "device.sensors.orientation.enabled" = false;
          "device.sensors.proximity.enabled" = false;
          "dom.battery.enabled" = false;
          "dom.security.https_only_mode" = true;
          "dom.security.https_only_mode_ever_enabled" = true;
          "dom.webaudio.enabled" = false;
          "experiments.activeExperiment" = false;
          "experiments.enabled" = false;
          "experiments.manifest.uri" = "";
          "experiments.supported" = false;
          "extensions.activeThemeID" = "{d3f8e52b-140d-41e8-ae4a-a9710ab6a886}";
          "extensions.CanvasBlocker@kkapsner.de.whiteList" = "";
          "extensions.ClearURLs@kevinr.whiteList" = "";
          "extensions.Decentraleyes@ThomasRientjes.whiteList" = "";
          "extensions.FirefoxMulti-AccountContainers@mozilla.whiteList" = "";
          "extensions.TemporaryContainers@stoically.whiteList" = "";
          "extensions.autoDisableScopes" = 14;
          "extensions.getAddons.cache.enabled" = false;
          "extensions.getAddons.showPane" = false;
          "extensions.pocket.enabled" = false;
          "extensions.shield-recipe-client.api_url" = "";
          "extensions.shield-recipe-client.enabled" = false;
          "extensions.webservice.discoverURL" = "";
          "media.autoplay.default" = 1;
          "media.autoplay.enabled" = false;
          "media.navigator.enabled" = false;
          "media.peerconnection.enabled" = true; # webrtc
          "media.video_stats.enabled" = false;
          "network.IDN_show_punycode" = true;
          "network.allow-experiments" = false;
          "network.captive-portal-service.enabled" = false;
          "network.cookie.cookieBehavior" = 5;
          "network.dns.disablePrefetch" = true;
          "network.dns.disablePrefetchFromHTTPS" = true;
          "network.http.referer.spoofSource" = true;
          "network.http.speculative-parallel-limit" = 0;
          "network.predictor.enable-prefetch" = false;
          "network.predictor.enabled" = false;
          "network.prefetch-next" = false;
          "pdfjs.enableScripting" = false;
          "privacy.donottrackheader.enabled" = true;
          "privacy.donottrackheader.value" = 1;
          "privacy.query_stripping" = true;
          "privacy.trackingprotection.cryptomining.enabled" = true;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.fingerprinting.enabled" = true;
          "privacy.trackingprotection.pbmode.enabled" = true;
          "privacy.usercontext.about_newtab_segregation.enabled" = true;
          "security.ssl.disable_session_identifiers" = true;
          "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSite" = false;
          "signon.autofillForms" = false;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = { Value = true; Status = "default"; };
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.cachedClientID" = "";
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.hybridContent.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.prompted" = 2;
          "toolkit.telemetry.rejected" = true;
          "toolkit.telemetry.reportingpolicy.firstRun" = false;
          "toolkit.telemetry.server" = "";
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.unifiedIsOptIn" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          "webgl.disabled" = true;
          "webgl.renderer-string-override" = " ";
          "webgl.vendor-string-override" = " ";

          # set these to false if you're copying this config...
          # it's to *enable* DRM, not disable it
          "media.eme.enabled" = true;
          "media.gmp-widevinecdm.enabled" = true;
        };
      };
    };

    # chromium = {
    #   enable = true;
    #   extensions = [
    #     # "bkkmolkhemgaeaeggcmfbghljjjoofoh" # Theme Catppuccin Mocha
    #     "cmpdlhmnmjhihmcfnigoememnffkimlk" # Theme Catppuccin Macchiato
    #     # "fjofdcgahcnlkdjapcbeonbnmjdnfcki" # Theme gruvbox
    #     # "njcgdakjdifgccdgnoiphpnihcfopcmj" # Theme devtools gruvbox
    #     # "bkdgflcldnnnapblkhphbgpggdiikppg" # DuckDuckGo
    #     "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
    #     "cjpalhdlnbpafiamejdnhcphjbkeiagm" # Ublock Origin
    #     "edibdbjcniadpccecjdfdjjppcpchdlm" # I still dont care about cookies
    #     "ldpochfccmkkmhdbclfhpagapcfdljkj" # Decentraleyes
    #     "lckanjgmijmafbedllaakclkaicjfmnk" # Clear urls
    #     "bhfakmaiadhflpjloimlagikhodjiefj" # History AutoDelete
    #     "oldceeleldhonbafppcapldpdifcinji" # Grammar checker
    #     "hfjbmagddngcpeloejdejnfgbamkjaeg" # Vimium C
    #     "hlepfoohegkhhmjieoechaddaejaokhf" # Refined Github
    #     "kajibbejlbohfaggdiogboambcijhkke" # Mailvelope
    #     "hbplgmpfdabobhnadbfpknppljdfkiia" # SimpleDiscordCrypt
    #   ];
    #   # Enterprise policy list: https://chromeenterprise.google/policies/
    #   # chrome://policy shows applied policies and syntax errors.
    #   # extraOpts = {
    #   #   "HomepageLocation" = "https://start.duckduckgo.com";
    #   #   "DefaultSearchProviderSearchURL" = "https://duckduckgo.com/?q={searchTerms}";
    #   #   "OsColorMode" = "dark";
    #   #   "PasswordManagerEnabled" = false;
    #   #   "BrowserSignin" = 0;
    #   #   "SyncDisabled" = true;
    #   #   "HardwareAccelerationModeEnabled" = true;
    #   # };
    #   package = (pkgs.chromium.override {
    #     commandLineArgs = [
    #       "--disk-cache=$XDG_RUNTIME_DIR/chromium-cache"
    #       "--no-default-browser-check"
    #       "--no-service-autorun"
    #       "--disable-features=PreloadMediaEngagementData,MediaEngagementBypassAutoplayPolicies"
    #       # Autoplay policy
    #       "--document-user-activation-required"
    #       # Enable Wayland support
    #       "--enable-features=UseOzonePlatform"
    #       "--ozone-platform-hint=auto"
    #       # Disable global Google login
    #       "--disable-sync-preferences"
    #       # Reader mode
    #       "--enable-reader-mode"
    #       "--enable-dom-distiller"
    #       # Dark mode
    #       "--enable-features=WebUIDarkMode"
    #       # Security stuff
    #       "--disable-reading-from-canvas"
    #       "--no-pings"
    #       "--no-first-run"
    #       "--no-experiments"
    #       "--no-crash-upload"
    #       # Chromecast
    #       "--load-media-router-component-extension"
    #       # GPU stuff
    #       "--ignore-gpu-blocklist"
    #       "--enable-gpu-rasterization"
    #       #"--use-gl=egl"
    #       "--enable-zero-copy"
    #       # Accelerated decoding
    #       "--enable-features=VaapiVideoDecoder"

    #       "--disable-wake-on-wifi"
    #       "--disable-breakpad"
    #       "--disable-sync"
    #       "--disable-speech-api"
    #       "--disable-speech-synthesis-api"
    #     ];
    #   });
    # };

  };

}
