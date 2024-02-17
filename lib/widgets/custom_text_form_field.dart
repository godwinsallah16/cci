import 'package:cci_mobile/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final Alignment? alignment;
  final double? width;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextStyle? textStyle;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;

  const CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: _buildTextFormField(),
          )
        : _buildTextFormField();
  }

  Widget _buildTextFormField() {
    return SizedBox(
      width: widget.width ?? double.maxFinite,
      child: TextFormField(
        controller: _controller,
        onChanged: widget.onChanged,
        focusNode: _focusNode,
        autofocus: widget.autofocus,
        style: widget.textStyle ?? theme.textTheme.titleMedium,
        obscureText: widget.obscureText!,
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType,
        maxLines: widget.maxLines ?? 1,
        decoration: _decoration,
        validator: widget.validator,
      ),
    );
  }

  InputDecoration get _decoration => InputDecoration(
        hintText: widget.hintText ?? "",
        hintStyle: widget.hintStyle ?? theme.textTheme.titleMedium,
        prefixIcon: widget.prefix,
        prefixIconConstraints: widget.prefixConstraints,
        suffixIcon: widget.suffix,
        suffixIconConstraints: widget.suffixConstraints,
        isDense: true,
        contentPadding: widget.contentPadding ?? EdgeInsets.all(16.h),
        fillColor: widget.fillColor ?? appTheme.gray300,
        filled: widget.filled,
        border: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.h),
              borderSide: BorderSide.none,
            ),
        enabledBorder: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.h),
              borderSide: BorderSide.none,
            ),
        focusedBorder: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.h),
              borderSide: BorderSide.none,
            ),
      );
}

/// Extension on [CustomTextFormField] to facilitate inclusion of all types of border style etc
extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get fillPrimary => OutlineInputBorder(
        borderRadius: BorderRadius.circular(27.h),
        borderSide: BorderSide.none,
      );
}
