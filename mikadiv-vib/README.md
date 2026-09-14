# MiKaDiv-VIB

Part of [OpenFASTER Ontologies](../README.md). Covers MiKaDiv-VIB,
Clearstream's third-party-disclosure collection format -- it has no
independent legal grounding of its own (see `../mikadiv-fm/` for the real
Mitteilungsverfahren it feeds into).

**Status: skeleton only, no content curated in any layer yet.** Each layer
below is scaffolded (its own directory + `README.md`) but empty.

This module, like `mikadiv-fm/` and `kafe/`, is split into five layers
rather than a single flat ontology:

- `concepts/` (`MVO:`) -- the semantic layer: domain classes/properties,
  no serialization facets.
- `structure/` -- `XSDO:`-typed structural facts (element nesting,
  occurrence, per-type facets) realizing the concepts against VIB's actual
  XSDs.
- `rules/` -- cross-field conditional-mandatory business logic not
  expressible in the XSDs alone.
- `sources/` -- the raw source documents (XSDs, handbooks) these layers
  are built from, committed directly.
- `abox/` -- real/synthetic instance data (submitted-document graphs).

Build/verify a layer with
`../scripts/build-module.sh mikadiv-vib/<layer> <name> <name>` from the
repo root (e.g. `../scripts/build-module.sh mikadiv-vib/concepts
mikadiv-vib-concepts mikadiv-vib-concepts`).
