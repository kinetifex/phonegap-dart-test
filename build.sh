#!/bin/bash
cd src;
pub build --output=../.tmp;
echo "Removing www"
rm -rf ../www;
echo "Moving web -> www"
mv ../.tmp/web ../www;
echo "Cleaning .tmp"
rm -rf ../.tmp;