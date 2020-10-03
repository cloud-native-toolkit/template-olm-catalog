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
