#!/usr/bin/env bash

cd "$(dirname ${BASH_SOURCE[0]})"

say() {
  echo -e >&2 "\033[1;34m==>\033[0;1m $@\033[0m"
}

bundle() {
  gemfile="$1"
  shift
  export \
    BUNDLE_GEMFILE="$gemfile" \
    BUNDLE_PATH="$(pwd)/vendor/bundle/$(basename $gemfile .gemfile)"
  command bundle $@
}

deps() {
  for gemfile in gemfiles/*.gemfile; do
    say "Installing dependencies in $gemfile..."
    bundle $gemfile check || bundle $gemfile install --jobs=4 --retry=3
  done
}

spec() {
  for gemfile in gemfiles/*.gemfile; do
    say "Running tests with $gemfile..."
    bundle $gemfile exec rake
  done
}

if [[ "$1" = "deps" ]]; then
  deps
elif [[ "$1" = "spec" ]]; then
  spec
else
  deps
  spec
fi
