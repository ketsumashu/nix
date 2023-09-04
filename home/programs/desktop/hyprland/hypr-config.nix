colorscheme: let
  inherit (colorscheme) colors;
in ''
monitor=DP-2,2560x1440@165,0x0,1
monitor=HDMI-A-1,2560x1440@144,0x0,1

# See https://wiki.hyprland.org/Configuring/Keywords/ for more

# Execute your favorite apps at launch
exec-once = waybar & discord-screenaudio
exec-once = /usr/lib/mate-polkit/polkit-mate-authentication-agent-1
exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland
exec-once = hyprpaper
exec-once = steam-runtime -silent
exec-once = swayidle -C ~/dotfiles/swayidle/config
exec-once = yaskkserv2 --google-suggest ~/dotfiles/libskk/dict.yaskkserv2
exec-once = sway-audio-idle-inhibit
# Source a file (multi-file configs)
# source = ~/.config/hypr/myColors.conf

# Some default env vars.
env = XCURSOR_SIZE,24

env = XDG_SESSION_TYPE,wayland
env = XDG_CURRENT_DESKTOP,Hyprland
env = XDG_CURRENT_SESSION,Hyprland
env = QT_QPA_PLATFORM,wayland;xcb
env = GDK_DPI_SCALE,1
env = QT_SCALE_FACTOR,1
env = MOZ_ENABLE_WAYLAND,1

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
input {
    kb_layout = us
    kb_options = ctrl:nocaps
    repeat_delay = 400
    repeat_rate = 50
    follow_mouse = 1
    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
}

general {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    gaps_in = 5
    gaps_out = 15
    border_size = 2
    col.active_border = rgba(a18dafff) rgba(659ea2ff) 45deg
    col.inactive_border = rgba(5b5f71ff)
    layout = dwindle
}

misc {
    disable_hyprland_logo = true
    mouse_move_enables_dpms = true
    key_press_enables_dpms = true
    vrr = 0
}

decoration {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    rounding = 10

    blur {
        enabled = true
        size = 1.4
        passes = 2
    }

    drop_shadow = false
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
}

animations {
    enabled = true

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05
    bezier = cubic, 0.1, 0.23, 0.41, 0.9

    animation = windows, 1, 1.2, cubic, slide
    animation = border, 1, 0.1, default
    animation = borderangle, 0, 0.2, default
    animation = fade, 1, 4, default
    animation = workspaces, 1, 4, default, fade
}

dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = true # you probably want this
    force_split = 2
}

master {
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    new_is_master = true
}

# Example windowrule v1
# Example windowrule v2
# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
windowrulev2 = float,class:^(Floaterm)$
windowrulev2 = float,class:^(steam)$,title:^(Friends)
windowrulev2 = float,class:^(steam)$,title:^(Steam - News)
windowrulev2 = float,class:^(steam)$,title:(Chat)$
windowrulev2 = float,class:^(steam)$,title:^(*Settings)$
windowrulev2 = float,class:^(steam)$,title:^(.* - event started)$
windowrulev2 = float,class:^(steam)$,title:(CD key)$
windowrulev2 = float,class:^(steam)$,title:^(Steam - Self Updater)$
windowrulev2 = float,class:^(steam)$,title:^(Screenshot Uploader)$
windowrulev2 = float,class:^(steam)$,title:^(Screenshot Manager)$
windowrulev2 = float,class:^(steam)$,title:^(Steam Guard - Computer Authorization Required)$
windowrule = float,^(pavucontrol)$
windowrule = float,^(org.fcitx.fcitx5-config-qt)

# See https://wiki.hyprland.org/Configuring/Keywords/ for more
$mainMod = SUPER

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, RETURN, exec, wezterm
bind = $mainMod, Insert, exec, ~/bin/scr
bind = $mainMod, B, exec, firefox
bind = $mainMod, X, killactive
bind = $mainMod CTRL, Q, exit
bind = $mainMod, E, exec, steam-runtime -silent
bind = $mainMod CTRL, SPACE, togglefloating
bind = $mainMod, SPACE, exec, rofi -show drun
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, F, Fullscreen, # dwindle
bind = $mainMod CTRL, equal, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%
bind = $mainMod CTRL, minus, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%
# Move focus with mainMod + arrow keys
bind = $mainMod, H, movefocus, l
bind = $mainMod, L, movefocus, r
bind = $mainMod, K, movefocus, u
bind = $mainMod, J, movefocus, d
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow
''
