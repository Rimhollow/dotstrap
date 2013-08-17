#!/bin/bash

SOURCE_DIR=~/dotstrap
BACKUP_DIR=~/dotfiles_old
EXCLUDED_FILES=("dotstrap.sh" "README.markdown" "LICENSE" )
# All hidden/dotted files are automatically excluded by the ls command line below.

for FILE in `ls $SOURCE_DIR`                  # For all files in the source dir...
do
  if ! [[ ${EXCLUDED_FILES[*]} =~ $FILE ]]    # that are not explicitly excluded:
  then
    SOURCE=$SOURCE_DIR/$FILE
    DESTINATION=~/.$FILE
    if [ -a $DESTINATION ] && ! [ -h $DESTINATION ];
    then   # if there is a matching dotfile in the home dir, and it is NOT a symlink...
      echo "Backing up $DESTINATION to $BACKUP_DIR..."
      mkdir -p $BACKUP_DIR        # create the backup directory if needed, and...
      mv $DESTINATION $BACKUP_DIR # move the dotfile to the backup directory.
    fi

    echo "Symlinking $DESTINATION to $SOURCE..."
    ln -sf $SOURCE $DESTINATION  # Create a symlink to the source file.
  fi
done
