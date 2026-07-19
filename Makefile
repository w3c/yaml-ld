YAML_PROCESSING_SVG := images/yaml-processing.svg
YAML_PROCESSING_SVG_URL := https://yaml.org/spec/1.2.2/img/overview2.svg

.PHONY: install
install:
	npm install -g respec

.PHONY: vendor-yaml-processing-diagram
vendor-yaml-processing-diagram:
	mkdir -p images
	curl -fsSL -A 'yaml-ld-makefile' -o $(YAML_PROCESSING_SVG) $(YAML_PROCESSING_SVG_URL)

.PHONY: spec
spec:
	respec --verbose --timeout 30 --localhost --src index.html --out web/index.html

.PHONY: extended-profile
extended-profile:
	mkdir -p web/extended-profile
	respec --verbose --localhost --src extended-profile/index.html --out web/extended-profile/index.html


.PHONY: serve
.ONESHELL: serve
serve:
	python -m http.server --directory . 1234

.PHONY: html-manifest
.ONESHELL: html-manifest
html-manifest:
	npm run generate

.PHONY: generate
generate:
	bash scripts/generate-examples.sh
