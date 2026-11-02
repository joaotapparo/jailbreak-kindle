#!/usr/bin/env bash
# Converte imagens para screensaver do KOReader: recorta do centro para
# preencher a tela, converte para tons de cinza e salva como PNG.
# Usa apenas o `sips` nativo do macOS.
#
# Uso: scripts/prepare-screensavers.sh <pasta-origem> <pasta-destino> [largura] [altura]
# Padrão: 600x800 (Kindle básico 10ª geração).
set -euo pipefail

SRC="${1:?pasta de origem}"
OUT="${2:?pasta de destino}"
W="${3:-600}"
H="${4:-800}"
GRAY="/System/Library/ColorSync/Profiles/Generic Gray Gamma 2.2 Profile.icc"

mkdir -p "$OUT"
i=1
shopt -s nullglob nocaseglob
for f in "$SRC"/*.{png,jpg,jpeg}; do
  w=$(sips -g pixelWidth "$f" | awk '/pixelWidth/{print $2}')
  h=$(sips -g pixelHeight "$f" | awk '/pixelHeight/{print $2}')
  o=$(printf "%s/screensaver_%02d.png" "$OUT" "$i")
  if [ $((w * H)) -gt $((h * W)) ]; then
    sips -s format png --resampleHeight "$H" "$f" --out "$o" >/dev/null
  else
    sips -s format png --resampleWidth "$W" "$f" --out "$o" >/dev/null
  fi
  sips --cropToHeightWidth "$H" "$W" -m "$GRAY" "$o" --out "$o" >/dev/null
  echo "✓ $(basename "$f") -> $(basename "$o")"
  i=$((i + 1))
done
echo "Pronto: $((i - 1)) imagens em $OUT"
