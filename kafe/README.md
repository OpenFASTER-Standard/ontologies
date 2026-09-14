# KaFE

Part of [OpenFASTER Ontologies](../README.md). Covers BZSt's real
Kapitalertragsteuer-Erstattung (KaFE) refund-application procedure.

**Status: skeleton only, no content curated in any layer yet.** Each layer
below is scaffolded (its own directory + `README.md`) but empty.

This module, like `mikadiv-vib/` and `mikadiv-fm/`, is split into five
layers rather than a single flat ontology:

- `concepts/` (`KFO:`) -- the semantic layer: domain classes/properties,
  no serialization facets.
- `structure/` -- `XSDO:`-typed structural facts (element nesting,
  occurrence, per-type facets) realizing the concepts against KaFE's
  request/RM/VA XSDs.
- `rules/` -- real conditional-mandatory business logic from the KaFE
  Kurzhandbuch (KHB), not expressible in the XSDs alone.
- `sources/` -- the raw source documents (XSDs, KHB, status/error catalog)
  these layers are built from, committed directly.
- `abox/` -- real/synthetic instance data (submitted-document graphs).

Build/verify a layer with
`../scripts/build-module.sh kafe/<layer> <name> <name>` from the repo root
(e.g. `../scripts/build-module.sh kafe/concepts kafe-concepts
kafe-concepts`).
