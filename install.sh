#!/bin/sh

. ./util.sh

git_clone

for v in */install.sh
do
    sh $v
done
