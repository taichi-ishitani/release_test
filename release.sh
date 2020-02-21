#! /bin/bash

repository=$1
release_version_list=$2

version=`cat ${release_version_list} | grep ${repository} | cut --delim=: -f 2`
tag="v${version}"

cd $repository
if [ -z `git tag | grep ${tag}` ]; then
  echo "create tag: ${tag}"
  git config user.name taichi
  git config user.email taichi@gmail.com
  git tag -a ${tag} -m "Version ${version} ${tag}"
  git push origin ${tag}
else
  echo "tag: ${tag} has already been created"
fi
