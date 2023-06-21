import os
from urllib.request import urlopen

# set default browser
# os.system('if [ $(xdg-settings get default-web-browser) != "org.qutebrowser.qutebrowser.desktop" ]; then xdg-settings set default-web-browser org.qutebrowser.qutebrowser.desktop; fi')

config.load_autoconfig()
# if not os.path.exists(os.getcwd() + os.sep + 'download'):
#     os.makedirs(os.getcwd() + os.sep + 'download')
# c.downloads.location.directory=os.getcwd() + os.sep + 'download'
c.editor.command = ['wezterm', 'start', 'nvim', '{file}']

# private browsing
# c.url.searchengines={"DEFAULT": "https://searx.fmac.xyz/search?q={}"}
# c.content.cookies.store=False
# c.content.private_browsing=True
# c.new_instance_open_target='private-window'
c.new_instance_open_target='window'

# tor
# c.content.proxy = 'socks://localhost:9050/'

# user agent
# c.content.headers.user_agent='Mozilla/5.0 (Linux; Android 7.0; SM-G930V Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36'

# style
c.tabs.show='multiple'
c.scrolling.bar='never'
c.colors.webpage.darkmode.grayscale.all=True
c.colors.webpage.darkmode.enabled=True
c.window.transparent=True
# c.content.fullscreen.window = True

# themes
if not os.path.exists(config.configdir / "theme.py"):
    themes = [
            "https://raw.githubusercontent.com/Linuus/nord-qutebrowser/master/nord-qutebrowser.py",
            # "https://raw.githubusercontent.com/The-Compiler/dotfiles/master/qutebrowser/gruvbox.py",
            # "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py",
            ]
    if len(themes) > 0:
        for theme in themes:
            with urlopen(theme) as themehtml:
                with open(config.configdir / "theme.py", "a") as file:
                    file.writelines(themehtml.read().decode("utf-8"))
if os.path.exists(config.configdir / "theme.py"):
    # import theme
    # theme.setup(c, 'macchiato', True)
    config.source('theme.py')

# styles
# if not os.path.exists(config.configdir / "style.css"):
#     styles = [
#             "https://raw.githubusercontent.com/alphapapa/solarized-everything-css/master/css/gruvbox/gruvbox-all-sites.css",
#             "https://raw.githubusercontent.com/joinemm/discord-css/master/gruvbox.css",
#             ]
#     if len(styles) > 0:
#         for style in styles:
#             with urlopen(style) as stylehtml:
#                 with open(config.configdir / "style.css", "a") as file:
#                     file.writelines(stylehtml.read().decode("utf-8"))
# if os.path.exists(config.configdir / "style.css"):
#     c.content.user_stylesheets="style.css"

# # greasemonkey
# if not os.path.exists(config.configdir / "greasemonkey"):
#     greasemonkey_scripts = []
#     if len(greasemonkey_scripts) > 0:
#             os.mkdir(config.configdir / "greasemonkey")
#             for script in greasemonkey_scripts:
#                 with urlopen(script) as scripthtml:
#                     with open(config.configdir / "greasemonkey" / script.split("/")[-1], "a") as file:
#                         file.writelines(scripthtml.read().decode("utf-8"))

# userscript
if not os.path.exists(config.configdir / "userscripts"):
    userscripts = []
    if len(userscripts) > 0:
        os.mkdir(config.configdir / "userscripts")
        for script in userscripts:
            with urlopen(script) as scripthtml:
                with open(config.configdir / "userscripts" / script.split("/")[-1], "a") as file:
                    file.writelines(scripthtml.read().decode("utf-8"))

# stop feeding the kraken
redirects = {
        ('reddit.com', 'libreddit.eu.org'),
        ('youtube.com', 'yewtu.be'),
        }
import qutebrowser.api.interceptor
def rewrite(request: qutebrowser.api.interceptor.Request):
    for (url, redirect) in redirects:
        if url in request.request_url.host():
            request.request_url.setHost(redirect)
            try:
                request.redirect(request.request_url)
            except:
                pass
qutebrowser.api.interceptor.register(rewrite)

# fonts
c.fonts.hints = "bold default_size 'Fira Code'"
c.fonts.keyhint = "bold default_size 'Fira Code'"
c.fonts.prompts = "bold default_size 'Fira Code'"
c.fonts.downloads = "bold default_size 'Fira Code'"
c.fonts.statusbar = "bold default_size 'Fira Code'"
c.fonts.contextmenu = "bold default_size 'Fira Code'"
c.fonts.messages.info = "bold default_size 'Fira Code'"
c.fonts.debug_console = "bold default_size 'Fira Code'"
c.fonts.completion.entry = "bold default_size 'Fira Code'"
c.fonts.completion.category = "bold default_size 'Fira Code'"
c.fonts.web.family.cursive = "'Fira Code'"
c.fonts.web.family.fantasy = "'Fira Code'"
c.fonts.web.family.fixed = "'Fira Code'"
c.fonts.web.family.serif = "'Fira Code'"
c.fonts.web.family.sans_serif = "'Fira Code'"
c.fonts.web.family.standard = "'Fira Code'"

# adblock
c.content.blocking.enabled=True
c.content.blocking.method='both'
