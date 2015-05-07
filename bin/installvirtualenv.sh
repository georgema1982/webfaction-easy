#!/bin/sh -e
PYTHONVER=2.7
PYTHON=python$PYTHONVER
VIRTUALENVWRAPPERVER=4.5.1
cd $HOME
[ ! -d tmp ] && mkdir tmp
[ ! -d lib ] && mkdir lib
cd lib
[ ! -d $PYTHON ] && mkdir $PYTHON
echo "Necessary folders have been created."
easy_install-$PYTHONVER pip
pip install virtualenv
cd $HOME/tmp
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
source $HOME/.bashrc
echo "Environment variables have been set up."
cd $WORKON_HOME
echo "cdvirtualenv lib/python$PYTHONVER" >> postmkvirtualenv
echo "touch sitecustomize.py" >> postmkvirtualenv
echo "cd -" >> postmkvirtualenv
echo "Virtualenvwrapper hooks have been updated."
echo "Virtualenv and virtualenvwrapper have been successfully installed."
