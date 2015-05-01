# Hakyll Setup

## Requirements
* Cabal >= 1.22
* GHC >= 7.8.4

## Rebuilding Locally
```
git clone https://github.com/netzwerg/netzwerg.github.com.git
git checkout source
cabal install
cabal configure
cabal run rebuild
cabal run watch
```
Preview at [http://localhost:8000](http://localhost:8000)
