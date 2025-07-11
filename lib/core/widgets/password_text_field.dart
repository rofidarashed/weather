import 'package:flutter/material.dart';
import 'package:weather/core/utils/colors.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;

  const PasswordTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          hintText: "********",
          labelStyle: TextStyle(color: AppColors().mainColor),
          floatingLabelStyle: TextStyle(color: AppColors().mainColor),
          labelText: widget.labelText,
          prefixIcon: IconButton(
            icon: Icon(
              _obscureText
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: _obscureText ? AppColors().mainColor : AppColors().red,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: AppColors().enabledBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors().focusedborder, width: 2),
          ),
          filled: false,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          fillColor: AppColors().white,
          hintStyle: TextStyle(color: AppColors().hintTextColor),
        ),
        validator: widget.validator,
      ),
    );
  }
}
