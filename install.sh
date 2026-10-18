#!/bin/bash

# Install the Omarchy theme for ZenNotes: a color template rendered on every
# theme change, plus a theme-set hook that copies it into ZenNotes.

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATES_DIR="$HOME/.config/omarchy/themed"
ZENNOTES_CONFIG="$HOME/.config/zennotes/config.toml"

if ! command -v omarchy >/dev/null; then
  echo "Omarchy not found. This theme requires Omarchy 4 or newer."
  exit 1
fi

if [[ ! -d $HOME/.config/zennotes ]]; then
  echo "ZenNotes config not found at ~/.config/zennotes. Launch ZenNotes once, then rerun."
  exit 1
fi

mkdir -p "$TEMPLATES_DIR"
cp "$REPO_DIR/themed/zennotes.css.tpl" "$TEMPLATES_DIR/zennotes.css.tpl"
echo "Installed template: $TEMPLATES_DIR/zennotes.css.tpl"

omarchy hook install theme-set "$REPO_DIR/hooks/zennotes-omarchy.sh"

if [[ $1 != --no-select && -f $ZENNOTES_CONFIG ]]; then
  cp "$ZENNOTES_CONFIG" "$ZENNOTES_CONFIG.bak.$(date +%s)"
  sed -i -E \
    -e 's/^(theme_family = )"[a-z-]+"/\1"custom"/' \
    -e 's/^(theme_id = )"[^"]*"/\1"custom-omarchy"/' \
    "$ZENNOTES_CONFIG"
  echo "Selected the Omarchy theme in ZenNotes (previous config backed up)."
fi

# Re-apply the current theme so the template renders and the hook runs.
omarchy theme refresh >/dev/null 2>&1

echo "Done. ZenNotes now follows your Omarchy theme."
