# xmonad-web >>= Hakyll 
A Hakyll application for the
[xmonad-web](https://github.com/xmonad/xmonad-web)
repository.

## Requirements
- Haskell (ghc-8.0.2 or higher)
- Hakyll

As a suggestion, please use
[The Haskell Tool Stack](https://docs.haskellstack.org/en/stable/README/).

## Installation
First, we need to clone this branch.

```
git clone -b rebuild-xmonad-web --single-branch https://github.com/wisn/xmonad-web.git
```

Then, open the clonned repository.

```
cd xmonad-web
```

### Stack
Using Stack, run this command.

```
stack install
```

### Cabal
If you have no Stack and install Haskell in a different way,
please make sure that you have Cabal instead.
Using Cabal, run this command.

```
cabal install
```

## Verify
Try to run `xmonad-web` command. You should see something like this.

```
Missing: COMMAND

Usage: xmonad-web [-v|--verbose] COMMAND
  xmonad-web - Static site compiler created with Hakyll

Available options:
  -h,--help                Show this help text
  -v,--verbose             Run in verbose mode

Available commands:
  build                    Generate the site
  check                    Validate the site output
  clean                    Clean up and remove cache
  deploy                   Upload/deploy your site
  preview                  [DEPRECATED] Please use the watch command
  rebuild                  Clean and build again
  server                   Start a preview server
  watch                    Autocompile on changes and start a preview server.
                           You can watch and recompile without running a server
                           with --no-server.
```

## Application Structures

All the `.md` files in the root (except for `README.md`) will
be converted into `html` files. These go at the root of the
website. The `css` directory has custom styles, as well as
`bootstrap.min.css` for [Bootstrap](https://getbootstrap.com/).
Image should go in the `images` directory.

The videos that are linked in `videos.html` are hardcoded in
the haskell source.

The `_site` directory is a place for the Hakyll output.
Hakyll *caches* the website in `_cache`.


## Preview the Website
You can use `xmonad-web watch` to preview the website and have
it updated on each change. If you change the `src/xmonad-web.hs`
file, you'd need to recompile `xmonad-web` again and restart it
(you might need to clean the cache with `xmonad-web clean`).

## Generating the Website
When you have done some changes, run `xmonad-web build` command.
The HTML files will be generated and copied to the `_site` directory.
