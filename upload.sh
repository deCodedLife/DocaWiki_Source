#!/bin/bash

unzip -o Build/webHelpD2-all.zip -d Doca
cd Build/Doca

git add .
git commit -m "$1"
git push