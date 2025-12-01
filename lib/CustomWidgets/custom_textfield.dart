import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool isRTL;
  final bool isPassword;
  final TextInputType keyboardType;
  final Color backgroundColor;
  final Color textColor;
  final Color cursorColor;
  final Color hintColor;
  final Color iconColor;
  final String? Function(String?)?validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.isRTL = false,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.backgroundColor = const Color(0xFFF5F5F5),
    this.textColor = Colors.black,
    this.cursorColor = Colors.blue,
    this.hintColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword && _obscureText,
        keyboardType: widget.keyboardType,
        textAlign: widget.isRTL ? TextAlign.right : TextAlign.left,
        style: TextStyle(
          color: widget.textColor,
          fontSize: 16,
        ),
        cursorColor: widget.cursorColor,
        cursorHeight: 18,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: widget.hintColor,
            fontSize: 16,
          ),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: widget.iconColor,
            size: 20,
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: widget.iconColor,
              size: 20,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          )
              : null,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.cursorColor, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
        validator: widget.validator??(value) {
          if (value == null || value.isEmpty) {
            return '${widget.hintText} ${'required'.tr()}';
          }
          if (widget.keyboardType == TextInputType.emailAddress) {
            if (!value.contains('@')) {
              return 'enter_valid_email'.tr();
            }
          }
          return null;
        },
      ),
    );
  }
}