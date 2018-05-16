.SILENT: 

.PHONY: all
all: create-dist build-program example1 example2 example3

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

example3: data/example3.dat
	bash scripts/shell/example3.sh

data/example3.dat:
	gcc lib/makeData.c -o a.out -lm && \
	./a.out > data/example3.dat && \
	rm -rf a.out

.PHONY: clean
clean:
	rm -rf dist