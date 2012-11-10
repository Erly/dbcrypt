DBCrypt
===================

Port of [JBCrypt][jbc] to [Dart][d]. Actually unusable because it is really slow (it
takes more than 60s to hash a password with the default salt). The previous version
was more similar to the original code but took more than 100 seconds so I did
several changes (using a factory constructor and making the methods and variables 
non-static) to support the scalarlist lib which reduced the time it takes to
hash but clearly not enough.

Dart VM will become faster in the future and I'll try to optimize the code as
much as I can (which probably isn't much) so with time the library will become
usable at production level. Any help to make it faster and correct bugs is 
appreciated.

P.D: The problem is in the *_encipher* method which is called more than 2000000 
times to hash a password with the default salt. it takes more than 30ms for each
1000 calls while in java it takes less than 1ms

Installing
-------------

Add to your pubspec.yaml the following:

	dependencies:
	  dbcrypt:
	    git: git@github.com:Erly/dbcrypt.git

Running Tests
-------------

Dependencies are installed using the [Pub Package Manager][pub].

    pub install
    
    export DART_PACKAGE_ROOT=file://`pwd`/packages
    dart test/dbcrypt_test.dart


[jbc]: http://www.mindrot.org/projects/jBCrypt/
[d]: http://www.dartlang.org
[pub]: http://www.dartlang.org/docs/pub-package-manager/