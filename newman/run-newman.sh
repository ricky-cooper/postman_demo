#!/bin/bash

echo "Checking for NPM"
echo "  Collection URL:  " $COLLECTION_URL

echo "Node Version:       " `node -v`
echo "NPM Version:        " `npm -v`
echo "Old Newman Version: " `newman --version`

echo "  Install newest newman version."
npm install newman --global --no-spin

echo "New Newman Version: " `newman --version`

# using the v3 syntax.
cd newman-repo
mkdir testReports 
newman run $COLLECTION_URL --reporters cli,junit --reporter-junit-export "newman-repo/testReports/report.xml"
cd newman-repo
ls
cd testReports
ls

echo "Complete!"