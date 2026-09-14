#!/usr/bin/env bash
# Usage: scripts/build-module.sh <module-dir> <edit-file-basename> <output-basename>
# e.g.:  scripts/build-module.sh xsd xsd xsd-ontology
#        (reads xsd/src/xsd-edit.ofn, writes xsd/xsd-ontology.owl)
# Three separate arguments, not derived from each other -- module-dir can
# be nested (e.g. "mikadiv-vib/concepts") while the edit-file and output
# basenames follow this repo's own hyphenated naming convention, and
# deriving one from another silently breaks the moment they diverge.
set -euo pipefail
MODULE_DIR="$1"
EDIT_BASENAME="$2"
OUTPUT_BASENAME="$3"
cd "$(dirname "$0")/.."

mkdir -p "$MODULE_DIR/build"
robot merge \
  --input "$MODULE_DIR/src/${EDIT_BASENAME}-edit.ofn" \
  --output "$MODULE_DIR/build/${OUTPUT_BASENAME}.owl"

robot report \
  --input "$MODULE_DIR/build/${OUTPUT_BASENAME}.owl" \
  --fail-on ERROR \
  --output "$MODULE_DIR/build/report.tsv"

robot reason \
  --input "$MODULE_DIR/build/${OUTPUT_BASENAME}.owl" \
  --reasoner ELK \
  --output "$MODULE_DIR/build/${OUTPUT_BASENAME}-reasoned.owl"

cp "$MODULE_DIR/build/${OUTPUT_BASENAME}.owl" "$MODULE_DIR/${OUTPUT_BASENAME}.owl"
echo "Built and verified: $MODULE_DIR/${OUTPUT_BASENAME}.owl"
