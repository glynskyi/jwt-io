import 'package:jwt_io/jwt_io.dart';
import 'package:test/test.dart';

const token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6Ikd1c3Rhdm8iLCJpYXQiOjE1MTYyMzkwMjIsImV4cCI6NDczNDYxNTg1OH0.hh-TTBPS8z-UxdmfXWn7AwW2y_Lq3aPnlIQdqV2KEC4";
const expiredToken =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJleHAiOjE1MjYyMzkwMjJ9.GMdV0dx1F8rZuHUebeXL5tR2DROlc03IuDc2DeDTExI";

void main() {
  test("Decode a valid token", () {
    expect(JwtToken.payload(token)["name"], "Gustavo");
  });

  test("isExpired? Valid and no expired token", () {
    expect(JwtToken.isExpired(token), false);
  });

  test("isExpired? Valid but expired token", () {
    expect(JwtToken.isExpired(expiredToken), true);
  });

  test("isExpired? Invalid token", () {
    expect(JwtToken.isExpired("lñaslksa"), true);
  });

  test("Expiration date", () {
    expect(JwtToken.getExpirationDate(token).isAfter(DateTime.now()), true);
  });

  test("Expiration time", () {
    expect(JwtToken.getTokenTime(token).inDays, greaterThan(1));
  });
}
