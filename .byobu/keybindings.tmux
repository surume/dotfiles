unbind-key -n C-a
set -g prefix ^X
bind x send-prefix

bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R
bind-key x confirm-before kill-pane
bind-key SPACE next-layout
bind-key s setw synchronize-panes\; display-message "synchronize-panes #{?pane_synchronized,on,off}"
