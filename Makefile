.SILENT: 

.PHONY: all
all: create-dist build-program example1 example2

.PHONY: create-dist
create-dist:
	mkdir -p dist

.PHONY: build-program
build-program:
	cargo build

.PHONY: example1
example1:
	bash scripts/shell/example1.sh

.PHONY: example2
example2:
	bash scripts/shell/example2.sh

.PHONY: clean
clean:
	rm -rf dist