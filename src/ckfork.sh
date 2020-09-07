#!/bin/bash

LAB="/data/cryptokasten/Lab"

NEW_TITLE=$1

OLD_TITLE=`cat README.org | grep "#+TITLE: " | head -n 1 | sed 's/#+TITLE: //g'`

OLD_SLUG=`pwd | rev | cut -d"/" -f 1 | rev`

SLUG=`slugify $NEW_TITLE`

cp -r . $LAB/$SLUG

rm -rf $LAB/$SLUG/.git

sed -i "s/#+TITLE: $OLD_TITLE/#+TITLE: $NEW_TITLE/g" $LAB/$SLUG/README.org
sed -i "s/$OLD_SLUG/$SLUG/g" $LAB/$SLUG/README.org
