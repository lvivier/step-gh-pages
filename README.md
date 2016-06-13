# Github Pages Deploy

A [wercker](http://wercker.com/) step to deploy to [Github Pages](http://pages.github.com/).

## Options

- `token` Github API access token ([documentation](https://github.com/blog/1509-personal-api-tokens)). **don't share this on a public repo, use an environment variable!**
- `basedir` *optional* Set this if your build step outputs to a folder. E.g. [hugo](https://gohugo.io/) outputs to `public/`
- `branch` *optional* Set this if you want to deploy to a different branch for testing/staging purposes. By default it will use `gh-pages` (if a project), or `master` (if a user/organisation).
- `domain` *optional* Set this to use a custom domain ([documentation](https://help.github.com/articles/setting-up-a-custom-domain-with-pages))
- `repo` *optional* Set this to a github repo like "user/repo". Defaults to your build repo

## Example

Check out [lvivier/luke.vivier.ca](https://github.com/lvivier/luke.vivier.ca) on GitHub.

    deploy:
      steps:
        - gh-pages:
            token: $GIT_TOKEN
            domain: luke.vivier.ca
            basedir: public

