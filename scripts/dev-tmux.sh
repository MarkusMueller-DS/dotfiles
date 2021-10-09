#!/bin/sh

# Session Name
session="dev"

# Star New Session with our nae
tmux new-session -d -s $session

# Select pane 1, activate dev enve and split it horizontally
tmux selectp -t 1
tmux send-keys "cona" C-m
tmux send-keys "c" C-m
tmux split-window -v -p 35 

# Now in pane 2, activate dev enve
tmux send-keys "cona" C-m
tmux send-keys "c" C-m

# select pane 1
tmux selectp -t 1

# finally attach to session
tmux a -t dev
