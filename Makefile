IMAGE_NAME = ghcr.io/ministryofjustice/observability-platform-grafana-api-key-rotator:latest

test: build
	container-structure-test test --config test/container-structure-test.yml --image $(IMAGE_NAME)

build:
	docker build --file Dockerfile --tag $(IMAGE_NAME) .

