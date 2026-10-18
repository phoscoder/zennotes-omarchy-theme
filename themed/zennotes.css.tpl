/* Omarchy — a ZenNotes theme generated from the current Omarchy theme.
 *
 * Rendered by omarchy-theme-set-templates from colors.toml, then copied into
 * ~/.config/zennotes/themes/omarchy/ by the theme-set hook (which also turns
 * the comma RGB triplets into the space-separated form ZenNotes expects).
 * Do not edit the copy in ZenNotes; edit this template instead.
 */

:root,
:root[data-theme-mode="light"],
:root[data-theme-mode="dark"] {
  color-scheme: {{ mode }};

  --z-bg: {{ background_rgb }};
  --z-bg-softer: {{ mix_rgb background dark_background 60% }};
  --z-bg-1: {{ mix_rgb background foreground 5% }};
  --z-bg-2: {{ mix_rgb background foreground 9% }};
  --z-bg-3: {{ mix_rgb background foreground 14% }};
  --z-bg-4: {{ mix_rgb background foreground 30% }};

  --z-fg: {{ foreground_rgb }};
  --z-fg-1: {{ foreground_rgb }};
  --z-fg-2: {{ mix_rgb foreground background 18% }};
  --z-grey-2: {{ mix_rgb foreground background 30% }};
  --z-grey-1: {{ mix_rgb foreground background 42% }};
  --z-grey-0: {{ mix_rgb foreground background 54% }};
  --z-grey-dim: {{ mix_rgb foreground background 68% }};

  --z-accent: {{ accent_rgb }};
  --z-accent-soft: {{ mix_rgb accent foreground 25% }};
  --z-accent-muted: {{ mix_rgb accent background 30% }};

  --z-red: {{ red_rgb }};
  --z-green: {{ green_rgb }};
  --z-yellow: {{ yellow_rgb }};
  --z-blue: {{ blue_rgb }};
  --z-purple: {{ magenta_rgb }};
  --z-aqua: {{ cyan_rgb }};

  --z-shadow: {{ darker_background_rgb }};
  --z-glass-a1: 0.58;
  --z-glass-a2: 0.46;
  --z-glass-a3: 0.32;
  --z-glass-a4: 0.22;
}

::selection {
  background: {{ selection_background }};
  color: {{ selection_foreground }};
}
