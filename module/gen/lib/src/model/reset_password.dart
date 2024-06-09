import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'reset_password.g.dart';

@JsonSerializable()
@immutable
final class ResetPassword extends BaseModel<ResetPassword> with EquatableMixin {
  final String? newPassword;
  final String? email;
  final String? code;

  ResetPassword({
    this.newPassword,
    this.email,
    this.code,
  });

  @override
  ResetPassword fromJson(Map<String, dynamic> json) => _$ResetPasswordFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResetPasswordToJson(this);

  @override
  List<Object?> get props => [newPassword, email, code];

  ResetPassword copyWith({
    String? newPassword,
    VerifyOTP? verifyOTP,
  }) {
    return ResetPassword(
      newPassword: newPassword ?? this.newPassword,
      email: email ?? this.email,
      code: code ?? this.code,
    );
  }
}
