echo "tab-cycle completion options, shift+tab-cycle back"
bind "set show-all-if-ambiguous on"
bind "set completion-ignore-case on"
bind "set menu-complete-display-prefix on"
bind TAB:menu-complete
bind "\e[Z":menu-complete-backward

echo "use ctrl+s for backward searching after ctrl+r"
stty -ixon