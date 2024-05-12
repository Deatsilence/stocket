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
    this.autocorrect = false,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.suffixIcon,
  });

  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String? value)? onSaved;
  final void Function(String value)? onFieldSubmitted;
  final void Function(String value)? onChanged;
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
  final String obscuringCharacter;
  final FocusNode? focusNode;
  final IconButton? suffixIcon;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isClearButtonVisible = false;

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
        prefixIcon: widget.prefixIcon,
        suffixIcon: SizedBox(
          width: _isClearButtonVisible ? MediaQuery.sizeOf(context).width * 0.2 : 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.suffixIcon ?? const SizedBox.shrink(),
              _SuffixClearIcon(
                onTap: () {
                  setState(() {
                    _isClearButtonVisible = false;
                  });
                  widget.controller?.clear();
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
