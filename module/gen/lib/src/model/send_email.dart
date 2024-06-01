import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'send_email.g.dart';

@JsonSerializable()
@immutable
final class SendEmail extends BaseModel<SendEmail> with EquatableMixin {
  final String? email;

  SendEmail({
    this.email,
  });

  @override
  SendEmail fromJson(Map<String, dynamic> json) => _$SendEmailFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SendEmailToJson(this);

  @override
  List<Object?> get props => [email];

  SendEmail copyWith({
    String? email,
  }) {
    return SendEmail(
      email: email ?? this.email,
    );
  }
}
