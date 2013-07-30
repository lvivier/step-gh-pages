#!/bin/sh

# confirm environment variables
if [ ! -n "$WERCKER_GH_PAGES_TOKEN" ]
then
  fail "missing option \"token\", aborting"
fi

if [ -n "$WERKCER_GH_PAGES_PROJECT" ]
then
  remote="https://$WERCKER_GH_PAGES_TOKEN@github.com/$WERCKER_GH_PAGES_PROJECT.git"
else
  remote="https://$WERCKER_GH_PAGES_TOKEN@github.com/$WERCKER_GIT_OWNER/$WERCKER_GIT_REPOSITORY.git"
fi

# if directory provided, cd to it
if [ -f "$WERCKER_OUTPUT_DIR/$WERCKER_GH_PAGES_BASEDIR" ]
then
  cd $WERCKER_OUTPUT_DIR/$WERCKER_GH_PAGES_BASEDIR
else
  cd $WERCKER_OUTPUT_DIR
fi

# remove existing commit history
rm -rf .git

# generate cname file
if [ -n $WERCKER_GH_PAGES_DOMAIN ]
then
  echo $WERCKER_GH_PAGES_DOMAIN > CNAME
fi

# init repository
git init

git config user.email "pleasemailus@wercker.com"
git config user.name "werckerbot"

git add .
git commit -m "deploy from $WERCKER_STARTED_BY"
result="$(git push -f $remote master:gh-pages)"

if [[ $? -ne 0 ]]
then
  warning "$result"
  fail "failed pushing to github pages"
else
  success "pushed to github pages"
fi

