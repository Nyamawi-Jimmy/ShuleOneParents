import 'package:flutter/material.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<T> items;
  final String? Function(T?)? validator;
  final void Function(T?)? onChanged;
  final double borderRadius;
  final Color? fillColor;
  final Color? textColor;

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.items,
    this.value,
    this.validator,
    this.onChanged,
    this.borderRadius = 8.0,
    this.fillColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: theme.textTheme.titleSmall
                ?.copyWith(color: textColor ?? Colors.white)),
        const SizedBox(height: 4),
        DropdownButtonFormField<T>(
          value: value,
          validator: validator,
          onChanged: onChanged,
          dropdownColor: Colors.black87,
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            filled: false,
          ),
          style: TextStyle(color: textColor ?? Colors.white),
          iconEnabledColor: Colors.white,
          icon:Icon( Icons.keyboard_arrow_down),
          items: items
              .map((item) => DropdownMenuItem<T>(
            value: item,
            child: Text(item.toString()),
          ))
              .toList(),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
