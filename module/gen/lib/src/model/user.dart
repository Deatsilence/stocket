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
    this.id,
    this.token,
    this.refreshtoken,
    this.isverified,
    this.createdat,
    this.updatedat,
    this.name,
    this.surname,
    this.password,
    this.email,
    this.usertype,
  });

  /// [id] is the id of user
  final String? id;

  /// [name] is the name of user
  final String? name;

  /// [surname] is the surname of user
  final String? surname;

  /// [password] is the password of user
  final String? password;

  /// [email] is the email of user
  final String? email;

  /// [token] is the token of user
  final String? token;

  /// [refreshtoken] is the refresh token of user
  final String? refreshtoken;

  /// [usertype] is the usertype of user
  final String? usertype;

  /// [isverified] is the isverified of user
  final bool? isverified;

  /// [createdat] is the createdat of user
  final DateTime? createdat;

  /// [updatedat] is the updatedat of user
  final DateTime? updatedat;

  @override
  User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [
        name,
        surname,
        password,
        email,
        token,
        refreshtoken,
        usertype,
        isverified,
        createdat,
        updatedat,
      ];

  /// [copyWith] method
  User copyWith({
    String? id,
    String? name,
    String? surname,
    String? password,
    String? email,
    String? token,
    String? refreshtoken,
    String? usertype,
    bool? isverified,
    DateTime? createdat,
    DateTime? updatedat,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      password: password ?? this.password,
      email: email ?? this.email,
      token: token ?? this.token,
      refreshtoken: refreshtoken ?? this.refreshtoken,
      usertype: usertype ?? this.usertype,
      isverified: isverified ?? this.isverified,
      createdat: createdat ?? this.createdat,
      updatedat: updatedat ?? this.updatedat,
    );
  }
}
