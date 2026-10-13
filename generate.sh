#!/bin/sh
# Generates the embroidery fonts from their typefaces with StitchFoundry's font creator.
# Usage: CLI=path/to/stitchfoundry-cli ./generate.sh   (the typefaces must be installed)
set -eu
CLI="${CLI:-stitchfoundry-cli}"
here="$(cd "$(dirname "$0")" && pwd)"

# folder | family | style | name | size mm | space mm | min scale | max scale | description
fonts='foundry-block|Anton|Regular|Foundry Block|25|7|0.4|2.5|Bold condensed block letters, digitized from Anton. Sews cleanly from 10 mm; suits 3D puff from 20 mm.
foundry-varsity|Graduate|Regular|Foundry Varsity|25|8|0.5|3|Collegiate block letters for team names and numbers, digitized from Graduate.
foundry-script|Pacifico|Regular|Foundry Script|25|6|0.6|2.5|A thick, rounded script, digitized from Pacifico. Best from 15 mm, where its joins stay sewable.
foundry-slab|Alfa Slab One|Regular|Foundry Slab|25|8|0.5|2.5|A heavy slab serif, digitized from Alfa Slab One.
foundry-sans|Open Sans|Bold|Foundry Sans|10|3|0.5|3|A clean bold sans for small text from 5 mm, digitized from Open Sans.'

echo "$fonts" | while IFS='|' read -r folder family style name size space min max desc; do
  out="$here/fonts/$folder"
  # the generated files only: the folder keeps its OFL.txt
  rm -f "$out/font.json" "$out/glyphs.stitchfoundry"
  "$CLI" run \
    --cmd embroidery.fontDoc.fromType \
    --params "{\"family\":\"$family\",\"style\":\"$style\",\"name\":\"$name\",\"size\":$size}" \
    --cmd embroidery.fontDoc.setProps \
    --params "{\"space\":$space,\"minScale\":$min,\"maxScale\":$max,\"license\":\"OFL-1.1\",\"description\":\"$desc Generated, not yet sew-tested.\"}" \
    --cmd embroidery.fontDoc.save --params "{\"folder\":\"$out\"}" > "$here/fonts/$folder.log"
  echo "$name: $(grep -o '"glyphs":[0-9]*' "$here/fonts/$folder.log" | tail -1)"
done
