.PHONY: lock deps build run run-app rebuild

lock:
	@pip-compile requirements.in --output-file requirements.txt 

deps:
	@pip-sync requirements.txt

build:
	@docker build -t visual-inspection .

run:
	@docker run --rm -it -v $$PWD:/app visual-inspection bash

run-app:
	@docker run --rm -it -p 8000:8000 -v $$PWD:/app visual-inspection python -m uvicorn src.main:app --host 0.0.0.0 --port 8000 --reload

rebuild:
	@docker build --no-cache -t visual-inspection .
