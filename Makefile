.SILENT: 

.PHONY: all
all: create-dist build-program example1 example2 example3 example4

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

example3:
	bash scripts/shell/example3.sh

example4:
	bash scripts/shell/example4.sh

.PHONY: clean
clean:
	rm -rf dist