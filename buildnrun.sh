#!/bin/bash

export PORT=3000
cabal build && ./dist/build/connect/connect
