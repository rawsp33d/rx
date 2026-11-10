# same rev as go.mitchellh.com/libghostty, or rex's snapshots won't decode
rev := "f54340ad77814fe319d136e5e915d6a48de8dd23"
src := justfile_directory() / ".deps/ghostty"
vt := justfile_directory() / ".deps/ghostty-vt"

# build libghostty-vt (needs zig)
[group("lib")]
deps:
	#!/usr/bin/env sh
	set -eu
	[ "$(cat {{vt}}/rev 2>/dev/null)" = {{rev}} ] && exit 0
	git init -q {{src}}
	git -C {{src}} fetch -q --depth 1 https://github.com/ghostty-org/ghostty.git {{rev}}
	git -C {{src}} checkout -q FETCH_HEAD
	cd {{src}} && zig build -Demit-lib-vt -Doptimize=ReleaseFast --prefix {{vt}}
	echo {{rev}} > {{vt}}/rev
