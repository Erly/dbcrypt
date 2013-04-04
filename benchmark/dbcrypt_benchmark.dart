library dbcrypt_benchmark;

import 'package:dbcrypt/dbcrypt.dart';
import 'package:benchmark_harness/benchmark_harness.dart';

class DBCryptBenchmark extends BenchmarkBase {
  const DBCryptBenchmark() : super("DBCrypt");

  static void main() {
    new DBCryptBenchmark().report();
  }

  void run() {
    new DBCrypt().hashpw('patata', new DBCrypt().gensalt());
  }
}

main() {
  DBCryptBenchmark.main();
}
