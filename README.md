# StitchFoundry fonts

Embroidery fonts for [StitchFoundry](https://github.com/SiteSentrix/StitchFoundry): lettering
fonts digitized from openly licensed typefaces with StitchFoundry's font creator.

> **Status: generated, not yet sew-tested.** Each font was digitized automatically (satin where
> a stroke is thin enough, tatami fill where it is wide) and checked on screen only. Sew a test
> of each at the sizes you use before production work, and refine glyphs in StitchFoundry's font
> editor (Embroidery › Edit Embroidery Font) where needed.

| Font | Digitized from | Suits | Sizes (capitals) | Notes |
|---|---|---|---|---|
| Foundry Block | Anton | Bold block letters; 3D puff from 20 mm | 10–62 mm | |
| Foundry Varsity | Graduate | Team names and numbers | 12.5–75 mm | |
| Foundry Script | Pacifico | Thick rounded script | 15–62 mm | |
| Foundry Slab | Alfa Slab One | Heavy slab serif | 12.5–62 mm | Round parts of 2, 6, c, z want tidying |
| Foundry Sans | Open Sans Bold | Small, clean text | 5–30 mm | Thin strokes want a sew test before use |

Previews of each font's stitches are in [`previews/`](previews).

## Using them

In StitchFoundry: **Embroidery Lettering › Load Embroidery Font…** and pick a folder under
`fonts/` (or `embroidery.font.load {path}`). Loaded folders are remembered for later sessions.

## Making them again

`generate.sh` digitizes every font from its typeface with `stitchfoundry-cli` (the typefaces
must be installed: they are on Google Fonts, under the SIL Open Font License):

```sh
CLI=path/to/stitchfoundry-cli ./generate.sh
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
`LICENSE`). Where a typeface has Reserved Font Names (Graduate; Alfa Slab), the derived font does
not use them. The script and documentation are MIT OR Apache-2.0. See [`ATTRIBUTION.md`](ATTRIBUTION.md).
