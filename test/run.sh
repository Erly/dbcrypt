#!/bin/bash

# bail on error
set -e

DIR=$( cd $( dirname "${BASH_SOURCE[0]}" ) && pwd )

# Note: dart_analyzer needs to be run from the root directory for proper path
# canonicalization.
pushd $DIR/..
echo Analyzing library for warnings or type errors
dart_analyzer --fatal-warnings --fatal-type-errors lib/dbcrypt.dart --work analyzer_out
rm -r analyzer_out
popd

dart --checked dbcrypt_test.dart
