# Github Pages Deploy

A [wercker](http://wercker.com/) step to deploy to [Github Pages](http://pages.github.com/).

## Options

- `token` Github API access token ([documentation](https://github.com/blog/1509-personal-api-tokens)). **don't share this on a public repo, use an environment variable!**
- `basedir` *optional* Set this if your build step outputs to a folder
- `domain` *optional* Custom domain ([documentation](https://help.github.com/articles/setting-up-a-custom-domain-with-pages))
- `repo` *optional* Set this to a github repo like "user/repo". Defaults to your build repo

## Example

Check out [lvivier/luke.vivier.ca](https://github.com/lvivier/luke.vivier.ca) on GitHub.

    deploy:
      steps:
        - gh-pages:
            token: $GIT_TOKEN
            domain: luke.vivier.ca
            basedir: build
