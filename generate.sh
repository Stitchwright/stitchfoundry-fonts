#!/bin/sh
# Generates the embroidery fonts from their typefaces with StitchFoundry's font creator.
# Usage: CLI=path/to/stitchfoundry-cli ./generate.sh [folder…]   (the typefaces must be installed;
# with folders, only those fonts are made again)
set -eu
CLI="${CLI:-stitchfoundry-cli}"
here="$(cd "$(dirname "$0")" && pwd)"

# folder | family | style | name | size mm | space mm (empty: the typeface's own) | min scale | max scale | description | tatami
# (tatami: every glyph a tatami fill at 45°, for heavy faces whose curves are too wide to satin)
fonts='foundry-block|Anton|Regular|Foundry Block|25|7|0.4|2.5|Bold condensed block letters, digitized from Anton. Sews cleanly from 10 mm; suits 3D puff from 20 mm.
foundry-varsity|Graduate|Regular|Foundry Varsity|25|8|0.5|3|Collegiate block letters for team names and numbers, digitized from Graduate.
foundry-script|Pacifico|Regular|Foundry Script|25|6|0.6|2.5|A thick, rounded script, digitized from Pacifico. Best from 15 mm, where its joins stay sewable.
foundry-slab|Alfa Slab One|Regular|Foundry Slab|25|8|0.5|2.5|A heavy slab serif, digitized from Alfa Slab One.|tatami
foundry-sans|Open Sans|Bold|Foundry Sans|10|3|0.5|3|A clean bold sans for small text from 5 mm, digitized from Open Sans.
foundry-elegant|Great Vibes|Regular|Foundry Elegant|25||0.6|2.5|A flowing formal script for names, weddings and monograms, digitized from Great Vibes. Best from 15 mm.
foundry-dance|Dancing Script|Bold|Foundry Dance|25||0.5|2.5|A lively bouncing script, digitized from Dancing Script Bold.
foundry-retro-script|Lobster|Regular|Foundry Retro Script|25||0.5|2.5|A bold retro script with joined letters, digitized from Lobster.
foundry-casual|Cookie|Regular|Foundry Casual|25||0.6|2.5|A relaxed, rounded handwritten script, digitized from Cookie.
foundry-brush|Kaushan Script|Regular|Foundry Brush|25||0.5|2.5|A brush-pen script with energy, digitized from Kaushan Script.
foundry-wedding|Allura|Regular|Foundry Wedding|25||0.7|2.5|A fine calligraphic script for weddings and keepsakes, digitized from Allura. Its hairlines want 18 mm and up.
foundry-flourish|Alex Brush|Regular|Foundry Flourish|25||0.7|2.5|A calligraphic script with flourished capitals, digitized from Alex Brush.
foundry-signature|Damion|Regular|Foundry Signature|25||0.5|2.5|A bold sporty signature script, digitized from Damion.
foundry-friendly|Courgette|Regular|Foundry Friendly|25||0.5|2.5|A friendly upright semi-script, digitized from Courgette.
foundry-classic|Playfair Display|Bold|Foundry Classic|25||0.6|2.5|A high-contrast classic serif, digitized from Playfair Display Bold.
foundry-roman|Cinzel|Bold|Foundry Roman|25||0.5|3|Roman capitals with small capitals for lower case, digitized from Cinzel Bold. Good for monograms and plaques.
foundry-monogram|Cinzel Decorative|Bold|Foundry Monogram|25||0.6|4|Decorated Roman capitals for monograms and initials, digitized from Cinzel Decorative Bold.
foundry-book|Merriweather|Bold|Foundry Book|25||0.5|2.5|A sturdy readable serif, digitized from Merriweather Bold.
foundry-fat-serif|Abril Fatface|Regular|Foundry Fat Serif|25||0.6|2.5|A heavy display serif, digitized from Abril Fatface.
foundry-library|Libre Baskerville|Bold|Foundry Library|25||0.5|2.5|A traditional book serif, digitized from Libre Baskerville Bold.
foundry-geo|Montserrat|Bold|Foundry Geo|25||0.4|3|A clean geometric sans for logos and names, digitized from Montserrat Bold.
foundry-condensed|Oswald|Bold|Foundry Condensed|25||0.4|3|A tall condensed sans that fits long names, digitized from Oswald Bold.
foundry-poster|Bebas Neue|Regular|Foundry Poster|25||0.4|3|Tall condensed capitals for headlines and team names, digitized from Bebas Neue.
foundry-modern|Raleway|Bold|Foundry Modern|25||0.5|3|An elegant modern sans, digitized from Raleway Bold.
foundry-round|Poppins|Bold|Foundry Round|25||0.4|3|A round friendly geometric sans, digitized from Poppins Bold.
foundry-small|Lato|Bold|Foundry Small|10||0.5|3|A sans for small lettering from 5 mm (labels, sleeves, caps), digitized from Lato Bold.
foundry-bubble|Fredoka|Bold|Foundry Bubble|25||0.4|3|Soft rounded letters for children’s things, digitized from Fredoka Bold.
foundry-comic|Bangers|Regular|Foundry Comic|25||0.4|3|Comic-book capitals, digitized from Bangers.
foundry-playful|Baloo 2|Bold|Foundry Playful|25||0.4|3|A chubby, playful sans, digitized from Baloo 2 Bold.
foundry-retro|Righteous|Regular|Foundry Retro|25||0.4|3|A rounded retro display face, digitized from Righteous.
foundry-sign|Bungee|Regular|Foundry Sign|25||0.4|3|Bold signage capitals, digitized from Bungee.
foundry-chunky|Lilita One|Regular|Foundry Chunky|25||0.4|3|A chunky soft display face, digitized from Lilita One.
foundry-western|Rye|Regular|Foundry Western|25||0.6|3|Wild-west woodtype letters, digitized from Rye.
foundry-stencil|Black Ops One|Regular|Foundry Stencil|25||0.5|3|A military stencil face, digitized from Black Ops One.
foundry-athletic|Staatliches|Regular|Foundry Athletic|25||0.4|3|Squared athletic capitals for jerseys, digitized from Staatliches.
foundry-gothic|UnifrakturMaguntia|Book|Foundry Gothic|25||0.6|3|A blackletter (Old English) face, digitized from UnifrakturMaguntia.
foundry-blackletter|Pirata One|Regular|Foundry Blackletter|25||0.5|3|A condensed modern blackletter, digitized from Pirata One.
foundry-tech|Russo One|Regular|Foundry Tech|25||0.4|3|A squared techno sans, digitized from Russo One.
foundry-heavy|Archivo Black|Regular|Foundry Heavy|25||0.4|3|A very heavy grotesque sans, digitized from Archivo Black.'

only=" $* "
echo "$fonts" | while IFS='|' read -r folder family style name size space min max desc tatami; do
  if [ "$only" != "  " ] && [ "${only#* $folder }" = "$only" ]; then continue; fi
  out="$here/fonts/$folder"
  mkdir -p "$out"
  # the generated files only: the folder keeps its OFL.txt
  rm -f "$out/font.json" "$out/glyphs.stitchfoundry"
  # a heavy face: every glyph one tatami fill at a fixed 45° (its wide curves would fan as satin)
  set --
  if [ "${tatami:-}" = tatami ]; then
    set -- --cmd select.all --cmd embroidery.set --params '{"type":"fill"}' \
      --cmd embroidery.setParams --params '{"params":{"kind":"Tatami","auto_direction":false,"angle":45}}'
  fi
  "$CLI" run \
    --cmd embroidery.fontDoc.fromType \
    --params "{\"family\":\"$family\",\"style\":\"$style\",\"name\":\"$name\",\"size\":$size}" \
    "$@" \
    --cmd embroidery.fontDoc.setProps \
    --params "{${space:+\"space\":$space,}\"minScale\":$min,\"maxScale\":$max,\"license\":\"OFL-1.1\",\"description\":\"$desc Generated, not yet sew-tested.\"}" \
    --cmd embroidery.fontDoc.save --params "{\"folder\":\"$out\"}" > "$here/fonts/$folder.log"
  echo "$name: $(grep -o '"glyphs":[0-9]*' "$here/fonts/$folder.log" | tail -1)"
done
