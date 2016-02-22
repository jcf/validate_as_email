set -e

run() {
  echo -e >&2 "\033[1;34m==>\033[1;0m Running $@\033[0m"
  $@
}

run bundle exec appraisal
