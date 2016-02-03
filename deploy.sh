#!/bin/bash

git checkout master
git add --all
git commit -m 'source files update'
git push origin master

gitbook build
cp package.json ./_book
git checkout gh-pages
cp -r _book/* .
git add --all
git commit -m 'new build'
git push origin gh-pages
git checkout master
