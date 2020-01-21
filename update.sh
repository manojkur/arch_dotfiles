#! /bin/bash

dir="$( cd "$(dirname "$0")" ; pwd -P )"

echo -e "--> Pulling git repo"
cd $dir 
git pull
cd -
