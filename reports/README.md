# YAML-LD implementation reports

This directory collects individual [EARL reports](https://www.w3.org/TR/EARL10-Schema/)
for YAML-LD processors. The committed `index.html` is a consolidated, manually
generated report.

## Submitting results

Submit a Turtle file in this directory through a pull request to
[`w3c/yaml-ld`](https://github.com/w3c/yaml-ld). It must describe the processor
as a `doap:Project` and include an automatic `earl:Assertion` for each test it
ran. Each assertion must identify its test with the public YAML-LD manifest IRI,
state its observed outcome, and include the execution timestamp.

Tests whose options contain `normative: false` exercise Extended Profile
behavior. They remain visible in the report but are excluded from Basic Profile
compliance totals.

## Regenerating the report

Run the commands below from this directory after adding or updating a submitted
Turtle file:

```sh
gem install earl-report
rm -f manifests.nt
rake manifests.nt
earl-report --format json -o earl.jsonld *.ttl
earl-report --json --format html --template template.haml -o index.html earl.jsonld
```

Commit the regenerated `manifests.nt`, `earl.jsonld`, and `index.html` with the
submitted Turtle file.
