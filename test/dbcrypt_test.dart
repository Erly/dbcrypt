library dbcrypt_test;

import 'package:unittest/unittest.dart';
import 'package:dbcrypt/dbcrypt.dart';

main() {
  String hashedPassword;
  test('Hash a password', () {
    hashedPassword = new DBCrypt().hashpw('patata', new DBCrypt().gensalt());
    print('hashed password: $hashedPassword');
  });
  test('Check password', () {
    expect(true, new DBCrypt().checkpw('patata', hashedPassword));
  });
}