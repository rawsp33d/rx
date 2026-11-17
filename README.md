# rx

A [Rex](https://www.superlogical.com/rex/) TUI client.

## background

I love my terminal Wezterm but I've always been hunting for a good modern multiplexer so I can work over ssh or in any term or in any context.
I was a huge `screen` and `tmux` fan for many many years, and used the latter in every terminal right up until I switched to Wezterm and started embracing the existing features.
But I still wanted a good multiplexer, and so I have kept up to date on them, habitually looking for new ones to try out.
None have been as capable for me as `tmux`.

Rex is awesome but has no Linux or cross-platform client.
I made `rx` with my own programming language [Oi](https://github.com/oilang/oi).
It's based on a combination of:
- `tmux` as mentioned
- [my own tmux util fns which I started in bash, ported to zsh, and more recently ported to nushell](https://github.com/rawsp33d/dotfiles/blob/9a9cc785184e4f836ef76864ae29e862bee165a1/src/config/nushell/modules/functions.nu#L129-L168)
- my Wezterm config and usage
- abduco, zellij, dtach, dvtm, and others

In practice this is just like tmux. Better in some ways and not quite there yet in others.
But I have been eating this dogfood every day since I started making it, and it's honestly great.

I am currently using `rx` with Ghostty in place of my Wezterm setup for most work.
It works in Wezterm too of course but it's kind of redundant to have an incredibly powerful feature-rich terminal if the multiplexer kind of just does most of it itself.
So I tried out Ghostty and am using it pretty much only because it starts up a little quicker.
I will very likely go all the way (back) to the minimal terminal extreme side of the fence I was on before I found Wezterm years ago and see how I like it in 2026 or 2027 or whatever.

## setup

You need [Oi](https://github.com/oilang/oi), and optionally [just](https://just.systems/).

Then you can install like this:

```sh
just install
```

## usage

> TODO: add screenshots and/or movies or whatever

```sh
# interactive session browser
# you can do pretty much everything mentioned below all in one place
rx

# create/join session named after cwd
rx .

# create/join session in current dir
rx join foo

# create/join session after warping to the given dir (needs `zoxide`)
rx warp foo

# rename sessions
rx rename foo bar

# proxies to `rex` commands
rx ls
rx kill foo bar baz
```

If you're in a session and use something like `rx .` it will rename the session to that rather than creating a nested session.
Though nested sessions are in fact supported.

There's experimental support for `rx -CC` control mode, like `tmux -CC`, which can drive Wezterm.
It's very rough and not ready to recommend yet, but it does kind of work (currently syncing in only one direction) which is cool.

## config

It actually uses Rex's config, in `~/.config/rex/init.lua`.
You can see my own config [here](https://github.com/rawsp33d/dotfiles/blob/master/src/config/rex/init.lua).
