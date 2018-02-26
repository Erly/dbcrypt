library dbcrypt_benchmark;

import 'package:dbcrypt/dbcrypt.dart';
import 'package:benchmark_harness/benchmark_harness.dart';

class HashPasswordBenchmark extends BenchmarkBase {
  const HashPasswordBenchmark() : super("Hash Password");

  static void main() {
    new HashPasswordBenchmark().report();
  }

  void run() {
    new DBCrypt().hashpw('patata', new DBCrypt().gensalt());
  }
}

class CheckPasswordBenchmark extends BenchmarkBase {
  const CheckPasswordBenchmark(int numRounds) : super("Check Password $numRounds rounds");

  static int _numRounds;
  static String _hashedPassword;


  static void main(int numRounds) {
    _numRounds = numRounds;
    new CheckPasswordBenchmark(numRounds).report();
  }

  void setup() {
    _hashedPassword = new DBCrypt().hashpw('patata', new DBCrypt().gensaltWithRounds(_numRounds));
  }

  void run() {
    new DBCrypt().checkpw('patata', _hashedPassword);
  }
}

void main() {
  HashPasswordBenchmark.main();
  CheckPasswordBenchmark.main(10);
  CheckPasswordBenchmark.main(11);
  CheckPasswordBenchmark.main(12);
  CheckPasswordBenchmark.main(13);
  CheckPasswordBenchmark.main(14);
}
