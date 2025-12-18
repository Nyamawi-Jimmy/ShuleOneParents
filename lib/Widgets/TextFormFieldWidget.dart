import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController controller;
  final bool obscure;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final IconData? suffixIcon;
  final int? maxLength;
  final bool readOnly;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    required this.label,
    this.hint,
    required this.controller,
    this.obscure = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.suffixIcon,
    this.maxLength,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Colors.white
        )),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          style: TextStyle(color: Colors.white),
          obscureText: obscure,
          keyboardType: keyboardType,
          validator: validator,
          maxLength: maxLength,
          decoration: InputDecoration(
            hintText: hint,
            counterText: "",
            suffixIcon: suffixIcon != null ? Icon(suffixIcon, size: 17,color: Colors.white,) : null,
            iconColor: Theme.of(context).primaryColor,
            hintStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Colors.white,
              fontSize: 13,
            ),
            filled: false,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
