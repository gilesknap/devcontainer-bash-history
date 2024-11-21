#!/bin/bash
set -e

echo "Activating feature 'terminal-history'"
echo "User: ${_REMOTE_USER}     User home: ${_REMOTE_USER_HOME}"

mkdir -p $CONFIG_STAGING

# -------------------------------------------------------------------------------
cat > $CONFIG_STAGING/onCreateCommand.sh  \
<< EOF
#!/bin/bash

# copy in the opinionated default settings from the feature
cp $CONFIG_STAGING/feature_settings_rc $CONFIG_FOLDER/feature_settings_rc

# copy in the user editable settings unless they already exist
if [[ ! -f $CONFIG_FOLDER/bashrc ]] ; then
    cp $CONFIG_STAGING/bashrc $CONFIG_FOLDER    
    cp $CONFIG_STAGING/inputrc $CONFIG_FOLDER
fi

# hook in the config to the root account
ln -s $CONFIG_FOLDER/inputrc /root/.inputrc
echo "source $CONFIG_FOLDER/bashrc" >> /root/.bashrc
EOF

# -------------------------------------------------------------------------------
cat > $CONFIG_STAGING/inputrc  \
<< EOF
# Readline configuration for bash shell.

# Incremental history searching with up and down arrows (C-P and C-N for old
# style navigation).
"\e[A": history-search-backward
"\e[B": history-search-forward

# Control left and right for word movement
"\e[5C": forward-word
"\e[5D": backward-word
EOF

# -------------------------------------------------------------------------------
cat > $CONFIG_STAGING/bashrc  \
<< EOF
#!/bin/bash

# execute default opinionated settings - delete this line to remove defaults
source $CONFIG_FOLDER/feature_settings_rc

# add your personal custom settings below
EOF

# -------------------------------------------------------------------------------
cat > $CONFIG_STAGING/feature_settings_rc  \
<< EOF
#!/bin/bash

# default opinioned bash configuration

# set the prompt
export PS1="\[\033[1;34m\]\W \[\033[0m\]# "

# enable enternal shared history
export HISTCONTROL=ignoreboth:erasedups
export HISTFILESIZE=-1
export SAVEHIST=-1
export HISTFILE=$CONFIG_FOLDER/.bash_eternal_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
EOF
