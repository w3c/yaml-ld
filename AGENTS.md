# YAML-LD guidance

## Git branches

- Begin issue work with `gh issue develop <issue-id> --checkout`; use the resulting linked branch instead of choosing a name or prefix manually.

## Spec validation

- When changing `index.html`, validate the rendered ReSpec output with `make spec`.
- When changing `extended-profile/index.html`, validate the rendered ReSpec output with `make extended-profile`.
- Assume the repository Makefile works in the user's setup; prefer these targets over hand-written ReSpec commands.
