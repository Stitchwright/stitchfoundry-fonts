#!/bin/sh
# Renders a stitch preview of each font: previews/<folder>.png, a name and the alphabet.
# Usage: CLI=path/to/stitchfoundry-cli ./preview.sh [folder…]
set -eu
CLI="${CLI:-stitchfoundry-cli}"
here="$(cd "$(dirname "$0")" && pwd)"
cd "$here/fonts"
for folder in ${*:-*}; do
  [ -f "$folder/font.json" ] || continue
  name=$(sed -n 's/.*"name": *"\([^"]*\)".*/\1/p' "$folder/font.json" | head -1)
  "$CLI" run \
    --cmd embroidery.font.load --params "{\"path\":\"$here/fonts/$folder\"}" \
    --cmd embroidery.newDesign --params '{"hoop":{"width":300,"height":200}}' \
    --cmd embroidery.lettering --params "{\"text\":\"Grandma Rose 2026\\nABCDEFGHIJKLM\\nNOPQRSTUVWXYZ\\nabcdefghijklm\\nnopqrstuvwxyz & !?\",\"font\":\"$name\",\"size\":15}" \
    --cmd embroidery.exportImage --params "{\"path\":\"$here/previews/$folder.png\",\"ppmm\":4}" > /dev/null
  echo "$folder"
done
