{ pkgs, ... }:
  pkgs.writeShellScriptBin "launch-neovim-for-godot" ''
#!/bin/bash

PROJECT=$1
FILE=$2
LINE=$3
COL=$4
PIPE_FILE=$PROJECT/server.pipe

echo $PROJECT
echo $FILE
echo $COL


# Start the server if it's not already running (command will fail if it's already running)
if [ -e $PIPE_FILE ]
then
  echo "Server is already running"
else
  ghostty -e /home/mason/.nix-profile/bin/nvim --listen $PIPE_FILE &
  sleep 1
fi

nvim --server $PIPE_FILE --remote-send "<C-\><C-N>:e $FILE<CR>:call cursor($LINE,$COL)<CR>"
  ''
