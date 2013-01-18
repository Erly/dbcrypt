library dbcrypt_test;

import 'package:unittest/unittest.dart';
import 'package:dbcrypt/dbcrypt.dart';

main() {
  /*String hashedPassword;
  test('Hash a password', () {
    int t1 = new Date.now().millisecondsSinceEpoch;
    hashedPassword = new DBCrypt().hashpw('patata', new DBCrypt().gensalt());
    int t2 = new Date.now().millisecondsSinceEpoch;
    print('It took \${(t2-t1)/1000} seconds to hash the password');
    print('hashed password: \$hashedPassword');
  });
  test('Check password', () {
    int t1 = new Date.now().millisecondsSinceEpoch;
    expect(true, new DBCrypt().checkpw('patata', hashedPassword));
    int t2 = new Date.now().millisecondsSinceEpoch;
    print('It took \${(t2-t1)/1000} seconds to check the password');
  });*/

  List<List<String>> test_vectors = [
    [ "",
    "\$2a\$06\$DCq7YPn5Rq63x1Lad4cll.",
    "\$2a\$06\$DCq7YPn5Rq63x1Lad4cll.TV4S6ytwfsfvkgY8jIucDrjc8deX1s." ],
    [ "",
    "\$2a\$08\$HqWuK6/Ng6sg9gQzbLrgb.",
    "\$2a\$08\$HqWuK6/Ng6sg9gQzbLrgb.Tl.ZHfXLhvt/SgVyWhQqgqcZ7ZuUtye" ],
    [ "",
    "\$2a\$10\$k1wbIrmNyFAPwPVPSVa/ze",
    "\$2a\$10\$k1wbIrmNyFAPwPVPSVa/zecw2BCEnBwVS2GbrmgzxFUOqW9dk4TCW" ],
    [ "",
    "\$2a\$12\$k42ZFHFWqBp3vWli.nIn8u",
    "\$2a\$12\$k42ZFHFWqBp3vWli.nIn8uYyIkbvYRvodzbfbK18SSsY.CsIQPlxO" ],
    [ "a",
    "\$2a\$06\$m0CrhHm10qJ3lXRY.5zDGO",
    "\$2a\$06\$m0CrhHm10qJ3lXRY.5zDGO3rS2KdeeWLuGmsfGlMfOxih58VYVfxe" ],
    [ "a",
    "\$2a\$08\$cfcvVd2aQ8CMvoMpP2EBfe",
    "\$2a\$08\$cfcvVd2aQ8CMvoMpP2EBfeodLEkkFJ9umNEfPD18.hUF62qqlC/V." ],
    [ "a",
    "\$2a\$10\$k87L/MF28Q673VKh8/cPi.",
    "\$2a\$10\$k87L/MF28Q673VKh8/cPi.SUl7MU/rWuSiIDDFayrKk/1tBsSQu4u" ],
    [ "a",
    "\$2a\$12\$8NJH3LsPrANStV6XtBakCe",
    "\$2a\$12\$8NJH3LsPrANStV6XtBakCez0cKHXVxmvxIlcz785vxAIZrihHZpeS" ],
    [ "abc",
    "\$2a\$06\$If6bvum7DFjUnE9p2uDeDu",
    "\$2a\$06\$If6bvum7DFjUnE9p2uDeDu0YHzrHM6tf.iqN8.yx.jNN1ILEf7h0i" ],
    [ "abc",
    "\$2a\$08\$Ro0CUfOqk6cXEKf3dyaM7O",
    "\$2a\$08\$Ro0CUfOqk6cXEKf3dyaM7OhSCvnwM9s4wIX9JeLapehKK5YdLxKcm" ],
    [ "abc",
    "\$2a\$10\$WvvTPHKwdBJ3uk0Z37EMR.",
    "\$2a\$10\$WvvTPHKwdBJ3uk0Z37EMR.hLA2W6N9AEBhEgrAOljy2Ae5MtaSIUi" ],
    [ "abc",
    "\$2a\$12\$EXRkfkdmXn2gzds2SSitu.",
    "\$2a\$12\$EXRkfkdmXn2gzds2SSitu.MW9.gAVqa9eLS1//RYtYCmB1eLHg.9q" ],
    [ "abcdefghijklmnopqrstuvwxyz",
    "\$2a\$06\$.rCVZVOThsIa97pEDOxvGu",
    "\$2a\$06\$.rCVZVOThsIa97pEDOxvGuRRgzG64bvtJ0938xuqzv18d3ZpQhstC" ],
    [ "abcdefghijklmnopqrstuvwxyz",
    "\$2a\$08\$aTsUwsyowQuzRrDqFflhge",
    "\$2a\$08\$aTsUwsyowQuzRrDqFflhgekJ8d9/7Z3GV3UcgvzQW3J5zMyrTvlz." ],
    [ "abcdefghijklmnopqrstuvwxyz",
    "\$2a\$10\$fVH8e28OQRj9tqiDXs1e1u",
    "\$2a\$10\$fVH8e28OQRj9tqiDXs1e1uxpsjN0c7II7YPKXua2NAKYvM6iQk7dq" ],
    [ "abcdefghijklmnopqrstuvwxyz",
    "\$2a\$12\$D4G5f18o7aMMfwasBL7Gpu",
    "\$2a\$12\$D4G5f18o7aMMfwasBL7GpuQWuP3pkrZrOAnqP.bmezbMng.QwJ/pG" ],
    [ "~!@#\$%^&*()      ~!@#\$%^&*()PNBFRD",
    "\$2a\$06\$fPIsBO8qRqkjj273rfaOI.",
    "\$2a\$06\$fPIsBO8qRqkjj273rfaOI.HtSV9jLDpTbZn782DC6/t7qT67P6FfO" ],
    [ "~!@#\$%^&*()      ~!@#\$%^&*()PNBFRD",
    "\$2a\$08\$Eq2r4G/76Wv39MzSX262hu",
    "\$2a\$08\$Eq2r4G/76Wv39MzSX262huzPz612MZiYHVUJe/OcOql2jo4.9UxTW" ],
    [ "~!@#\$%^&*()      ~!@#\$%^&*()PNBFRD",
    "\$2a\$10\$LgfYWkbzEvQ4JakH7rOvHe",
    "\$2a\$10\$LgfYWkbzEvQ4JakH7rOvHe0y8pHKF9OaFgwUZ2q7W2FFZmZzJYlfS" ],
    [ "~!@#\$%^&*()      ~!@#\$%^&*()PNBFRD",
    "\$2a\$12\$WApznUOJfkEGSmYRfnkrPO",
    "\$2a\$12\$WApznUOJfkEGSmYRfnkrPOr466oFDCaj4b6HY3EXGvfxm43seyhgC" ],
  ];

  test('Hash password', () {
    for (int i = 0; i < test_vectors.length; i++) {
      String plain = test_vectors[i][0];
      String salt = test_vectors[i][1];
      String expected = test_vectors[i][2];
      String hashed = new DBCrypt().hashpw(plain, salt);
      expect(hashed, expected);
    }
  });

  test('Gensalt with rounds', () {
    for (int i = 4; i <= 12; i++) {
      print(" $i:");
      for (int j = 0; j < test_vectors.length; j += 4) {
        String plain = test_vectors[j][0];
        String salt = new DBCrypt().gensaltWithRounds(i);
        String hashed1 = new DBCrypt().hashpw(plain, salt);
        String hashed2 = new DBCrypt().hashpw(plain, hashed1);
        expect(hashed1, hashed2);
      }
    }
  });

  test('Gensalt', () {
    for (int i = 0; i < test_vectors.length; i += 4) {
      String plain = test_vectors[i][0];
      String salt = new DBCrypt().gensalt();
      String hashed1 = new DBCrypt().hashpw(plain, salt);
      String hashed2 = new DBCrypt().hashpw(plain, hashed1);
      expect(hashed1, hashed2);
    }
  });

  test('Checkpw', () {
    for (int i = 0; i < test_vectors.length; i++) {
      String plain = test_vectors[i][0];
      String expected = test_vectors[i][2];
      expect(new DBCrypt().checkpw(plain, expected), true);
    }
  });

  test('Checkpw failure', () {
    for (int i = 0; i < test_vectors.length; i++) {
      int broken_index = (i + 4) % test_vectors.length;
      String plain = test_vectors[i][0];
      String expected = test_vectors[broken_index][2];
      expect(new DBCrypt().checkpw(plain, expected), false);
    }
  });

  test('International chars', () {
    String pw1 = "ππππππππ";
    String pw2 = "????????";

    String h1 = new DBCrypt().hashpw(pw1, new DBCrypt().gensalt());
    expect(false, new DBCrypt().checkpw(pw2, h1));
    print(".");

    String h2 = new DBCrypt().hashpw(pw2, new DBCrypt().gensalt());
    expect(false, new DBCrypt().checkpw(pw1, h2));
  });
}