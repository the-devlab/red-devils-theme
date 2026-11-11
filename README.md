# Red Devils

A bold dark theme for VS Code in red, gold and black. Made by The DevLab.

<!-- TODO: add a screenshot: ![Red Devils screenshot](images/screenshot.png) -->

## Install

1. Open the Extensions view (`Ctrl+Shift+X` / `Cmd+Shift+X`).
2. Search for **Red Devils** and click **Install**.
3. Open the Command Palette, run **Preferences: Color Theme** and pick a variant.

## Variants

| Theme | Style |
|---|---|
| **Red Devils** | Dark, with a red status bar and gold highlights. |
| **Red Devils Light** | White background, red accents and a black status bar. |
| **Red Devils Blackout** | Near-black throughout, with a dark red status bar. |

## Palette (Red Devils)

| Role | Colour |
|---|---|
| Background | `#1A1A1A` |
| Sidebar & panels | `#141414` |
| Text | `#E8E8E8` |
| Red (accents, status bar) | `#DA291C` |
| Light red (keywords) | `#FF5A4E` |
| Gold (functions, cursor) | `#FBE122` |
| Muted gold (numbers, constants) | `#D4AF37` |
| Comments | `#7A7A7A` |

## Development

Press F5 in VS Code to open a test window with sample files. The Blackout variant is generated from the main theme; after changing `themes/red-devils-color-theme.json`, run:

```powershell
powershell -File scripts/make-blackout.ps1
```

## Feedback

Spotted something that looks off in your language? Open an issue with a screenshot.

## License

MIT
