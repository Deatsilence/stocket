import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/base/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// [User] is the model for user
@JsonSerializable()
@immutable
final class User extends BaseModel<User> with EquatableMixin {
  /// Constructor
  User({
    this.name,
    this.surname,
    this.password,
    this.email,
    this.usertype,
  });

  /// [name] is the name of user
  final String? name;

  /// [surname] is the surname of user
  final String? surname;

  /// [password] is the password of user
  final String? password;

  /// [email] is the email of user
  final String? email;

  /// [usertype] is the usertype of user
  final String? usertype;

  @override
  User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [name, surname, password, email, usertype];

  ///
  User copyWith({
    String? name,
    String? surname,
    String? password,
    String? email,
    String? usertype,
  }) {
    return User(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      password: password ?? this.password,
      email: email ?? this.email,
      usertype: usertype ?? this.usertype,
    );
  }
}
