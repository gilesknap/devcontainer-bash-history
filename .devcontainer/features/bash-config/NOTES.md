# Lightweight, Configurable BASH Eternal History

## Defaults

When this feature is first called, onCreateCommand.sh is created and called in `devcontainer-feature`. 
This creates and installs a default bash terminal configuration from `feature_settings_rc` which contains opinionated default BASH terminal settings such as:
* A minimalist, blue bash prompt.
* Eternal, shared history between containers using this feature.

## Customisation

The user can specify their own terminal preferences in `$CONFIG_STAGING/bashrc`, which defaults to `/devcontainer_staging/bashrc`.
Then the container is rebuilt, if `bashrc` already exists it won't be overwritten, preserving changes. If the container has been built once already, the existing bashrc must be deleted in order for your changes to be applied. 



creates staging folder in container 
creates onCreateCommand.sh in the staging folder
inputrc and bashrc are also created in the staging folder, containing incremental history searching and user customisations respectively
feature_settings_rc is created in the staging fodler, which contains a PS1 setup and opinionated terminal features 
"onCreateCommand" is then exectuted inside the container during finalisation of container setup.
 - This copies the contents of feature_settings_rc into devcontainer_rc
 - then copies bashrc and inputrc into the container, unless they exist already to prevent overwriting user edits
 - then adds root permissions.
A symbolic link to /root/ is created The items in the CONFIG_FOLDER
our bashrc is called by /root/.bashrc