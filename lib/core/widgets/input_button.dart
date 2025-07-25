import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/core/utils/colors.dart';

class InputTextButton extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatter;
  final IconData? prefixIcon;
  const InputTextButton({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.validator,
    this.textInputType,
    this.textInputFormatter,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: validator,
        keyboardType: textInputType,
        inputFormatters: textInputFormatter,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon, color: AppColors.mainColor),
          label: Text(labelText),
          labelStyle: TextStyle(color: AppColors.mainColor),
          floatingLabelStyle: TextStyle(color: AppColors.mainColor),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: AppColors.enabledBorder),
          ),
          filled: false,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: AppColors.mainColor),
          ),

          hintStyle: TextStyle(color: AppColors.hintTextColor),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
