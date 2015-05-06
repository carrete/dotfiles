source $BYOBU_PREFIX/share/byobu/keybindings/f-keys.tmux.disable
unbind-key -n C-a
set -g prefix ^S
unbind-key %
bind-key | split-window -h
bind-key - split-window -v
# bind-key -T root PPage if-shell -F "#{alternate_on}" "send-keys PPage" "copy-mode -e; send-keys PPage"
# bind-key -t vi-copy PPage page-up
# bind-key -t vi-copy NPage page-down
