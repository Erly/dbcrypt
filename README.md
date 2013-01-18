DBCrypt
===================

Port of [jBCrypt][jbc] to [Dart][d].

This system hashes passwords using a version of Bruce Schneier's Blowfish block 
cipher with modifications designed to raise the cos of off-line password cracking. 
The computation cost of the algorithm is parameterised, so it can be increased 
as computers and Dart VM get faster.

**CAREFUL:** This library uses the random object of the math library which generates 
pseudorandom bits and is not suitable for cryptographic purposes. In the future this 
will be changed for a secure Random class.  

Installing
-------------

Add to your pubspec.yaml the following:

	dependencies:
	  dbcrypt:
	    git: git@github.com:Erly/dbcrypt.git
	    
Needs further testing (and a secure random class) before adding it to pub, sorry.

Running Tests
-------------

Dependencies are installed using the [Pub Package Manager][pub].

    pub install
    
    export DART_PACKAGE_ROOT=file://`pwd`/packages
    dart test/dbcrypt_test.dart


[jbc]: http://www.mindrot.org/projects/jBCrypt/
[d]: http://www.dartlang.org
[pub]: http://www.dartlang.org/docs/pub-package-manager/