.PHONY: install
install:
	npm install -g respec


.PHONY: spec
spec:
	respec --verbose --localhost --src index.html --out web/index.html

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
