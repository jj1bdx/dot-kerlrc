#!/bin/sh
# Note: ~/src/otp has its OWN forked repository of Erlang/OTP already
# if not, create one
cd ~/src/otp
echo "current directory: `pwd`"
# See <https://stackoverflow.com/a/76173696/417862>
# check .git/config content as:
#   
#   [remote "upstream"]
#   url = <url>
#   fetch = +refs/heads/*:refs/remotes/origin/*
#
# ^ summary: fetch all branches from upstream
#
# git remote add upstream https://github.com/erlang/otp.git
# git fetch --all
# git branch -a
# git checkout -t upstream/master
# git checkout -t upstream/maint
git fetch upstream && git checkout master && git merge upstream/master && git push origin master
git fetch upstream -t && git push origin --tags
git checkout maint && git merge upstream/maint && git push origin maint
git checkout master
git fetch origin
