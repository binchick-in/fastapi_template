DOCKER_IMAGE_NAME := fastapi_template

.PHONY: env
env:
	python3 -m venv venv
	venv/bin/pip install -r requirements.txt

.PHONY: build
build:
	docker build -t $(DOCKER_IMAGE_NAME) .

.PHONY: run-dev
run-dev: build
	docker run -it --rm --name $(DOCKER_IMAGE_NAME)_dev -p 8888:8888 $(DOCKER_IMAGE_NAME):latest

.PHONY: run
run: build
	docker run -d -p 8888:8888 --name $(DOCKER_IMAGE_NAME) $(DOCKER_IMAGE_NAME):latest

.PHONY: dev
dev:
	venv/bin/uvicorn fastapi_template:app --reload --host 0.0.0.0
