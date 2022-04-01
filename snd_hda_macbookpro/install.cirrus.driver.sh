#!/bin/bash

kernel_version=$(uname -r | cut -d '-' -f1)  #ie 5.2.7
major_version=$(echo $kernel_version | cut -d '.' -f1)
minor_version=$(echo $kernel_version | cut -d '.' -f2)
major_minor=${major_version}${minor_version}

revision=$(uname -r | cut -d '.' -f3)
revpart1=$(echo $revision | cut -d '-' -f1)
revpart2=$(echo $revision | cut -d '-' -f2)
revpart3=$(echo $revision | cut -d '-' -f3)

build_dir='build'
update_dir="/lib/modules/$(uname -r)"
patch_dir='patch_cirrus'
hda_dir="$build_dir/hda-$kernel_version"

cd $hda_dir

sudo mkdir "$update_dir/updates"
sudo make install

echo -e "\ncontents of $update_dir"
ls -lA $update_dir
