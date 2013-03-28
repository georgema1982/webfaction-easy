#!/bin/sh -e
PYTHONVER=2.7
PYTHON=python$PYTHONVER
cd $HOME
[ ! -d tmp ] && mkdir tmp
[ ! -d lib ] && mkdir lib
cd lib
[ ! -d $PYTHON ] && mkdir $PYTHON
echo "Necessary folders have been created."
easy_install-$PYTHONVER pip
pip install virtualenv
cd $HOME/tmp
VIRTUALENVWRAPPERVER=3.7
VIRTUALENVWRAPPER=virtualenvwrapper-$VIRTUALENVWRAPPERVER
VIRTUALENVWRAPPERARCHIVE=$VIRTUALENVWRAPPER.tar.gz
wget "http://pypi.python.org/packages/source/v/virtualenvwrapper/$VIRTUALENVWRAPPERARCHIVE"
tar -xzf $VIRTUALENVWRAPPERARCHIVE
cd $VIRTUALENVWRAPPER
$PYTHON setup.py install --home=$HOME
echo "Virutalenv and virutalenvwrapper have been installed."
cd $HOME
cp .bashrc .bashrc.bak
cp .bash_profile .bash_profile.bak
mv bin/bashrc .bashrc
mv bin/bash_profile .bash_profile
source .bashrc
echo "Environment variables have been set up."
cd $WORKON_HOME
echo ""