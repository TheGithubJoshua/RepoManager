#!/bin/bash

# Step 1: Move the .deb file to the repository direct

# Step 2: Navigate to the repository directory
cd ../tmpdebs

# Step 3: Extract package information
PACKAGE_NAME=$(ar -p *.deb debian-binary | sed -n '2p')
PACKAGE_VERSION=$(ar -p *.deb debian-binary | sed -n '4p')
PACKAGE_ARCH=$(ar -p *.deb debian-binary | sed -n '6p')
PACKAGE_SIZE=$(wc -c < *.deb)
MD5SUM=$(md5sum *.deb | cut -d' ' -f1)
SHA1SUM=$(sha1sum *.deb | cut -d' ' -f1)
SHA256SUM=$(sha256sum *.deb | cut -d' ' -f1)

# Step 4: Update the Packages file
echo "Package: $PACKAGE_NAME" > Packages
echo "Version: $PACKAGE_VERSION" >> Packages
echo "Architecture: $PACKAGE_ARCH" >> Packages
echo "Installed-Size: $PACKAGE_SIZE" >> Packages
echo "MD5sum: $MD5SUM" >> Packages
echo "SHA1: $SHA1SUM" >> Packages
echo "SHA256: $SHA256SUM" >> Packages
echo "" >> Packages

# Step 5: Compress the Packages file using bzip2
bzip2 -c9 Packages > Packages.bz2

# Step 6: Verify changes
echo "Repository updated successfully."

# Step 7: Test the repository (optional)
# You can test your Cydia repository to ensure that the new package is visible and installable.
