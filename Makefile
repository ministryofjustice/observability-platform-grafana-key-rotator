IMAGE_NAME = ghcr.io/ministryofjustice/observability-platform-grafana-api-key-rotator:latest

test: build
	container-structure-test test --config test/container-structure-test.yml --image $(IMAGE_NAME)

build:
	@ARCH=`uname -m`; \
	case $$ARCH in \
	x86_64) \
		echo "Building for x86_64 architecture"; \
		docker build --platform linux/amd64 --file Dockerfile --tag $(IMAGE_NAME) . ;; \
	arm64) \
		echo "Building for ARM64 architecture"; \
		docker build --platform linux/arm64 --file Dockerfile --tag $(IMAGE_NAME) . ;; \
	*) \
		echo "Unsupported architecture: $$ARCH"; \
		exit 1 ;; \
	esac