build:
	stack build

run:
	stack exec BrainGames-exe

format:
	ormolu --mode inplace ./src/*

refactor:
	hlint $(path) --refactor --refactor-options="--inplace"

check:
	hlint $(path)
