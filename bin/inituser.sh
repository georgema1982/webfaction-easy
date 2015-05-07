#!/bin/sh
. shflags
DEFINE_string 'user' '' 'The primary user account name' 'u'
FLAGS "$@" || exit $?
eval set -- "${FLAGS_ARGV}"
if [ -z "$FLAGS_user" ]
then
	echo "Primary user isn't specified. Please use $0 -h or $0 --help to view the usage."
	exit 1
fi
mkdir $HOME/webapps
setfacl -m u:$FLAGS_user:--x $HOME
webapps_dir=$HOME/webapps
setfacl -m u:$FLAGS_user:rwx $webapps_dir
echo "User initialization has been completed."
