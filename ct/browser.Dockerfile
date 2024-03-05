# ct n | browser
# ct i | browser
# ct w | yes
# ct g | yes
# ct v | ~/Downloads/:/home/Downloads:z
# ct v | ~/.config/BraveSoftware/Brave-Origin/:/home/.config/BraveSoftware/Brave-Origin:z

FROM docker.io/library/fedora:latest

RUN dnf install -y procps-ng

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

# mullvad

RUN dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo
RUN dnf install -y mullvad-browser

# brave

RUN curl -fsS https://dl.brave.com/install.sh | FLAVOR=origin sh

RUN printf '%s\n' \
  '#!/bin/sh' \
  'brave-origin "$@"' \
  > /usr/local/bin/brave \
  && chmod 755 /usr/local/bin/brave

ENV PATH="/usr/local/bin:${PATH}"

RUN mkdir -p /etc/brave/policies/managed && \
    cat > /etc/brave/policies/managed/policy.json <<'EOF'
{
  "BraveRewardsDisabled": true,
  "BraveWalletDisabled": true,
  "BraveVPNDisabled": true,
  "BraveTalkDisabled": true,
  "BraveNewsDisabled": true,
  "BraveAIChatEnabled": false,
  "BraveShieldsEnabled": true,
  "BraveShieldsDefaultAdsSetting": "block",
  "BraveShieldsDefaultTrackersSetting": "block",
  "BraveShieldsDefaultFingerprintingSetting": "standard",
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
  "DefaultSearchProviderName": "DuckDuckGo",
  "DefaultSearchProviderKeyword": "duckduckgo.com",
  "DefaultSearchProviderSearchURL": "https://duckduckgo.com/?q={searchTerms}",
  "DefaultSearchProviderSuggestURL": "https://duckduckgo.com/ac/?q={searchTerms}&type=list",
  "DefaultGeolocationSetting": 2,
  "DefaultNotificationsSetting": 2,
  "DefaultMediaStreamCameraSetting": 2,
  "DefaultMediaStreamMicSetting": 2,
  "SearchSuggestEnabled": false,
  "SafeBrowsingEnabled": true,
  "HttpsUpgradesEnabled": true,
  "BlockThirdPartyCookies": true,
  "DefaultCookiesSetting": 1,
  "DefaultJavaScriptJitSetting": 2,
  "WebRtcIPHandling": "disable_non_proxied_udp",
  "DnsOverHttpsMode": "secure",
  "DnsOverHttpsTemplates": "https://base.dns.mullvad.net/dns-query"
}
EOF
