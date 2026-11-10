mod lib

set positional-arguments

# the oi compiler
[group("oi")]
@oi *args:
	oi "$@"

# the rex CLI
[group("rex")]
@rex *args:
	rex "$@"

# run the client
[group("rx")]
[default]
run *args: lib::deps
	oi run src/main.oi "$@"

# build the client
[group("rx")]
build: lib::deps
	oi build src/main.oi -o rx

# run tests
[group("rx")]
test *patterns: lib::deps
	oi test src/main.oi "$@"

# install the client
[group("rx")]
install: lib::deps
	oi install
