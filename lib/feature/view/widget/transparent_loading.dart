import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

/// [TransparentScreen] is a [StatelessWidget] that shows a transparent screen
final class TransparentScreen<VM extends BlocBase<S>, S> extends StatelessWidget {
  const TransparentScreen({
    required this.child,
    required this.selector,
  });

  final Widget? child;
  final bool Function(S state) selector;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VM, S, bool>(
      selector: (state) => selector(state),
      builder: (context, state) {
        return state
            ? SizedBox(
                height: 100.h,
                width: 100.w,
                child: ColoredBox(
                  color: Colors.black.withOpacity(0.5),
                  child: child ?? SizedBox.shrink(),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
