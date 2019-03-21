#!/bin/bash

MAINTENANCE_URL=$1
echo "MAINTENANCE_URL: $MAINTENANCE_URL"
rm -rf target
cp -r site target

find target -type f -exec sed -i "s|{{MAINTENANCE_URL}}|${MAINTENANCE_URL}|g" {} \;
