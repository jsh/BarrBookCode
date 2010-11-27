#!/bin/bash -eu
# original upload script, recommended by GitHub

mkdir BarrBookCode
cd BarrBookCode
git init
touch README
git add README
git commit -m 'first commit'
git remote add origin git@github.com:jsh/BarrBookCode.git
git push origin master
      

