## JWT_IO

[![pub](https://img.shields.io/pub/v/jwt_io)](https://pub.dartlang.org/packages/jwt_io)
[![build](https://travis-ci.com/glynskyi/jwt-io.svg?branch=main)](https://travis-ci.com/glynskyi/jwt-io)
[![coverage](https://coveralls.io/repos/github/glynskyi/jwt-io/badge.svg?branch=main)](https://coveralls.io/github/glynskyi/jwt-io?branch=main)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

JSON Web Tokens are an open, industry standard RFC 7519 method for representing claims securely between two parties.

JWT_IO allows you to decode, verify and generate JWT.

## Getting Started

#### Decode a token

```dart
main () {
  String yourToken = "Your JWT";
  Map<String, dynamic> decodedToken = JwtToken.payload(yourToken);

  /*
  If the token has a valid format, you will get a Map<String, dynamic>
  Your decoded token can look like:
  {
     "sub": "1234567890",
     "name": "John Doe",
     "iat": 1516239022,
  }
  */
}
```

#### Know if the token is expired

```dart
main () {
  String yourToken = "Your JWT";
  bool hasExpired = JwtToken.isExpired(yourToken);

  // You will get a true / false response
  // true: if the token is already expired
  // false: if the token is not expired
}
```

#### Get expiration date

```dart
main () {
  String yourToken = "Your JWT";
  DateTime expirationDate = JwtToken.getExpirationDate(token);

  // 2025-01-13 13:04:18.000
  print(expirationDate);
}
```

#### You can know how old your token is

```dart
// Token payload must include an 'iat' field
main () {
  String yourToken = "Your JWT";
  Duration tokenTime = JwtToken.getTokenTime(token);

  // 15
  print(tokenTime.inDays);
}
```