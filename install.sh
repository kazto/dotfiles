#!/bin/sh

. $(cd $(dirname $0); pwd)/util.sh

git_clone

for v in */install.sh
do
    sh $v
done
