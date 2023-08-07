#!/usr/bin/env bash

OS=$(uname | tr '[:upper:]' '[:lower:]')

export GOARCH=$ARCH

echo $OS
