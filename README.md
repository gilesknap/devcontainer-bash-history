# Dev Container Features

Some features for use in Python Copier Template development containers. Also intended to be generally useful in any developer container.

## bash-config

Adds customizations to the bash shell that can be shared across all developer containers using the feature.

Default setup attempts to be a lightweight replacement for the common-utils feature zsh capabilities, namely:

- useful prompt
- eternal history (shared across all containers using the feature)
- history search with up/down arrows (.inputrc)
- ctrl-left or right arrow for word navigation (.inputrc)

## other

Other features may be added here in future.

## Testing

This repo has it's own devcontainer which can be used to do local testing of the features.

## Publishing Features

CI publishes the features defined here as follows:-

- bash-config: ghcr.io/gilesknap/devcontainer-features/bash-config:latest
