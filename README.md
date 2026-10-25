# StitchFoundry fonts

Embroidery fonts for [StitchFoundry](https://github.com/Stitchwright/StitchFoundry): lettering
fonts digitized from openly licensed typefaces with StitchFoundry's font creator. The 39 Foundry
fonts under `fonts/` are built into the desktop app (the web app has the ten `fonts/web.txt` names).

> **Status: generated, not yet sew-tested.** Each font was digitized automatically (satin where
> a stroke is thin enough, tatami fill where it is wide) and checked on screen only. Sew a test
> of each at the sizes you use before production work, and refine glyphs in StitchFoundry's font
> editor (Embroidery › Edit Embroidery Font) where needed.

| Font | Digitized from | Suits | Sizes (capitals) | Notes |
|---|---|---|---|---|
| Foundry Block | Anton | Bold block letters; 3D puff from 20 mm | 10–62 mm | |
| Foundry Varsity | Graduate | Team names and numbers | 12.5–75 mm | |
| Foundry Script | Pacifico | Thick rounded script | 15–62 mm | |
| Foundry Slab | Alfa Slab One | Heavy slab serif | 12.5–62 mm | All tatami at 45° (its curves are too wide to satin) |
| Foundry Sans | Open Sans Bold | Small, clean text | 5–30 mm | Thin strokes want a sew test before use |
| Foundry Elegant | Great Vibes | A flowing formal script for names, weddings and monograms | 15–62.5 mm | |
| Foundry Dance | Dancing Script (Bold) | A lively bouncing script | 12.5–62.5 mm | |
| Foundry Retro Script | Lobster | A bold retro script with joined letters | 12.5–62.5 mm | |
| Foundry Casual | Cookie | A relaxed, rounded handwritten script | 15–62.5 mm | |
| Foundry Brush | Kaushan Script | A brush-pen script with energy | 12.5–62.5 mm |No apostrophe (the typeface has none) |
| Foundry Wedding | Allura | A fine calligraphic script for weddings and keepsakes | 17.5–62.5 mm | |
| Foundry Flourish | Alex Brush | A calligraphic script with flourished capitals | 17.5–62.5 mm | |
| Foundry Signature | Damion | A bold sporty signature script | 12.5–62.5 mm | |
| Foundry Friendly | Courgette | A friendly upright semi-script | 12.5–62.5 mm | |
| Foundry Classic | Playfair Display (Bold) | A high-contrast classic serif | 15–62.5 mm | |
| Foundry Roman | Cinzel (Bold) | Roman capitals with small capitals for lower case | 12.5–75 mm | |
| Foundry Monogram | Cinzel Decorative (Bold) | Decorated Roman capitals for monograms and initials | 15–100 mm | |
| Foundry Book | Merriweather (Bold) | A sturdy readable serif | 12.5–62.5 mm | |
| Foundry Fat Serif | Abril Fatface | A heavy display serif | 15–62.5 mm | |
| Foundry Library | Libre Baskerville (Bold) | A traditional book serif | 12.5–62.5 mm | |
| Foundry Geo | Montserrat (Bold) | A clean geometric sans for logos and names | 10–75 mm | |
| Foundry Condensed | Oswald (Bold) | A tall condensed sans that fits long names | 10–75 mm | |
| Foundry Poster | Bebas Neue | Tall condensed capitals for headlines and team names | 10–75 mm | |
| Foundry Modern | Raleway (Bold) | An elegant modern sans | 12.5–75 mm | |
| Foundry Round | Poppins (Bold) | A round friendly geometric sans | 10–75 mm | |
| Foundry Small | Lato (Bold) | A sans for small lettering from 5 mm (labels, sleeves, caps) | 5–30 mm | |
| Foundry Bubble | Fredoka (Bold) | Soft rounded letters for children’s things | 10–75 mm | |
| Foundry Comic | Bangers | Comic-book capitals | 10–75 mm | |
| Foundry Playful | Baloo 2 (Bold) | A chubby, playful sans | 10–75 mm | |
| Foundry Retro | Righteous | A rounded retro display face | 10–75 mm | |
| Foundry Sign | Bungee | Bold signage capitals | 10–75 mm | |
| Foundry Chunky | Lilita One | A chunky soft display face | 10–75 mm | |
| Foundry Western | Rye | Wild-west woodtype letters | 15–75 mm | |
| Foundry Stencil | Black Ops One | A military stencil face | 12.5–75 mm | |
| Foundry Athletic | Staatliches | Squared athletic capitals for jerseys | 10–75 mm | |
| Foundry Gothic | UnifrakturMaguntia | A blackletter (Old English) face | 15–75 mm | |
| Foundry Blackletter | Pirata One | A condensed modern blackletter | 12.5–75 mm | |
| Foundry Tech | Russo One | A squared techno sans | 10–75 mm | |
| Foundry Heavy | Archivo Black | A very heavy grotesque sans | 10–75 mm | |

Previews of each font's stitches are in [`previews/`](previews).

## Using them

In StitchFoundry: **Embroidery Lettering › Load Embroidery Font…** and pick a folder under
`fonts/` (or `embroidery.font.load {path}`). Loaded folders are remembered for later sessions.

## Making them again

`generate.sh` digitizes every font from its typeface with `stitchfoundry-cli` (the typefaces
must be installed: they are on Google Fonts, under the SIL Open Font License), and
`preview.sh` renders `previews/<folder>.png` for each; name folders to do only those:

```sh
CLI=path/to/stitchfoundry-cli ./generate.sh [folder…]
CLI=path/to/stitchfoundry-cli ./preview.sh [folder…]
```


## Ink/Stitch fonts

[`inkstitch/`](inkstitch) holds 131 fonts from the Ink/Stitch project's collection
(https://github.com/inkstitch/embroidery-fonts), copied unchanged, each with its own `LICENSE`:
102 under the SIL Open Font License, 26 under Creative Commons Attribution(-ShareAlike), 3 in the
public domain. They are digitized by hand and sew-tested by their authors. Load one the same way
(a folder under `inkstitch/`). Fonts whose licences forbid commercial use or changes are left
out; see [`ATTRIBUTION.md`](ATTRIBUTION.md).

## Licence

The Foundry fonts are under the SIL Open Font License 1.1, as the typefaces they were digitized
from: see each one's `OFL.txt`. The Ink/Stitch fonts keep their own licences (each folder's
`LICENSE`). Where a typeface has Reserved Font Names (Graduate, Alfa Slab, Lobster, Cookie, Courgette,
Playfair Display, Cinzel, Merriweather, Abril, Libre Baskerville, Raleway, Lato, Righteous, Rye,
UnifrakturMaguntia, Pirata, Russo, Dancing Script), the derived font does not use them: every
Foundry font has a name of its own. The script and documentation are MIT OR Apache-2.0. See [`ATTRIBUTION.md`](ATTRIBUTION.md).
