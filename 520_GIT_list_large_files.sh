#!/bin/zsh


# Find files in git index or working directory that are larger than threshold
git ls-files | xargs du -hs --threshold=1M
