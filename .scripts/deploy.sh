#!/bin/bash
release="r$(date +%Y%m%d%H%M%S)"

bundle exec jekyll build

(cd _site \
  && git add . \
  && git commit -m "[deploy] release ${release}" \
  && git push)

git add .
git commit -m "[deploy] release ${release}"
git push
