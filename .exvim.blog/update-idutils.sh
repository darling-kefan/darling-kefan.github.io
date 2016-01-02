#!/bin/bash
export DEST="./.exvim.blog"
export TOOLS="/Users/tangmi/.vim/tools/"
export TMP="${DEST}/_ID"
export TARGET="${DEST}/ID"
sh ${TOOLS}/shell/bash/update-idutils.sh
