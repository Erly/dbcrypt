library dbcrypt_test;

import 'package:unittest/unittest.dart';
import 'package:dbcrypt/dbcrypt.dart';

main() {
  String hashedPassword;
  test('Hash a password', () {
    var t1 = new Date.now().millisecondsSinceEpoch;
    hashedPassword = new DBCrypt().hashpw('patata', new DBCrypt().gensalt());
    var t2 = new Date.now().millisecondsSinceEpoch;
    print('It took ${(t2-t1)/1000} seconds to hash the password');
    print('hashed password: $hashedPassword');
  });
  test('Check password', () {
    var t1 = new Date.now().millisecondsSinceEpoch;
    expect(true, new DBCrypt().checkpw('patata', hashedPassword));
    var t2 = new Date.now().millisecondsSinceEpoch;
    print('It took ${(t2-t1)/1000} seconds to check the password');
  });
}