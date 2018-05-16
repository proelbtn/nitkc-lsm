.SILENT: 

BIN = target/debug/school-lsm

.PHONY: all
all: create-dist build-program example1

.PHONY: create-dist
create-dist:
	mkdir -p dist

.PHONY: build-program
build-program:
	cargo build

.PHONY: example1
example1: data/example1.dat
	bash scripts/shell/example1.sh 1 $^ "$(BIN)"

.PHONY: clean
clean:
	rm -rf dist