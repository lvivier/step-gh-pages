# Github Pages Deploy

A [wercker](http://wercker.com/) step to deploy to [Github Pages](http://pages.github.com/).

## Options

- `repo` Set this to the github repo (eg. lvivier/step-gh-pages)
- `token` Github API access token ([documentation](https://github.com/blog/1509-personal-api-tokens)). **don't share this on a public repo, use an environment variable!**
- `domain` *optional* Custom domain ([documentation](https://help.github.com/articles/setting-up-a-custom-domain-with-pages))
- `basedir` *optional* Set this if your build step outputs to a folder

## Example

Check out [lvivier/luke.vivier.ca](https://github.com/lvivier/luke.vivier.ca)

```yaml
deploy:
  steps:
    - gh-pages:
        token: $GIT_TOKEN
        repo: lvivier/luke.vivier.ca
        domain: luke.vivier.ca
        basedir: build
```
