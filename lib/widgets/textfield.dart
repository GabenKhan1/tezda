import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    Key? key,
    this.labelText,
    this.textEditingController,
    this.keyboardType,
    this.maxLines = 1,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.obscureText = false,
    this.enabled,
    this.onChanged,
    this.borderRadius,
    this.blurRadius,
    this.elevation,
    this.hintText,
  }) : super(key: key);

  final String? labelText;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool? enabled;
  final void Function(String)? onChanged;
  final double? blurRadius;
  final double? borderRadius;
  final double? elevation;
  final String? hintText;

  final InputBorder bordersStyle = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(45)),
    borderSide: BorderSide(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
      ),
      elevation: elevation ?? 5,
      child: TextFormField(
        enabled: enabled,
        controller: textEditingController,
        keyboardType: keyboardType,
        maxLines: maxLines,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
          hintText: hintText,
          alignLabelWithHint: true,
          border: bordersStyle,
          enabledBorder: bordersStyle,
          focusedBorder: bordersStyle,
          disabledBorder: bordersStyle,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
