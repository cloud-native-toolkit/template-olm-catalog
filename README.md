# OLM Catalog template

Template for creating OLM catalogs from bundles

## Setup

After the create a new project from this template, do the following to complete the setup:

1. (Optional) Update the default value of the `IMG` variable in Makefile to match the name of your catalog image

## Usage

### Adding bundles to the catalog

Update `bundles.txt` and add a line for each bundle version that should be included in the image

### Building the image

Run the following to build the image:

```shell script
make image-build [IMG={IMAGE_NAME}] [VERSION={VERSION}] [BUILDER={BUILDER}]
```

where:

- `IMAGE_NAME` is the name of the image that should be built. This is optional and will default to the value provided in the Makefile
- `VERSION` is the version that should be built. This is optional and will default to the value provided in the Makefile
- `BUILDER` is the build tool that should be used (e.g. docker or podman). This is optional and will default to the value provided in the Makefile

### Pushing the image

Run the following to push the image:

```shell script
make image-push [IMG={IMAGE_NAME}] [VERSION={VERSION}] [BUILDER={BUILDER}]
```

where:

- `IMAGE_NAME` is the name of the image that should be built. This is optional and will default to the value provided in the Makefile
- `VERSION` is the version that should be built. This is optional and will default to the value provided in the Makefile
- `BUILDER` is the build tool that should be used (e.g. docker or podman). This is optional and will default to the value provided in the Makefile

