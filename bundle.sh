#!/bin/bash

NODE_DEPENDENCIES="jQuery jsdom"

for dependency in $NODE_DEPENDENCIES; do
  npm install $dependency
done
