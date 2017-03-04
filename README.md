# Elm Task Port Example

As discussed on [Elm-Discuss](https://groups.google.com/forum/#!searchin/elm-discuss/task$20port%7Csort:relevance/elm-discuss/TjWoacZobWw/XK32eTXgAgAJ), it
would be useful to be able to define Elm port interactions as tasks.

This project is an example implementation of such a proposal. It consists of three parts:
1. A modified version of the elm-compiler
  [GitHub repo, on the feature branch "feature/task-ports"](https://github.com/eirslett/elm-compiler/tree/feature/task-ports)
2. A modified version of the elm-core library
  [GitHub repo, on the feature branch "feature/task-ports"](https://github.com/eirslett/elm-core/tree/feature/task-ports)
3. An example application (in this repo) showing usage of the new feature, and a compiled version of the example application

## Running the (pre-compiled) example app

git clone this repository, and open the `index.html` file (possibly via a local web server).

## Trying out things for yourself

Read the instructions to set up the [Elm Platform](https://github.com/elm-lang/elm-platform) for development.
Run the master branch build, like elm-platform describes: `runhaskell BuildFromSource.hs master`
It will clone the official git repositories of the compiler, elm-make, elm-reactor etc.
Go into the elm-compiler directory, do a `git pull` from the `feature/task-ports branch` to get the modified compiler.
Run `runhaskell BuildFromSource.hs master` again. The compiler should now have the task port feature, and the example
app should compile.

The Elm runtime must also be updated to use the modified version. In order to do this, go into the example project,
in the elm-stuff folder, replace the source of the `core` package with the contents of the `feature/task-ports` branch.
Delete the `build-artifacts` folder if it's present.

