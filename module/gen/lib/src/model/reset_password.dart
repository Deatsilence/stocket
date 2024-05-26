import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'reset_password.g.dart';

@JsonSerializable()
@immutable
final class ResetPassword extends BaseModel<ResetPassword> with EquatableMixin {
  final String? newPassword;
  final VerifyOTP? verifyOTP;

  ResetPassword({
    this.newPassword,
    this.verifyOTP,
  });

  @override
  ResetPassword fromJson(Map<String, dynamic> json) => _$ResetPasswordFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResetPasswordToJson(this);

  @override
  List<Object?> get props => [newPassword, verifyOTP];

  ResetPassword copyWith({
    String? newPassword,
    VerifyOTP? verifyOTP,
  }) {
    return ResetPassword(
      newPassword: newPassword ?? this.newPassword,
      verifyOTP: verifyOTP ?? this.verifyOTP,
    );
  }
}
