import 'dart:convert';

class OtpLoginResponse {
  OtpLoginResponse({
    this.phone,
    this.data,
    this.otp,
  });

  late String? phone;
  late String? data;
  late String? otp;

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      'hash': data,
      'otp': otp,
    };
  }

  factory OtpLoginResponse.fromMap(Map<String, dynamic> map) {
    return OtpLoginResponse(
      phone: map['phone'],
      data: map['hash'],
      otp: map['otp'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OtpLoginResponse.fromJson(String source) =>
      OtpLoginResponse.fromMap(json.decode(source));

  OtpLoginResponse copyWith({String? phone, String? hash, String? otp}) {
    return OtpLoginResponse(
      phone: phone ?? this.phone,
      data: hash ?? this.data,
      otp: otp ?? this.otp,
    );
  }
}
