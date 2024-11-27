# Lightweight, Configurable BASH Config with Eternal History

Intended as a lightweight alternative to common-utils.

## Installation

To use this feature in an individual devcontainer, add the following to your `.devcontainer/devcontainer.json`:

```json
    "features": {
        "ghcr.io/diamondlightsource/devcontainer-features/bash-config:1": {}
    },
    "initializeCommand": "mkdir -p ${localEnv:HOME}/.config/bash-config",
```

The initializeCommand is required to create the directory for the bash-config folder in your home folder on the host, the very first time this is executed. Features do not have an InitializeCommand, so the devcontainer.json must do this.

## Global Installation

To use this feature in all devcontainers on your workstation, add the following to User setting.json:

```json
    "dev.containers.defaultFeatures": {
        "ghcr.io/gilesknap/devcontainer-features/bash-config:1.1.0"
    }
```

Also, one time only, make sure the host folder for bash-config is created:

```bash
mkdir -p $HOME/.config/bash-config
```


## features

The default, opinionated configuration can be found in `$HOME/.config/bash-config/bash-config-rc` and includes the following:

- Persistent history across all devcontainers that use this feature
- The MS devcontainer bash prompt with git branch and status
- history search with up/down arrows (.inputrc)
- ctrl-left or right arrow for word navigation (.inputrc)
- git autocomplete

## Customisation

Can be customized by editing `$HOME/.config/bash-config/bashrc`