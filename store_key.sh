#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <API_KEY>"
  exit 1
fi

KEY="$1"
DEST="$HOME/.config/sport_games"
mkdir -p "$DEST"
printf "%s" "$KEY" > "$DEST/key"
chmod 600 "$DEST/key"
echo "Key stored at $DEST/key with permissions 600." 
