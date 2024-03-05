# ct n | main
# ct i | main
# ct h | yes
# ct w | yes
# ct g | yes
# ct t | yes
# ct v | ~/.ssh/:/home/.ssh/:z
# ct v | ~/.config/.shrc:/home/.profile:z
# ct v | ~/.config/nvim:/home/.config/nvim:z
# ct v | ~/.config/git:/home/.config/git:z
# ct v | ~/.config/trivalent:/home/.config/trivalent:z
# ct v | ~/Documents/.claude:/home/.claude:z
# ct v | ~/Documents/.codex:/home/.codex:z

FROM docker.io/library/fedora:latest

RUN dnf update -y
RUN dnf install -y fontconfig default-fonts procps-ng && fc-cache -f
RUN dnf install -y gcc openssh git curl unzip wl-clipboard neovim podman podman-compose aerc

RUN curl -L https://github.com/typst/typst/releases/download/v0.15.1/typst-x86_64-unknown-linux-musl.tar.xz -o typst.tar.xz \
	&& tar -xf typst.tar.xz \
	&& mv typst-x86_64-unknown-linux-musl/typst /bin \
	&& rm -rf typst-x86_64-unknown-linux-musl \
	&& rm -rf typst.tar.xz

# tor

RUN dnf install -y torbrowser-launcher

RUN sed -i \
    's|/tor-browser/start-tor-browser\.desktop|/tor-browser/Browser/start-tor-browser|' \
    /usr/lib/python*/site-packages/torbrowser_launcher/common.py

RUN printf '%s\n' \
  '#!/bin/sh' \
  'HOME=/tmp torbrowser-launcher "$@"' \
  > /usr/local/bin/torbrowser \
  && chmod 755 /usr/local/bin/torbrowser

# trivalent

RUN dnf config-manager addrepo --from-repofile=https://repo.secureblue.dev/secureblue.repo && dnf update -y && dnf install -y trivalent

# "DefaultCookiesSetting": 2,
RUN mkdir -p /etc/trivalent/policies/recommended && \
    cat > /etc/trivalent/policies/recommended/policy.json <<'EOF'
{
  "WebRtcIPHandling": "disable_non_proxied_udp",
}
EOF

RUN mkdir -p /etc/trivalent/policies/managed && \
    cat > /etc/trivalent/policies/managed/policy.json <<'EOF'
{
  "MetricsReportingEnabled": false,
  "TelemetryEnabled": false,
  "BackgroundModeEnabled": false,
  "PasswordManagerEnabled": false,
  "AutofillAddressEnabled": false,
  "AutofillCreditCardEnabled": false,
  "RestoreOnStartupURLs": ["about:blank"],
  "HomepageLocation": "about:blank",
  "HomepageIsNewTabPage": false,
  "NewTabPageLocation": "about:blank",
  "DefaultSearchProviderEnabled": true,
  "DefaultSearchProviderName": "StartPage",
  "DefaultSearchProviderKeyword": "startpage.com",
  "DefaultSearchProviderSearchURL": "https://startpage.com/sp/search?q={searchTerms}",
  "DefaultGeolocationSetting": 2,
  "DefaultNotificationsSetting": 2,
  "DefaultMediaStreamCameraSetting": 2,
  "DefaultMediaStreamMicSetting": 2,
  "ClearBrowsingDataOnExitList": [ "browsing_history", "download_history", "cached_images_and_files", "autofill", "hosted_app_data" ],
  "SearchSuggestEnabled": false,
  "SafeBrowsingEnabled": true,
  "HttpsUpgradesEnabled": true,
  "BlockThirdPartyCookies": true,
  "DefaultJavaScriptJitSetting": 2,
  "DnsOverHttpsMode": "secure",
  "DnsOverHttpsTemplates": "https://dns.quad9.net/dns-query",
  "SyncDisabled": true,
  "BrowserSignin": 0,
  "TranslateEnabled": false,
  "SpellCheckServiceEnabled": false,
  "NetworkPredictionOptions": 2,
  "UrlKeyedAnonymizedDataCollectionEnabled": false,
  "AlternateErrorPagesEnabled": false
}
EOF
