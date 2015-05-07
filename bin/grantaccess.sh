#!/bin/sh
. shflags
DEFINE_string 'user' '' 'The other user account name' 'u'
DEFINE_string 'app' '' 'The name of the application to which the other user is to have access' 'a'
FLAGS "$@" || exit $?
eval set -- "${FLAGS_ARGV}"
if [ -z "$FLAGS_user" ]
then
	echo "Secondary user isn't specified. Please use $0 -h or $0 --help to view the usage."
	exit 1
fi
if [ -z "$FLAGS_app" ]
then
	echo "Application isn't specified. Please use $0 -h or $0 --help to view the usage."
	exit 1
fi
setfacl -m u:$FLAGS_user:--x $HOME
setfacl -m u:$FLAGS_user:--- $HOME/webapps/*
app_dir=$HOME/webapps/$FLAGS_app
setfacl -R -m u:$FLAGS_user:rwx $app_dir
setfacl -R -m d:u:$FLAGS_user:rwx $app_dir
chmod g+s $app_dir
primary_user=`whoami`
setfacl -R -m d:u:$primary_user:rwx $app_dir
echo "Access to application $FLAGS_app has been granted to user $FLAGS_user."
