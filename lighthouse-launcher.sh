#!/bin/sh
# ROM / bk.o2r, saves, config, logs and mods all live in:
#   ~/.var/app/org.unofficial.Lighthouse/data/Lighthouse
# The game reads bk.o2r and gamecontrollerdb.txt from its working directory,
# so we run from there.
DATA="${XDG_DATA_HOME:-$HOME/.local/share}/Lighthouse"
mkdir -p "$DATA/mods"
export SHIP_HOME="$DATA"
export LD_LIBRARY_PATH="/app/Lighthouse/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
cd "$DATA" || exit 1
ln -sf /app/share/lighthouse/gamecontrollerdb.txt "$DATA/gamecontrollerdb.txt"
exec /app/Lighthouse/bin/Lighthouse "$@"
