run *args:
	oi run src/main.oi {{args}}

build:
	oi build src/main.oi -o rex-tui

test *patterns:
	oi test src {{patterns}}
