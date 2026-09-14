# MiKaDiv-FM — Raw Sources

The authoritative source for all of this is BZSt's own public download
page — check there first for updates, not any assembled/forwarded copy:
https://www.bzst.de/DE/Unternehmen/Kapitalertraege/Mitteilungsverfahren_MiKaDiv/Mitteilungsverfahren_MiKaDiv/mitteilungsverfahren_mikadiv_node.html

**Status: committed, current as of the `xsd_mikadiv_fm.zip` v8 /
`khb_mikadiv_fm.pdf` v9 release fetched 2026-09-14.**

## `xsd/` — the real XSD package (from `xsd_mikadiv_fm.zip`, v8)

Twelve real schema files plus one shared datatype dependency, all
version `1.02`:

- `MiKaDiv_FM_1.02.xsd` — the real entry point, ties the rest together.
- Five Meldearten (report types): `MiKaDiv_FM_Meldeart11_1.02.xsd`,
  `..Meldeart13_1.02.xsd`, `..Meldeart21_1.02.xsd`,
  `..Meldeart22_1.02.xsd`, `..Meldeart23_1.02.xsd` — these are not
  interchangeable/redundant; each is presumed to correspond to a
  distinct §45b Abs. 4/5/6 reporting scenario (domestic/foreign/
  fallback — see the MiKaDiv Cheatsheet referenced in
  `/work/openfaster-restructuring/STATUS.md`'s decision log), not yet
  confirmed which is which.
- `MiKaDiv_FM_MeldeartenSonder_1.02.xsd`, `..MeldeartErg_1.02.xsd` —
  special/supplementary report types.
- Shared type libraries: `MiKaDiv_FM_Standardtypen_1.02.xsd`,
  `..MeldeartenBasis_1.02.xsd`, `..Fachtypen_1.02.xsd`,
  `..Personentypen_1.02.xsd`.
- `din-norm-91379-datatypes.xsd` — DIN SPEC 91379 (German standard for
  special-character normalization in official registers), imported by
  the above for name/address-type fields.

Confirmed by loading the real entry point via `xmlschema`: 123 real
`xs:element` declarations across the family, zero `xs:assert`/
`xs:assertion`/`xs:any`/`xs:anyAttribute` anywhere (the equivalence
checker's guardrail precondition holds), and pervasive
`xs:complexContent`/`xs:extension` (type inheritance) — a real
structural feature not yet modeled by the `xsdo:` vocabulary or the
equivalence checker's `structural_cases.py`, to be accounted for when
extraction logic is designed.

## `khb/` — official communication-manual and guidance PDFs

- `khb_mikadiv_fm_de_v9.pdf` / `khb_mikadiv_fm_en_v3.pdf` — the
  Kommunikationshandbuch itself (German/English).
- `khb_mikadiv_fm_anlage_de_v8.pdf` / `khb_mikadiv_fm_anlage_en_v3.pdf`
  — "Technische Beschreibung des Datensatzes" (technical field-level
  description), the likely primary source for business-rule/
  conditional-mandatory logic not visible in the XSDs alone.
  German version substantially newer (v8) than English (v3) — treat
  German as authoritative if they ever disagree.
- `einzelfragen_datenuebermittlung_de_v8.pdf` /
  `individual_questions_en_v1.pdf` — "Einzelfragen zur
  Datenübermittlung" (individual clarifying questions), likely another
  real source of business-rule edge cases. German substantially newer
  (v8 vs v1).
- `verfahrensleitende_hinweise_v8.pdf` — procedural guidance notes.
- `ausstellung_steuerbescheinigung_v7.pdf` — guidance specifically on
  issuing tax certificates.

**Not fetched**: `leitfaden_anbindungstest.pdf` (connection/test-
environment guide — about the ELMA5 transport layer, not the data
model itself, out of scope for this repo) and the MiKaDiv-FB-specific
downloads on the same page (`khb_mikadiv_fb*`, `xsd_mikadiv_fb.zip`) —
FB is a different legal basis (§45b Abs. 9) and explicitly parked, per
`/work/openfaster-restructuring/STATUS.md`.
