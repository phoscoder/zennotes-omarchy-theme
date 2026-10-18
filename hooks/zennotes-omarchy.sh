#!/bin/bash

# Sync the current Omarchy theme into ZenNotes as the "omarchy" custom theme.

CURRENT_THEME_DIR="$HOME/.local/state/omarchy/current/theme"
ZENNOTES_DIR="$HOME/.config/zennotes"
THEME_DIR="$ZENNOTES_DIR/themes/omarchy"
CONFIG="$ZENNOTES_DIR/config.toml"

[[ -f $CURRENT_THEME_DIR/zennotes.css ]] || exit 0
[[ -d $ZENNOTES_DIR ]] || exit 0

mode=$(sed -n 's/^mode *= *"\(light\|dark\)".*/\1/p' "$CURRENT_THEME_DIR/colors.toml" | head -1)
mode=${mode:-dark}
accent=$(sed -n 's/^accent *= *"\(#[0-9A-Fa-f]\{6\}\)".*/\1/p' "$CURRENT_THEME_DIR/colors.toml" | head -1)
theme_name=$(omarchy-theme-current 2>/dev/null)

mkdir -p "$THEME_DIR"

cat >"$THEME_DIR/manifest.json" <<EOF
{
  "name": "Omarchy",
  "author": "Omarchy",
  "version": "1.0.0",
  "description": "Follows the current Omarchy theme${theme_name:+ ($theme_name)}.",
  "modes": "both",
  "preview": { "light": "${accent:-#888888}", "dark": "${accent:-#888888}" }
}
EOF

# ZenNotes tokens are space-separated RGB triplets; Omarchy renders "r,g,b".
sed -E 's/([0-9]{1,3}),([0-9]{1,3}),([0-9]{1,3})/\1 \2 \3/g' \
  "$CURRENT_THEME_DIR/zennotes.css" >"$THEME_DIR/theme.css.tmp" &&
  mv "$THEME_DIR/theme.css.tmp" "$THEME_DIR/theme.css"

# Keep ZenNotes' light/dark mode in step, but only while Omarchy is selected.
if [[ -f $CONFIG ]] && grep -q '^theme_id = "custom-omarchy"' "$CONFIG"; then
  sed -i -E "s/^(theme_mode = )\"[a-z]+\"/\1\"$mode\"/" "$CONFIG"
fi
