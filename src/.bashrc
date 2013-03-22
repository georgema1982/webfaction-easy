# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias python=python2.7
alias easy_install=easy_install-2.7

PATH="$HOME/bin:$PATH"
export TEMP="$HOME/tmp"
export WORKON_HOME="$HOME/.virtualenvs"
export VIRTUALENVWRAPPER_TMPDIR="$WORKON_HOME/tmp"
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
source $HOME/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

# User specific aliases and functions
export PS1='\u@\h:\w\$ '
export JAVA_HOME=/usr/lib/jvm/java
