IMAGE_NAME ?= polynex/logto:1.4.1
DEV_FEATURES_ENABLED ?=
ADDITIONAL_CONNECTOR_ARGS ?=
NPM_REGISTRY ?= https://registry.npmjs.org/

# Forward proxy environment variables if they are defined on the host
BUILD_ARGS := --build-arg dev_features_enabled=$(DEV_FEATURES_ENABLED) \
              --build-arg additional_connector_args="$(ADDITIONAL_CONNECTOR_ARGS)" \
              --build-arg npm_registry=$(NPM_REGISTRY)

ifneq ($(HTTP_PROXY),)
BUILD_ARGS += --build-arg http_proxy=$(HTTP_PROXY)
endif
ifneq ($(HTTPS_PROXY),)
BUILD_ARGS += --build-arg https_proxy=$(HTTPS_PROXY)
endif
ifneq ($(NO_PROXY),)
BUILD_ARGS += --build-arg no_proxy=$(NO_PROXY)
endif

.PHONY: build
build:
	docker build $(BUILD_ARGS) -t $(IMAGE_NAME) .
