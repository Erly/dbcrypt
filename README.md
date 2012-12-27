DBCrypt
===================

Port of [jBCrypt][jbc] to [Dart][d]. Actually unusable because it is really slow (it
takes more than 30s to hash a password with the default number of rounds on a 
Intel i5-3570 on Linux). The first version was more similar to the original code 
but took more than 100 seconds so I did several changes (using a factory constructor 
and making the methods and variables non-static) to support the scalarlist lib 
which reduced the time it takes to hash but clearly not enough.

Dart VM will become faster in the future and I'll try to optimize the code as
much as I can (which probably isn't much) so with time the library will become
usable at production level. Any help to make it faster and correct bugs is 
appreciated.

P.D: The problem is in the *_encipher* method which is called more than 2000000 
times to hash a password with the default salt. It takes more than 15ms for each
1000 calls while in java it takes less than 1ms

**NEW:** When running in production mode and without debugging it has a good performance,
not as good as in Java, but pretty good for a language that hasn't reached 1.0, 
in my computer it takes less than 1s to hash a password with the default number 
of rounds.

**NEW 2:** I've tried the same code in my laptop and in checked mode with debugging 
enabled runs almost as fast as in production mode without debugging. It takes around 
1s in both cases with the default number of rounds so it seems that the slow hashing 
in checked mode with debugging enabled is a bug that affects my main computer. I'm 
gonna try this same code in Windows to know if it's a problem with the support of 
my CPU in Ubuntu 12.10 kernel, a Dart bug or something else. I have Arch Linux on 
my laptop with the lattest stable kernel (3.7) while ubuntu 12.10 uses a patched 
3.5

**CAREFUL:** This library uses the random object of the math library which generates 
pseudorandom bits and is not suitable for cryptographic purposes. In the future this 
will be changed for a secure Random class  

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