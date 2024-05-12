import 'package:common/common.dart';
import 'package:flutter/material.dart';

/// [BaseView] is a [StatelessWidget] that displays the base authentication view.
final class BaseView<T> extends StatefulWidget {
  /// Constructor
  const BaseView({
    required this.onPageBuilder,
    this.sliverAppBar,
    this.drawer,
    this.floatingActionButton,
    this.onDispose,
    this.physics,
    this.resizeToAvoidBottomInset = true,
    super.key,
  });

  /// [onPageBuilder] is the callback function that is called
  final Widget Function(BuildContext context, T value) onPageBuilder;

  /// [onDispose] is the callback function that is called
  /// when the view is disposed.
  final VoidCallback? onDispose;

  /// [sliverAppBar] is the sliver app bar for the view.
  final SliverAppBar? sliverAppBar;

  /// [drawer] is the drawer for the view.
  final Widget? drawer;

  /// [floatingActionButton] is the floating action button for the view.
  final Widget? floatingActionButton;

  /// [physics] is the scroll physics for the view.
  final ScrollPhysics? physics;

  /// [resizeToAvoidBottomInset] is the flag to resize the view to avoid the bottom inset.
  final bool resizeToAvoidBottomInset;

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
      drawer: widget.sliverAppBar != null ? widget.drawer : null,
      drawerEnableOpenDragGesture: false,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      floatingActionButton: widget.floatingActionButton,
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
            shrinkWrap: true,
            physics: MediaQuery.of(context).viewInsets.bottom > 0
                ? const AlwaysScrollableScrollPhysics()
                : widget.physics ?? const NeverScrollableScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              widget.sliverAppBar ?? const SliverToBoxAdapter(child: SizedBox.shrink()),
              SliverPadding(
                padding: PaddingManager.paddingManagerNormalPaddingSymmetricHorizontal,
                sliver: widget.onPageBuilder(context, widget as T),
              ),
              const SliverFillRemaining(
                hasScrollBody: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
