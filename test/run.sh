#!/bin/bash

# bail on error
set -e

DIR=$( cd $( dirname "${BASH_SOURCE[0]}" ) && pwd )

# Note: dartanalyzer needs to be run from the root directory for proper path
# canonicalization.
echo $DIR/..
pushd $DIR/..
echo Analyzing library for warnings or type errors
dartanalyzer --fatal-warnings lib/dbcrypt.dart
popd > /dev/null

dart --checked $DIR/dbcrypt_test.dart
