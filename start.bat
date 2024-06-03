@ECHO off
RMDIR /Q /S .git
git init -b main
git add .
git commit -m "Initial commit"
git status
