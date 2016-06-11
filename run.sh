#!/bin/sh

# confirm environment variables
if [ ! -n "$WERCKER_GH_PAGES_TOKEN" ]; then
  fail "missing option \"token\", aborting"
fi

# use repo option or guess from git info
if [ -n "$WERCKER_GH_PAGES_REPO" ]; then
  repo="$WERCKER_GH_PAGES_REPO"
elif [ 'github.com' = "$WERCKER_GIT_DOMAIN" ]; then
  repo="$WERCKER_GIT_OWNER/$WERCKER_GIT_REPOSITORY"
else
  fail "missing option \"repo\", aborting"
fi

info "using github repo \"$repo\""

# remote path
remote="https://$WERCKER_GH_PAGES_TOKEN@github.com/$repo.git"

# if directory provided, cd to it
if [ -d "$WERCKER_GH_PAGES_BASEDIR" ]; then
  cd "$WERCKER_GH_PAGES_BASEDIR"
fi

# remove existing commit history
rm -rf .git

# generate cname file
if [ -n "$WERCKER_GH_PAGES_DOMAIN" ]; then
  echo "$WERCKER_GH_PAGES_DOMAIN" > CNAME
fi

# setup branch
branch="gh-pages"
echo "$repo" | grep -qE "$WERCKER_GIT_OWNER\/$WERCKER_GIT_OWNER\.github\.(io|com)"
if [ $? -eq 0 ]; then
  branch="master"
fi

# init repository
git init

git config user.email "pleasemailus@wercker.com"
git config user.name "werckerbot"

git add .
git commit -m "deploy from $WERCKER_STARTED_BY"
result=$(git push -f "$remote" master:"$branch")

if [ $? -ne 0 ]; then
  warning "$result"
  fail "failed pushing to github pages"
else
  success "pushed to github pages"
fi

