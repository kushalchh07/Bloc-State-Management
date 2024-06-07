class LoginModel {
  dynamic status;
  dynamic msg;
  dynamic userId;
  dynamic sessionId;
  dynamic fullName;
  dynamic contactNumber;
  dynamic emailAddress;
  dynamic emailVerify;
  dynamic access_token;
  dynamic coupon;
  dynamic thumbnail;
  dynamic otp;
  LoginModel(
      {required this.status,
      //Newly Added Code
      this.msg,
      required this.userId,
      required this.sessionId,
      required this.fullName,
      required this.contactNumber,
      required this.emailAddress,
      required this.emailVerify,
      this.coupon,
      this.thumbnail,
      this.otp,
      required this.access_token});

  @override
  String toString() {
    return 'LoginModel{status: $status, msg: $msg, userId: $userId, sessionId: $sessionId, fullName: $fullName, contactNumber: $contactNumber, emailAddress: $emailAddress, emailVerify: $emailVerify, access_token: $access_token, coupon: $coupon, thumbnail: $thumbnail, otp: $otp}';
  }
}
