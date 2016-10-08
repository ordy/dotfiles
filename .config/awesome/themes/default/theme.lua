---------------------------
-- Default awesome theme --
---------------------------

theme = {}

themeicons = "/home/ordnas/.config/awesome/icons"

theme.font          = "terminus 9"

--color       
theme.bg_normal     = "#232323"
theme.bg_focus      = "#232323"
theme.bg_urgent     = "#000000"
theme.bg_minimize   = "#000000"

theme.fg_normal     = "#f0f0f0"
theme.fg_focus      = "#009fff"
theme.fg_urgent     = "#ff9f00"
theme.fg_minimize   = "#555555"

theme.border_width  = "1"
theme.border_normal = "#000000"
theme.border_focus  = "#0096eb"
theme.border_marked = "#009fff"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = "/home/ordnas/.config/awesome/themes/default/taglist/squarefw.png"
theme.taglist_squares_unsel = "/home/ordnas/.config/awesome/themes/default/taglist/squarew.png"

theme.tasklist_floating_icon = "/home/ordnas/.config/awesome/themes/default/tasklist/floatingw.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
-- theme.menu_submenu_icon = "/usr/share/awesome/themes/default/submenu.png"
theme.menu_height = "17"
theme.menu_width  = "100"
theme.menu_bg_focus = "#009fff"
theme.menu_fg_focus = "#000000"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/default/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_active.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themeicons .. "/layouts/fairh.png"
theme.layout_fairv = themeicons .. "/layouts/fairv.png"
theme.layout_floating  = themeicons .. "/layouts/floating.png"
theme.layout_magnifier = themeicons .. "/layouts/magnifier.png"
theme.layout_max = themeicons .. "/layouts/max.png"
theme.layout_fullscreen = themeicons .. "/layouts/max.png"
theme.layout_tilebottom = themeicons .. "/layouts/tilebottom.png"
theme.layout_tileleft   = themeicons .. "/layouts/tileleft.png"
theme.layout_tile = themeicons .. "/layouts/tile.png"
theme.layout_tiletop = themeicons .. "/layouts/tiletop.png"
theme.layout_spiral  = themeicons .. "/layouts/spiral.png"
theme.layout_dwindle = themeicons .. "/layouts/dwindle.png"

theme.awesome_icon = "/home/ordnas/.config/awesome/themes/default/awesome16.png"


theme.widget_disk     = themeicons .. "/disk.png"
theme.widget_ac       = themeicons .. "/ac_01.png"
--theme.widget_acblink  = themedir .. "/icons/acblink.png"
theme.widget_batfull  = themeicons .. "/bat_full_01.png"
--theme.widget_batmed   = themedir .. "/icons/batmed.png"
theme.widget_batlow   = themeicons .. "/bat_low_01.png"
theme.widget_batempty = themeicons .. "/bat_empty_01.png"
--theme.widget_vol      = themedir .. "/icons/vol.png"
--theme.widget_mute     = themedir .. "/icons/mute.png"
--theme.widget_pac      = themedir .. "/icons/pac.png"
--theme.widget_pacnew   = themedir .. "/icons/pacnew.png"
theme.widget_mail     = themeicons .. "/mail.png"
--theme.widget_mailnew  = themedir .. "/icons/mailnew.png"
theme.widget_temp     = themeicons .. "/temp.png"
theme.widget_wifi     = themeicons .. "/wifi_03.png"
theme.widget_wifi0     = themeicons .. "/wifi_0_03.png"
theme.widget_wifi1     = themeicons .. "/wifi_1_03.png"
theme.widget_wifi2     = themeicons .. "/wifi_2_03.png"
theme.widget_wifi3     = themeicons .. "/wifi_3_03.png"
theme.widget_wifi4     = themeicons .. "/wifi_4_03.png"
theme.widget_mpd      = themeicons .. "/note.png"
theme.widget_cpu  = themeicons .. "/cpu.png"
theme.widget_clock  = themeicons .. "/clock.png"

theme.widget_mem      = themeicons .. "/mem.png"
theme.widget_fs       = themeicons .. "/disk.png"
theme.widget_fs2      = themeicons .. "/disk.png"
theme.widget_up       = themeicons .. "/net_up_02.png"
theme.widget_down     = themeicons .. "/net_down_02.png"


theme.widget_play      = themeicons .. "/play.png"
theme.widget_pause     = themeicons .. "/pause.png"
theme.widget_stop      = themeicons .. "/stop.png"
theme.widget_prev      = themeicons .. "/prev.png"
theme.widget_next      = themeicons .. "/next.png"



return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
