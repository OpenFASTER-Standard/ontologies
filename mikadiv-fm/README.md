# MiKaDiv-FM

Part of [OpenFASTER Ontologies](../README.md). Covers BZSt's real
Mitteilungsverfahren MiKaDiv (FM): Steuerbescheinigungen, §45b Abs. 1-6 +
§45c EStG.

**Status: skeleton only, no content curated in any layer yet.** Each layer
below is scaffolded (its own directory + `README.md`) but empty.

This module, like `mikadiv-vib/` and `kafe/`, is split into five layers
rather than a single flat ontology:

- `concepts/` (`MFO:`) -- the semantic layer: domain classes/properties,
  no serialization facets.
- `structure/` -- `XSDO:`-typed structural facts (element nesting,
  occurrence, per-type facets) realizing the concepts against FM's four
  real XSDs.
- `rules/` -- cross-field conditional-mandatory business logic from the
  real FM Kurzhandbuch (KHB), not expressible in the XSDs alone.
- `sources/` -- the raw source documents (XSDs, KHB) these layers are
  built from, committed directly.
- `abox/` -- real/synthetic instance data (submitted-document graphs).

Build/verify a layer with
`../scripts/build-module.sh mikadiv-fm/<layer> <name> <name>` from the
repo root (e.g. `../scripts/build-module.sh mikadiv-fm/concepts
mikadiv-fm-concepts mikadiv-fm-concepts`).
