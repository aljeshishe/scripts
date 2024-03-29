#!/bin/bash

echo "Installing: tab-cycle completion options, shift+tab-cycle back"
echo '"\e[Z":menu-complete-backward' >> ~/.inputrc
echo 'TAB:menu-complete' >> ~/.inputrc
echo 'set show-all-if-ambiguous on' >> ~/.inputrc
echo 'set completion-ignore-case on' >> ~/.inputrc
echo 'set menu-complete-display-prefix on' >> ~/.inputrc

echo "Installing: use ctrl+s for backward searching after ctrl+r"
echo 'stty -ixon' >> ~/.bashrc