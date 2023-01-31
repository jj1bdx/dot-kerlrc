#!/bin/sh
# Note: ~/src/elixir has its OWN forked repository of Elixir already
# if not, create one
cd ~/src/elixir
echo "current directory: `pwd`"
#git remote add upstream https://github.com/elixir-lang/elixir.git
git fetch upstream && git checkout main && git merge upstream/main && git push origin main
git fetch upstream -t && git push origin --tags
git checkout main
git fetch origin
