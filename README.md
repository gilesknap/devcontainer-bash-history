# Dev Container Features

Devcontainer features for use in Python Copier Template or any other devcontainer.

## bash-config

Adds customizations to the the bash shell that can be shared across all developer containers using the feature.

See details in the [bash-config README](.devcontainer/features/bash-config/README.md).

## other

Further features may be added here in future.

## Testing

This repo has it's own devcontainer which can be used to do local testing and development of the features.

## Publishing Features

CI verifies and publishes the feature(s) as follows:-

- bash-config: ghcr.io/diamondlightsource/devcontainer-features/bash-config:1

(the tag can be major, major.minor, major.minor.patch, or latest)
