# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Capstone project for a course module on GitHub Codespaces + Copilot + Actions. Goal: a reproducible, GPU-capable Codespaces environment for ML model fine-tuning, with CI/CD via GitHub Actions and Copilot integration.

**Current state is an early scaffold.** The devcontainer, README, ruff lint config, Makefile, and `ci.yml` are done; tests and actual ML source code do not exist yet. Treat README.md's checklist as the source of truth for what's actually finished vs. still TODO — don't assume tooling exists just because the README describes the plan for it.

## Linting

Lint config is at `pyproject.toml` (`[tool.ruff]`), run with `ruff check .`. `ruff` is pinned in `.devcontainer/requirements.txt`.

## CI

`.github/workflows/ci.yml` runs `make install`, `make lint`, `make test` on push/PR, and `make deploy` (simulated) on pushes to `main`. Targets are defined in the root `Makefile`.

## Environment

- Devcontainer config is at `.devcontainer/devcontainer.json`; Python deps are at `.devcontainer/requirements.txt` (not repo root — any future Makefile `install` target must reference this path explicitly).
- The devcontainer requires GPU (`hostRequirements.gpu: true`) and only builds correctly on GitHub's GPU Codespaces machine type (6-core, 112GB RAM, 1x Tesla T4). `postStartCommand` runs `nvidia-smi` but degrades gracefully (prints a warning) if no GPU is present, rather than failing hard.
- `requirements.txt` pins `torch==2.3.1` against the CUDA 12.1 wheel index, while the devcontainer's `nvidia-cuda` feature installs CUDA 12.2. These are currently compatible — if either is bumped, keep them in sync.

## Workflow

- No fixed branch/PR rule: use a feature branch + PR for larger changes, direct commits to main are fine for small or config-only tweaks.
