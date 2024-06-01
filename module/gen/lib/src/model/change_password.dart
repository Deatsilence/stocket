import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'change_password.g.dart';

@JsonSerializable()
@immutable
final class ChangePassword extends BaseModel<ChangePassword> with EquatableMixin {
  final String? email;
  final String? oldPassword;
  final String? newPassword;

  ChangePassword({this.email, this.oldPassword, this.newPassword});

  @override
  ChangePassword fromJson(Map<String, dynamic> json) => _$ChangePasswordFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChangePasswordToJson(this);

  @override
  List<Object?> get props => [email, oldPassword, newPassword];

  ChangePassword copyWith({
    String? email,
    String? newPassword,
    String? oldPassword,
  }) {
    return ChangePassword(
      email: email ?? this.email,
      oldPassword: oldPassword ?? this.oldPassword,
      newPassword: newPassword ?? this.newPassword,
    );
  }
}
