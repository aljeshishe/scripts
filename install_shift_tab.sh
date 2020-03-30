#!/bin/bash

echo "Installing: tab-cycle completion options, shift+tab-cycle back"  >> ~/.inputrc
echo '"\e[Z":menu-complete-backward' >> ~/.inputrc
echo 'TAB:menu-complete' >> ~/.inputrc
echo 'set show-all-if-ambiguous on' >> ~/.inputrc
echo 'set completion-ignore-case on' >> ~/.inputrc
echo 'set menu-complete-display-prefix on' >> ~/.inputrc

