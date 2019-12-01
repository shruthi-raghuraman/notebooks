#!/bin/bash


set -ex

die() { echo "$*" 1>&2 ; exit 1; }
mkdir -p ~/.ssh
echo "$REPORTER_SSH_PRIVATE_KEY" >> ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
mkdir -p papermill/

git config --global user.email raghuraman.s@husky.neu.edu
#$GITHUB_USER_EMAIL
git config --global user.name shruthi-raghuraman
#$GITHUB_USER_NAME
export GIT_SSH_COMMAND='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
#ssh-keyscan github.com >> ~/.ssh/known_hosts
#echo -e "Host *\n\tStrictHostKeyChecking no\nUserKnownHostsFile=/dev/null\n" >> ~/.ssh/config
#chmod 400 ~/.ssh/config
#ssh-keyscan github.com >> githubKey
#ssh-keygen -lf githubKey
eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa
git clone git@github.com:shruthi-raghuraman/jupyter-notebook-openshift.git

cd jupyter-notebook-openshift


papermill Helloworld.ipynb output.ipynb -f input.yml --log-output

ls -lrt

git add .

git commit -m "Output from papermill"

git push origin master
