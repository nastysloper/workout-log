#!/bin/sh

 git filter-branch --env-filter '

cn="$GIT_COMMITTER_NAME"
cm="$GIT_COMMITTER_EMAIL"

if [ "$GIT_COMMITTER_EMAIL" = "rvogt@thebrighttag.com" ]
then
  cm="richvogtjr@gmail.com"
fi
if [ "$GIT_AUTHOR_EMAIL" = "rvogt@thebrighttag.com" ]
  then
    am="richvogtjr@gmail.com"
 fi

export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_EMAIL="$cm"
'
