include PROJECT

VERSION ?= 0.0.1

IMG ?= catalog

TAG = $(IMG):$(VERSION)

BUILDER ?= docker

BUNDLES = $(shell cat bundles.txt | grep -v '\#' | tr '\n' ',' | sed -E 's/,$$//g')

all: image-build image-push

print-bundles:
	echo $(BUNDLES)

image-build:
	opm index add -c $(BUILDER) --bundles $(BUNDLES) --tag $(IMG)

image-push:
	$(BUILDER) push $(IMG)

update-catalog-source:
	set -x
	cat deploy/catalog-source.yaml | \
	    sed -E "s/( +name:).*/\1 $(NAME)/g" | \
		sed -E "s/( +displayName:).*/\1 $(DISPLAY_NAME)/g" | \
		sed -E "s/( +image:).*/\1 $(TAG)/g" > deploy/catalog-source.yaml.bak && \
		cp deploy/catalog-source.yaml.bak deploy/catalog-source.yaml && \
		rm deploy/catalog-source.yaml.bak

deploy: update-catalog-source
	cat deploy/catalog-source.yaml
