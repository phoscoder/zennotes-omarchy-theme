#!/bin/bash

# Remove the Omarchy theme for ZenNotes.

rm -f "$HOME/.config/omarchy/themed/zennotes.css.tpl"
rm -f "$HOME/.config/omarchy/hooks/theme-set.d/zennotes-omarchy.sh"
rm -f "$HOME/.local/state/omarchy/current/theme/zennotes.css"
rm -rf "$HOME/.config/zennotes/themes/omarchy"

echo "Removed. Pick another theme in ZenNotes under Settings → Appearance."
