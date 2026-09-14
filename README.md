# OpenFASTER Ontologies

Part of [OpenFASTER](https://openfaster.org). OWL/RDF vocabulary modules,
each independently versioned by directory (tag format `<module>/vX.Y.Z`).

## Modules

- `xsd/` -- XSD 1.1 Schema Component Model vocabulary (`XSDO:`)
- `xml/` -- concrete XML document/instance structure vocabulary (`XMLO:`)
- `spreadsheet/` -- spreadsheet structure vocabulary (`SSO:`)
- `institutional/` -- domain-agnostic institutional-fact concepts (`IO:`),
  deliberately kept thin; grows only via a later, separate alignment pass
- `mikadiv-vib/` -- MiKaDiv-VIB (Clearstream's third-party-disclosure
  collection format; no independent legal grounding of its own -- see
  `mikadiv-fm/`)
- `mikadiv-fm/` -- MiKaDiv-FM (BZSt's real Mitteilungsverfahren, Steuerbescheinigungen, §45b Abs. 1-6 + §45c EStG)
- `kafe/` -- KaFE Refund Application (BZSt's real Kapitalertragsteuer-Erstattung procedure)

Each module is built independently from its own `src/<name>-edit.ofn`
via `scripts/build-module.sh <module-dir> <name> <output-name>` (requires
the `robot` CLI on `PATH`).

Licensed [CC BY 4.0](LICENSE).
