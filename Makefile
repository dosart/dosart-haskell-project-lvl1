build:
	stack build

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
