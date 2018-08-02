import 'package:dbcrypt/dbcrypt.dart';

void main() {
  DBCrypt dBCrypt = DBCrypt();
  const plainPwd = "mySuperSecretP@ssw0rd";
  // Hash password with default values
  String hashedPwd = dBCrypt.hashpw(plainPwd, dBCrypt.gensalt());

  // Check the plain password against the hashed password
  assert(dBCrypt.checkpw(plainPwd, hashedPwd), true);

  // Generate a salt with a cost of 12 and hash the password with it
  String salt = dBCrypt.gensaltWithRounds(12);
  hashedPwd = dBCrypt.hashpw(plainPwd, salt);

  // Check the plain password against the 12-cost hashed password
  assert(dBCrypt.checkpw(plainPwd, hashedPwd), true);
}
