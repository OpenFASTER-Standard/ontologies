# Institutional Ontology (`IO:`)

Part of [OpenFASTER Ontologies](../README.md). A controlled vocabulary of
formal/administrative ("institutional," in Searle's sense) concepts,
domain-agnostic by design.

**Status: skeleton only, no classes curated yet. Deliberately stays thin —
this ontology grows only via a later, separate alignment pass connecting
it to module concepts (`mikadiv-vib`/`mikadiv-fm`/`kafe`), never as a
side effect of authoring those modules.**

Hand-edit `src/institutional-edit.ofn` directly (OWL Functional Syntax,
diff-friendly — never machine-round-tripped). Build/verify with
`../scripts/build-module.sh institutional institutional institutional-ontology`
from the repo root.
