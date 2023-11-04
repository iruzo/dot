/* appearance */
static const int sloppyfocus        = 1;  /* focus follows mouse */
static const int bypass_surface_visibility = 0;  /* 1 means idle inhibitors will disable idle tracking even if it's surface isn't visible  */
static const unsigned int borderpx  = 0;  /* border pixel of windows */
static const int lockfullscreen     = 1;  /* 1 will force focus on the fullscreen window */
static const float rootcolor[]      = {0.3, 0.3, 0.3, 1.0};
static const float bordercolor[]    = {0.5, 0.5, 0.5, 1.0};
static const float focuscolor[]     = {1.0, 0.0, 0.0, 1.0};
static const int smartborders = 1;
/* To conform the xdg-protocol, set the alpha to zero to restore the old behavior */
static const float fullscreen_bg[]  = {0.1, 0.1, 0.1, 1.0};

static const unsigned int gappih    = 10;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 10;       /* vert outer gap between windows and screen edge */
static const unsigned int monoclegaps    = 0;       /* vert outer gap between windows and screen edge */
static const int smartgaps          = 1;        /* 1 means no outer gap when there is only one window */

/* pointer constraints */
static const int allow_constrain      = 1;

/* cursor warping */
static const bool cursor_warp = false;

/* tagging - tagcount must be no greater than 31 */
static const int tagcount = 9;

static const Rule rules[] = {
	/* app_id     title       tags mask     isfloating   monitor */
	/* examples:
	{ "Gimp",     NULL,       0,            1,           -1 },
	{ "firefox",     NULL,       1,            0,           1 },
	*/
};

/* layout(s) */
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* monitors */
static const MonitorRule monrules[] = {
  { "eDP-1",    0.5, 1, 1, &layouts[0], WL_OUTPUT_TRANSFORM_NORMAL, 0,   0, 2560, 1440, 165,  0,    0   },
  { "HDMI-A-1", 0.5, 1, 1, &layouts[0], WL_OUTPUT_TRANSFORM_NORMAL, 2560 *  2,    0,    1920, 1080, 60, 0, 0 },
};

/* keyboard */
static const struct xkb_rule_names xkb_rules = {
	/* can specify fields: rules, model, layout, variant, options */
	/* example:
	.options = "ctrl:nocaps",
	*/
	.options = NULL,
};

static const int repeat_rate = 25;
static const int repeat_delay = 600;
static const char *kblayouts[] = {"us", "cz"};

/* Trackpad */
static const int tap_to_click = 1;
static const int tap_and_drag = 1;
static const int drag_lock = 1;
static const int natural_scrolling = 0;
static const int disable_while_typing = 1;
static const int left_handed = 0;
static const int middle_button_emulation = 0;
/* You can choose between:
LIBINPUT_CONFIG_SCROLL_NO_SCROLL
LIBINPUT_CONFIG_SCROLL_2FG
LIBINPUT_CONFIG_SCROLL_EDGE
LIBINPUT_CONFIG_SCROLL_ON_BUTTON_DOWN
*/
static const enum libinput_config_scroll_method scroll_method = LIBINPUT_CONFIG_SCROLL_2FG;

/* You can choose between:
LIBINPUT_CONFIG_CLICK_METHOD_NONE
LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS
LIBINPUT_CONFIG_CLICK_METHOD_CLICKFINGER
*/
static const enum libinput_config_click_method click_method = LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS;

/* You can choose between:
LIBINPUT_CONFIG_SEND_EVENTS_ENABLED
LIBINPUT_CONFIG_SEND_EVENTS_DISABLED
LIBINPUT_CONFIG_SEND_EVENTS_DISABLED_ON_EXTERNAL_MOUSE
*/
static const uint32_t send_events_mode = LIBINPUT_CONFIG_SEND_EVENTS_ENABLED;

/* You can choose between:
LIBINPUT_CONFIG_ACCEL_PROFILE_FLAT
LIBINPUT_CONFIG_ACCEL_PROFILE_ADAPTIVE
*/
static const enum libinput_config_accel_profile accel_profile = LIBINPUT_CONFIG_ACCEL_PROFILE_ADAPTIVE;
static const double accel_speed = 0.0;

static const enum libinput_config_tap_button_map button_map = LIBINPUT_CONFIG_TAP_MAP_LRM;

/* Autostart */
static const char *const autostart[] = {
        "sh", "-c", "sleep 3s && systemctl --user start graphical-session.target", NULL,
        "somebar", NULL,
        NULL /* terminate */
};

#define MODKEY WLR_MODIFIER_LOGO /* Super key */
#define TAGKEYS(KEY,SKEY,TAG) \
	{ MODKEY,                    KEY,            view,            {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_CTRL,  KEY,            toggleview,      {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_SHIFT, SKEY,           tag,             {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_CTRL|WLR_MODIFIER_SHIFT,SKEY,toggletag, {.ui = 1 << TAG} }

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */

static const char *term[]            = { "wezterm",       NULL               };
static const char *menu[]            = { "bemenu-run",    NULL               };
static const char *volume_up[]       = { "wpctl",         "set-volume",      "@DEFAULT_SINK@",   "5%+",    NULL };
static const char *volume_down[]     = { "wpctl",         "set-volume",      "@DEFAULT_SINK@",   "5%-",    NULL };
static const char *volume_mute[]     = { "wpctl",         "set_sink_mute",   "@DEFAULT_SINK@",   "toggle", NULL };
static const char *mic_mute[]        = { "wpctl",         "set_source_mute", "@DEFAULT_SOURCE@", "toggle", NULL };

static const char *notifications[]   = { "swaync-client", "-t",              NULL                };
static const char *brightness_up[]   = { "brightnessctl", "s",               "+10",              NULL      };
static const char *brightness_down[] = { "brightnessctl", "s",               "10-",              NULL      };
static const char *pavucontrol[]     = { "pavucontrol",   NULL               };
static const char *browser[]         = { "firefox",       NULL               };
static const char *vm[]              = { "gnome-boxes",   NULL               };
static const char *password[]        = { "keepasscx",     NULL               };
static const char *game[]            = { "steam",         NULL               };

static const char *screenshot_area[]    = { "mkdir",         "-p",              "$HOME/media",          "&&",     "grim", "-g", "\"$(slurp)\"", "$HOME/media/$(date +'%Y%m%d_%H%M%S').png", NULL                    };
static const char *screenshot_monitor[] = { "mkdir",         "-p",              "$HOME/media",          "&&",     "grim", "-g", "\"$(slurp      -o)\"",         "$HOME/media/$(date         +'%Y%m%d_%H%M%S').png", NULL };
static const char *quickmarks[] = { "cat", "$HOME/iruzo/quickmarks", "2>", "/dev/null", "|", "bemenu", "|", "awk", "-F'-'", "'{print $NF}'", "|", "wl-copy", "$(cat)", NULL };
static const char *discord[] = { "brave",         "--app",                 "https://discord.com/app", "||",                            "chromium",  "--app", "https://discord.com/app", "||",             "chromium-browser", "--app",                                    "https://discord.com/app", "||",                       "firefox", "--new-instance",           "https://discord.com/login", "||",       "librewolf",    "--kiosk", "https://discord.com/login", NULL };
static const char *contact[] = { "cat", "$HOME/iruzo/contacts", "2>", "/dev/null", "|", "bemenu", "|", "awk", "-F'-'", "'{print $NF}'", "|", "wl-copy", "$(cat)", NULL };

static const Key keys[] = {

	/* term          */ { MODKEY,                    XKB_KEY_Return, spawn, {.v = term}               },
	/* menu          */ { MODKEY,                    XKB_KEY_d,      spawn, {.v = menu}               },
  /* volume        */ { MODKEY,                    XKB_KEY_n,      spawn, {.v = volume_up}          },
  /* volume        */ { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_N,      spawn, {.v = volume_down}        },
  /* volume        */ { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_M,      spawn, {.v = volume_mute}        },
  /* volume        */ { MODKEY,                    XKB_KEY_m,      spawn, {.v = mic_mute}           },
  /* pavucontrol   */ { MODKEY,                    XKB_KEY_p,      spawn, {.v = pavucontrol}        },
  /* notifications */ { MODKEY,                    XKB_KEY_x,      spawn, {.v = notifications}      },
  /* brightness    */ { MODKEY,                    XKB_KEY_b,      spawn, {.v = brightness_up}      },
  /* brightness    */ { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_B,      spawn, {.v = brightness_down}    },
  /* screenshot    */ { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_S,      spawn, {.v = screenshot_area}    },
  /* screenshot    */ { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_F,      spawn, {.v = screenshot_monitor} },
  /* browser       */ { MODKEY,                    XKB_KEY_o,      spawn, {.v = browser}            },
  /* quickmarks    */ { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_O,      spawn, {.v = quickmarks}         },
  /* discord       */ { MODKEY,                    XKB_KEY_g,      spawn, {.v = discord}            },
  /* vm            */ { MODKEY,                    XKB_KEY_i,      spawn, {.v = vm}                 },
  /* keepassxc     */ { MODKEY,                    XKB_KEY_u,      spawn, {.v = password}           },
  /* steam         */ { MODKEY,                    XKB_KEY_y,      spawn, {.v = game}               },
  /* contacts      */ { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_O,      spawn, {.v = contact}            },

	{ MODKEY,                    XKB_KEY_j,          focusstack,     {.i = +1} },
	{ MODKEY,                    XKB_KEY_k,          focusstack,     {.i = -1} },
	{ MODKEY,                    XKB_KEY_i,          incnmaster,     {.i = +1} },
	{ MODKEY,                    XKB_KEY_d,          incnmaster,     {.i = -1} },
	{ MODKEY,                    XKB_KEY_h,          setmfact,       {.f = -0.05} },
	{ MODKEY,                    XKB_KEY_l,          setmfact,       {.f = +0.05} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_Return,     zoom,           {0} },
	{ MODKEY,                    XKB_KEY_Tab,        view,           {0} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_C,          killclient,     {0} },
	/* { MODKEY,                    XKB_KEY_t,          setlayout,      {.v = &layouts[0]} }, */
	/* { MODKEY,                    XKB_KEY_f,          setlayout,      {.v = &layouts[1]} }, */
	/* { MODKEY,                    XKB_KEY_m,          setlayout,      {.v = &layouts[2]} }, */
	/* { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_space,      setlayout,      {0} }, */
	{ MODKEY,                    XKB_KEY_space,      togglefloating, {0} },
	{ MODKEY,                    XKB_KEY_e,         togglefullscreen, {0} },
	{ MODKEY,                    XKB_KEY_0,          view,           {.ui = ~0} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_parenright, tag,            {.ui = ~0} },
	{ MODKEY,                    XKB_KEY_comma,      focusmon,       {.i = WLR_DIRECTION_LEFT} },
	{ MODKEY,                    XKB_KEY_period,     focusmon,       {.i = WLR_DIRECTION_RIGHT} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_less,       tagmon,         {.i = WLR_DIRECTION_LEFT} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_greater,    tagmon,         {.i = WLR_DIRECTION_RIGHT} },
	TAGKEYS(          XKB_KEY_1, XKB_KEY_exclam,                     0),
	TAGKEYS(          XKB_KEY_2, XKB_KEY_at,                         1),
	TAGKEYS(          XKB_KEY_3, XKB_KEY_numbersign,                 2),
	TAGKEYS(          XKB_KEY_4, XKB_KEY_dollar,                     3),
	TAGKEYS(          XKB_KEY_5, XKB_KEY_percent,                    4),
	TAGKEYS(          XKB_KEY_6, XKB_KEY_asciicircum,                5),
	TAGKEYS(          XKB_KEY_7, XKB_KEY_ampersand,                  6),
	TAGKEYS(          XKB_KEY_8, XKB_KEY_asterisk,                   7),
	TAGKEYS(          XKB_KEY_9, XKB_KEY_parenleft,                  8),
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_Q,          quit,           {0} },

	/* Ctrl-Alt-Backspace and Ctrl-Alt-Fx used to be handled by X server */
	{ WLR_MODIFIER_CTRL|WLR_MODIFIER_ALT,XKB_KEY_Terminate_Server, quit, {0} },
#define CHVT(n) { WLR_MODIFIER_CTRL|WLR_MODIFIER_ALT,XKB_KEY_XF86Switch_VT_##n, chvt, {.ui = (n)} }
	CHVT(1), CHVT(2), CHVT(3), CHVT(4), CHVT(5), CHVT(6),
	CHVT(7), CHVT(8), CHVT(9), CHVT(10), CHVT(11), CHVT(12),
};

static const Button buttons[] = {
	{ MODKEY, BTN_LEFT,   moveresize,     {.ui = CurMove} },
	{ MODKEY, BTN_MIDDLE, togglefloating, {0} },
	{ MODKEY, BTN_RIGHT,  moveresize,     {.ui = CurResize} },
};

