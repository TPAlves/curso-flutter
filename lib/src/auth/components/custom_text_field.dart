import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final List<TextInputFormatter>? formatter;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.label,
    this.formatter,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;
  @override
  void initState() {
    super.initState();
    isObscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        inputFormatters: widget.formatter,
        obscureText: isObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon:
              widget.isPassword
                  ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
                  : null,
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        ),
      ),
    );
  }
}
