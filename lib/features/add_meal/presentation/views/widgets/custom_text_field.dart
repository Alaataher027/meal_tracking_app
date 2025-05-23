import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.onSavedS,
    this.onSavedI,
    this.onChanged,
    this.onSubmitted,
    required this.isNumerical,
    this.icon,
  });

  final String hint;
  final int maxLines;
  final bool isNumerical;
  final void Function(String?)? onSavedS;
  final void Function(int?)? onSavedI;
  final Function(String?)? onChanged;
  final Function(String)? onSubmitted;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextFormField(
        keyboardType: isNumerical ? TextInputType.number : TextInputType.text,
        onChanged: onChanged,
        onSaved: (value) {
          if (isNumerical) {
            onSavedI?.call(int.tryParse(value ?? ''));
          } else {
            onSavedS?.call(value);
          }
        },
        onFieldSubmitted: onSubmitted,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "Field is required";
          } else {
            return null;
          }
        },
        cursorColor: Colors.black,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hint,
          hintStyle: TextStyle(color: const Color.fromARGB(255, 133, 133, 133)),
          enabledBorder: buildBorder(),
          errorBorder: buildBorder((Colors.red)),
          focusedBorder: buildBorder(Colors.black),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.black),
    );
  }
}
