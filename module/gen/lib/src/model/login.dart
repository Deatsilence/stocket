import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'login.g.dart';

@JsonSerializable()
@immutable
final class Login extends BaseModel<Login> with EquatableMixin {
  final String? password;
  final String? email;

  Login({
    this.password,
    this.email,
  });

  @override
  Login fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginToJson(this);

  @override
  List<Object?> get props => [password, email];

  Login copyWith({
    String? password,
    String? email,
  }) {
    return Login(
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }
}
