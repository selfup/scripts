#!/usr/bin/env bash

REPOS=$1
CURRENT_DIR=$(pwd)

if [[ $REPOS == "" ]]
then
  echo "please provide a directory with repositories to sync"
  exit 1
fi

for path in $REPOS/*
do
  if [[ -d $path/.git ]]
  then
    cd $path

    git remote -v | grep -q "origin"
    if [[ $? == "0" ]]
    then
      status=$(git status)

      echo $status | grep -q "On branch master"
      if [[ $? == "0" ]]
      then
        echo $status | grep -q "nothing to commit, working tree clean"            
        if [[ $? == "0" ]]
        then
          git pull origin master
        fi
      fi
    fi
    
    cd $CURRENT_DIR
  fi
done
