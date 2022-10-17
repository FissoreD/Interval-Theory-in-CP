(lang dune 3.4)

(name IntervalTheoryInCP)

(generate_opam_files true)

(source
 (github FissoreD/Interval-Theory-in-CP))

(authors "Fissore Davide")

(maintainers "Fissore Davide")

(license LICENSE)

(documentation https://github.com/FissoreD/Interval-Theory-in-CP)

(package
 (name IntervalTheoryInCP)
 (synopsis "A tool to evaluate CP over continue intervals")
 (description "A longer description")
 (depends ocaml dune)
 (tags
  (topics "to describe" your project)))

(using menhir 2.1)

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
