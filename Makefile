build:
	stack build

install_dependencies:
	stack build --system-ghc --test --bench --no-run-tests --no-run-benchmarks --only-dependencies

run:
	stack exec BrainGames-exe

test:
	@make build
	stack test

format:
	ormolu --mode inplace ./src/Games/*
	ormolu --mode inplace ./test/*

refactor:
	hlint $(path) --refactor --refactor-options="--inplace"

check:
	hlint $(path)

lint:
	@make format
	@make test

.PHONY: build run test format refactor check
