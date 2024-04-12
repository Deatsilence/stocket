import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  final bool isLoading;

  BaseState({this.isLoading = false});

  @override
  List<Object?> get props => [isLoading];
}
