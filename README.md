DBCrypt
===================

Port of [jBCrypt][jbc] to [Dart][d].

This system hashes passwords using a version of Bruce Schneier's Blowfish block 
cipher with modifications designed to raise the cost of off-line password cracking. 
The computation cost of the algorithm is parameterised, so it can be increased 
as computers and Dart VM get faster.

**WARNING:** This library is server-only (for now) because it uses the scalarlib 
library for better performance.

[![](https://drone.io/erly/dBCrypt/status.png)](https://drone.io/erly/dBCrypt/latest)  

Installation
-------------

Add to your pubspec.yaml the following:

	dependencies:
	  dbcrypt: any

Usage
-----

Hashing a password is easy:

	import 'package:dbcrypt/dbcrypt.dart'
	
	main() {
	  var plainPassword = "P@55w0rd";
	  var hashedPassword = new DBCrypt().hashpw(plainPassword, new DBCrypt().gensalt());
	}
	
Comparing a plain and a hashed password is even easier:

	var isCorrect = new DBCrypt().checkpw(plain, hashed);


Running Tests
-------------

Dependencies are installed using the [Pub Package Manager][pub].

	# For running the tests it needs the 'dart' executable on your path. 
	# Execute the next command if it isn't already on your path:
	export DART_SDK=path/to/dart/sdk
	
    pub install
    
    test/run.sh

[jbc]: http://www.mindrot.org/projects/jBCrypt/
[d]: http://www.dartlang.org
[pub]: http://www.dartlang.org/docs/pub-package-manager/