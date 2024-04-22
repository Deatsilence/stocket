import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocket/feature/view_model/root/root_view_model.dart';

/// [StateInitialize] is a [StatelessWidget] that contains the initialization state.
final class StateInitialize extends StatelessWidget {
  const StateInitialize({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RootViewModel>(
          create: (_) => RootViewModel(),
        ),
      ],
      child: child,
    );
  }
}
