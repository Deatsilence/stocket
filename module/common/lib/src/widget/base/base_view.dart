import 'package:common/common.dart';
import 'package:flutter/material.dart';

/// [BaseView] is a [StatelessWidget] that displays the base authentication view.
final class BaseView<T> extends StatefulWidget {
  /// Constructor
  const BaseView({
    required this.onPageBuilder,
    this.sliverAppBar,
    this.onDispose,
    super.key,
  });

  /// [onPageBuilder] is the callback function that is called
  final Widget Function(BuildContext context, T value) onPageBuilder;

  /// [onDispose] is the callback function that is called
  /// when the view is disposed.
  final VoidCallback? onDispose;

  /// [sliverAppBar] is the sliver app bar for the view.
  final SliverAppBar? sliverAppBar;

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T> extends State<BaseView<T>> {
  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose!.call();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
          top: !(widget.sliverAppBar != null),
          bottom: false,
          child: CustomScrollView(
            // physics: const BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              widget.sliverAppBar ?? const SliverToBoxAdapter(child: SizedBox.shrink()),
              SliverPadding(
                padding: PaddingManager.paddingManagerNormalPaddingSymmetricHorizontal,
                sliver: widget.onPageBuilder(context, widget as T),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// /// [_AuthBody] is a [StatelessWidget] that displays the body of the authentication view.
// final class _AuthBody extends StatelessWidget {
//   const _AuthBody({
//     required this.widget,
//   });

//   final BaseView widget;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             widget.titleText,
//             style: Theme.of(context).textTheme.headlineLarge,
//           ),
//         ),
//         ...widget.formFields
//       ],
//     );
//   }
// }
