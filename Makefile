IMAGE_NAME = ghcr.io/ministryofjustice/observability-platform-grafana-api-key-rotator:latest

test: build
	container-structure-test test --config test/container-structure-test.yml --image $(IMAGE_NAME)

build:
	@ARCH=`uname -m`; \
	case $$ARCH in \
	aarch64) \
		echo "Building for aarch64 architecture"; \
		docker build --platform linux/aarch64 --file Dockerfile --tag $(IMAGE_NAME) . ;; \
	arm64) \
		echo "Building for ARM64 architecture"; \
		docker build --platform linux/arm64 --file Dockerfile --tag $(IMAGE_NAME) . ;; \
	*) \
		echo "Architecture: $$ARCH"; \
		docker build --file Dockerfile --tag $(IMAGE_NAME) . ;; \
	esac