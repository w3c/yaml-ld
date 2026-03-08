.PHONY: install
install:
	npm install -g respec


.PHONY: spec
spec:
	respec --verbose --localhost --src index.html --out web/index.html


.PHONY: serve
serve:
	npm run serve

.PHONY: html-manifest
.ONESHELL: html-manifest
html-manifest:
	npm run generate
