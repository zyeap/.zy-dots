---
layout: post
title:  "5. Configuring tmux"
date:   2023-01-13 12:40:32 -0800
categories: jekyll update
---

![yuni python book]({{ site.baseurl }}/assets/images/Yuni Book.png)

Tmux is a terminal multiplexer, which allows you to have multiple terminal windows/sessions at once.

Tmux install and getting started page: [https://github.com/tmux/tmux/wiki](https://github.com/tmux/tmux/wiki)

The tmux getting started page has lots of useful information on how tmux works and the terminology behind sessions, windows, and panes.

Here is what tmux looks like in my terminal:

![tmux demo]({{ site.baseurl }}/assets/images/demo-setup.png)

In this screenshot, I have 3 open panes, 1 for the jekyll server, 1 for this project's development, and another terminal for miscellaneous use.

I also have 3 open windows, as noted by the bottom status bar (1 dotfile docs, 2 zsh, 3 zsh).

On the right side of the status bar, I have system information, which can be configured through additional tmux plugins.

---

### Initial tmux configuration

To start configuring tmux, create the following file: `~/.tmux.conf`

To control and navigate around tmux, a prefix key must be specified. This prefix key combination is pressed to indicate a tmux command.

The default prefix key is Control + b, which is a bit inconvenient. I remap the prefix to Control + x.
```
unbind-key C-b
set-option -g prefix C-x
bind-key C-x send-prefix
```

I don't like too much visual activity in the terminal, so I disable a lot of visuals
```
set -g visual-activity off
set -g visual-bell off
set -g visual-silence off
setw -g monitor-activity off
set -g bell-action none
```

Here are some additional configurations I use for pane and window navigation
```
# first window starts from 1 instead of 0
set -g base-index 1

# automatic renaming and renumbering
set-window-option -g automatic-rename on
set-option -g set-titles on
set-option -g renumber-windows on

set -g status-keys vi
set -g history-limit 10000

setw -g mode-keys vi
setw -g mouse on
setw -g monitor-activity on

# rebind vertical and horizontal splits
bind-key v split-window -h
bind-key s split-window -v

# hjkl pane traversal
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

set -g default-terminal "screen-256color"
set -g status-bg default
```

Add this to your config to enable mouse selection to copy from tmux
```
# Linux only
set -g mouse on
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
bind -n WheelDownPane select-pane -t= \; send-keys -M
bind -n C-WheelUpPane select-pane -t= \; copy-mode -e \; send-keys -M
bind -T copy-mode-vi    C-WheelUpPane   send-keys -X halfpage-up
bind -T copy-mode-vi    C-WheelDownPane send-keys -X halfpage-down
bind -T copy-mode-emacs C-WheelUpPane   send-keys -X halfpage-up
bind -T copy-mode-emacs C-WheelDownPane send-keys -X halfpage-down

# To copy, left click and drag to highlight text in yellow, 
# once you release left click yellow text will disappear and will automatically be available in clibboard
# Use vim keybindings in copy mode
setw -g mode-keys vi
# Update default binding of `Enter` to also use copy-pipe
unbind -T copy-mode-vi Enter
bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "xclip -selection c"
bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip -in -selection clipboard"
```

---

### Tmux plugins

[TPM][tpm-gh] is a tmux plugin manager which can be used to install additional plugins

I mainly use tmux plugins for saving/restoring my current session, and adding additional status bar information.

Plugin for sensible tmux options:
- 'tmux-plugins/tmux-sensible'

Plugins for session restoration:
- 'tmux-plugins/tmux-resurrect'
- 'tmux-plugins/tmux-continuum'

Plugin for additional status bar info:
- 'dracula/tmux'

```
# tmux plugins > https://github.com/tmux-plugins/tpm
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'dracula/tmux'

# enable restoring last saved tmux env
set -g @continuum-restore 'on'

set -g @dracula-show-left-icon session
set -g @dracula-plugins "battery cpu-usage ram-usage time"
set -g @dracula-border-contrast true

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
# reload with prefix + I
run '~/.tmux/plugins/tpm/tpm'
```

[tpm-gh]: https://github.com/tmux-plugins/tpm
