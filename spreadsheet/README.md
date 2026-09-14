# Spreadsheet Ontology (`SSO:`)

Part of [OpenFASTER Ontologies](../README.md). An OWL vocabulary for
spreadsheet structure -- a raw cell grid plus an optional semantic layout
layer, independent of any domain (no guaranteed header row, no guaranteed
column meaning assumed).

**Status: skeleton only, no classes curated yet.**

Hand-edit `src/spreadsheet-edit.ofn` directly (OWL Functional Syntax,
diff-friendly — never machine-round-tripped). Build/verify with
`../scripts/build-module.sh spreadsheet spreadsheet spreadsheet-ontology`
from the repo root.
