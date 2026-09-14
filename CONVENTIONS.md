# Authoring Conventions

This repo consolidates several previously separate ontology repos
(`institutional-ontology` and others, now deleted). Four authoring
conventions from those repos are being kept here -- re-affirmed rather
than silently dropped in the move. This file is their new, single home;
nothing else in this repo documents them in full.

## 1. Hand-edit OWL Functional Syntax; ROBOT for build/reason/report

Every ontology module's source of truth is a hand-edited `.ofn` file
(OWL Functional Syntax) under that module's `src/` directory -- never a
machine-round-tripped format like RDF/XML or Turtle, and never edited via
a GUI ontology editor. Functional Syntax is line-oriented and diff-friendly,
so a curator's actual change shows up as a small, reviewable diff instead
of a reshuffled serialization. The [ROBOT](http://robot.obolibrary.org/)
CLI is the only tool that touches the built artifact: `robot merge` to
produce the release `.owl` file, `robot report` to catch common OBO
modeling mistakes before they're committed, and `robot reason` (via the
ELK reasoner) to verify the ontology is at least consistent and produce a
classified view. `scripts/build-module.sh` wraps all three so a module's
build is always run the same way, and per-module `README.md`s already
state this convention explicitly.

## 2. One `rdfs:label` per class; `IAO:0000118` for alternates

Every class gets exactly one `rdfs:label` -- the canonical English name a
curator would use when talking about the term. Any additional name for the
same class (a translation, a historical/deprecated name, an abbreviation
someone might search for) is asserted as `IAO:0000118` ("alternative
term"), never as a second `rdfs:label`. This matters beyond style: tools
that render a term's display name (including the WIDOCO docs generator
`purl`'s own README describes) assume a single `rdfs:label` per subject and
pick one arbitrarily if there are several, which produces inconsistent
output across regenerations. Keeping exactly one `rdfs:label` and pushing
everything else onto `IAO:0000118` keeps that rendering deterministic.

## 3. `IAO:0000115` / `IAO:0000116` / `IAO:0000119` as three distinct annotations

A curated class carries up to three separate textual annotations, and they
are not interchangeable:

- `IAO:0000115` -- the **definition** itself: the actual genus-differentia
  (or equivalent) text defining the term.
- `IAO:0000116` -- **curator justification**: the curator's own reasoning
  for why the term is modeled the way it is (why this superclass, why this
  boundary, what alternative was rejected and why) -- notes for the next
  curator, not part of the definition itself.
- `IAO:0000119` -- **definition source**: a citation for where the
  definition's content actually came from (a handbook section, a legal
  paragraph, an external standard), kept separate so the provenance of a
  definition can be checked or updated independently of the definition
  text or the curator's reasoning about it.

Keeping these three separate, rather than folding justification or
sourcing into the definition text itself, is what makes it possible to
later audit "where did this definition's wording come from" and "why was
it modeled this way" as two different questions with two different
answers.

## 4. Opaque, zero-padded, sequential IDs per ontology, never recycled

Every class/property gets an opaque numeric ID local to its own ontology's
prefix (e.g. `XSDO:0000001`, `MFO:0000042`) -- never a human-readable
fragment (no `XSDO:ElementDeclaration`-as-IRI-suffix) and never an ID that
encodes meaning (no category-coded ranges). IDs are zero-padded to a fixed
width and assigned strictly sequentially as terms are added, tracked
per-ontology (each module's ID counter is independent of every other
module's). Once an ID is assigned, it is never reused, even if the term it
named is later deprecated or deleted -- a deprecated term is marked
deprecated in place (and its ID retired permanently), not removed and its
number handed to a new, unrelated term. This is standard OBO Foundry
practice and exists for the same reason it does there: an ID is a
permanent identifier third parties may already be referencing, so its
meaning must never silently change out from under them.
