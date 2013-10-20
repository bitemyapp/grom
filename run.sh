#!/bin/bash

cabal install && .cabal-sandbox/bin/grom $@
