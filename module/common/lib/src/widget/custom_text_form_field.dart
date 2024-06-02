// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:common/src/decoration/custom_input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// This is for authentication text form field
final class CustomTextFormField extends StatefulWidget {
  /// Constructor
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.validator,
    this.onSaved,
    this.onClear,
    this.prefixIcon,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
    this.borderColor,
    this.activeBorderColor,
    this.deActiveBorderColor,
    this.errorBorderColor,
    this.textInputAction,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.suffixIcon,
    this.autocorrect = false,
    this.obscureText = false,
    this.enabled = true,
    this.obscuringCharacter = '•',
  });

  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String? value)? onSaved;
  final void Function(String value)? onFieldSubmitted;
  final void Function(String value)? onChanged;
  final VoidCallback? onClear;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Color? borderColor;
  final Color? activeBorderColor;
  final Color? deActiveBorderColor;
  final Color? errorBorderColor;
  final bool autocorrect;
  final bool obscureText;
  final bool enabled;
  final String obscuringCharacter;
  final FocusNode? focusNode;
  final IconButton? suffixIcon;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isClearButtonVisible;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.text.isEmpty
          ? _isClearButtonVisible = false
          : _isClearButtonVisible = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        if (value.length == 1) {
          setState(() {
            _isClearButtonVisible = true;
          });
        } else if (value.isEmpty) {
          setState(() {
            _isClearButtonVisible = false;
          });
        }

        widget.onChanged?.call(value);
      },
      decoration: CustomInputDecoration(
        context: context,
        prefixIcon: widget.prefixIcon,
        suffixIcon: SizedBox(
          width: _isClearButtonVisible ? MediaQuery.sizeOf(context).width * 0.3 : 0,
          child: Row(
            mainAxisAlignment: widget.suffixIcon != null
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.suffixIcon ?? const SizedBox.shrink(),
              _SuffixClearIcon(
                onTap: () {
                  setState(() {
                    _isClearButtonVisible = false;
                  });
                  widget.controller?.clear();
                  widget.onClear?.call();
                },
                isVisible: _isClearButtonVisible,
              ),
            ],
          ),
        ),
        labelText: widget.labelText,
        hintText: widget.hintText,
        borderColor: widget.borderColor ?? Theme.of(context).colorScheme.primary,
        enableBorderColor:
            widget.activeBorderColor ?? Theme.of(context).colorScheme.secondary,
        deActiveBorderColor:
            widget.deActiveBorderColor ?? Theme.of(context).colorScheme.secondary,
        errorBorderColor: widget.errorBorderColor ?? Theme.of(context).colorScheme.error,
      ),
      validator: widget.validator,
      onSaved: widget.onSaved,
      controller: widget.controller,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      obscuringCharacter: widget.obscuringCharacter,
      autocorrect: widget.autocorrect,
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      enabled: widget.enabled,
    );
  }
}

/// [_SuffixClearIcon] is a private class that is used to show the suffix icon in the text form field
final class _SuffixClearIcon extends StatelessWidget {
  const _SuffixClearIcon({this.onTap, this.isVisible = false});

  final VoidCallback? onTap;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? InkWell(
            onTap: onTap,
            child: const Icon(Icons.clear_outlined),
          )
        : const SizedBox.shrink();
  }
}
