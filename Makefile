.PHONY: install lint test deploy

install:
	pip install --upgrade pip
	pip install -r .devcontainer/requirements.txt

lint:
	ruff check .

test:
	pytest -q; \
	code=$$?; \
	if [ $$code -eq 5 ]; then \
		echo "No tests collected yet — treating as pass."; \
		exit 0; \
	fi; \
	exit $$code

deploy:
	@echo "Deploying to production (simulated)..."
	@echo "Build $$(git rev-parse --short HEAD) deployed successfully."
