# bash-config configuration files

## introduction

The files in this folder are copied out of the bash-config feature and
into the users config folder on the host at ~/.config/bash-config

## files

- bashrc: The entry point for the bash-config feature. User editable
- inputrc: The readline configuration file. User editable
- bash-config-rc: The configuration file for the bash-config feature. Not
  user editable. Replaced with the latest version on each rebuild of the
  developer container.

## Stages

1. At build time all the files in this folder are copied to a staging folder
in the container filesystem.
1. At container runtime the files are copied from the staging folder to the
users config folder on the host.
1. The file onCreateCommand.sh is executed at container creation time in order
to facilitate the above copy.
