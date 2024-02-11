#!/bin/bash

export PATH="/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/matteo/.local/bin:/home/matteo/bin:./bin:/home/matteo/.local/bin:/home/matteo/bin:./bin"
# Set variables
DEB_FILE="package.deb"

# Change directory to your repository directory
cd ..
# Run dpkg-scanpackages to update Packages file
dpkg-scanpackages debs/ /dev/null > Packages

# Create Packages.bz2 for faster loading
bzip2 -fks Packages

# Commit changes to your Git repository (if applicable)
git add .
git commit -m "Update repository with $DEB_FILE"
git push origin master

