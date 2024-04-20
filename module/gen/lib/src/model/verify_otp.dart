import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'verify_otp.g.dart';

@JsonSerializable()
@immutable
final class VerifyOTP extends BaseModel<VerifyOTP> with EquatableMixin {
  final String? email;
  final String? code;

  VerifyOTP({
    this.email,
    this.code,
  });

  @override
  VerifyOTP fromJson(Map<String, dynamic> json) => _$VerifyOTPFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VerifyOTPToJson(this);

  @override
  List<Object?> get props => [email, code];

  VerifyOTP copyWith({
    String? email,
    String? code,
  }) {
    return VerifyOTP(
      email: email ?? this.email,
      code: code ?? this.code,
    );
  }
}
