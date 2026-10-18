# ZenNotes Omarchy Theme

A [ZenNotes](https://github.com/ZenNotes/zennotes) theme that follows your
current [Omarchy](https://omarchy.org) theme. Switch themes in Omarchy and
ZenNotes recolors itself live, light and dark included.

## Install

Requires Omarchy 4+ (themes defined by `colors.toml`) and ZenNotes launched at
least once.

```bash
git clone https://github.com/phoscoder/zennotes-omarchy-theme.git
cd zennotes-omarchy-theme
./install.sh
```

The installer backs up `~/.config/zennotes/config.toml` and selects the theme.
Pass `--no-select` to install without selecting it; you can then pick
**Omarchy** under **Settings → Appearance → Custom themes**.

To remove it, run `./uninstall.sh`.

## How it works

- `themed/zennotes.css.tpl` is copied to `~/.config/omarchy/themed/`. Omarchy
  renders it from the active theme's `colors.toml` on every theme change, the
  same way it themes terminals, btop and Obsidian.
- `hooks/zennotes-omarchy.sh` is installed as a `theme-set` hook. It copies the
  rendered CSS to `~/.config/zennotes/themes/omarchy/`, converts colors to the
  space-separated RGB that ZenNotes tokens use, writes a `manifest.json` with
  the theme's accent as its swatch, and sets ZenNotes' light/dark mode to
  match. It only touches the mode while Omarchy is the selected ZenNotes
  theme.

## Color mapping

| ZenNotes token          | Omarchy color                         |
|-------------------------|---------------------------------------|
| `--z-bg`                | `background`                          |
| `--z-bg-softer`         | `background` toward `dark_background` |
| `--z-bg-1` … `--z-bg-4` | `background` blended toward `foreground` |
| `--z-fg`, `--z-fg-1`    | `foreground`                          |
| `--z-fg-2`, greys       | `foreground` blended toward `background` |
| `--z-accent`            | `accent`                              |
| `--z-red` … `--z-aqua`  | `red`, `green`, `yellow`, `blue`, `magenta`, `cyan` |
| `::selection`           | `selection_background` / `selection_foreground` |

Shades are blends rather than fixed palette slots, so themes that leave
optional colors undefined still get a readable result.

To tweak the mapping, edit `~/.config/omarchy/themed/zennotes.css.tpl` and run
`omarchy theme refresh`. Don't edit the copy inside ZenNotes; the hook
overwrites it on every theme change.
