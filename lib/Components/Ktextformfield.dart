import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Ktextformfield extends StatelessWidget {
  final logo ,hinttext,controller,keyboardType,isobscureText;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  const Ktextformfield({
    Key? key,
    required this.logo, required this.hinttext, required this.validator , this.inputFormatters, this.controller, this.keyboardType , required this.isobscureText

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        validator: validator,
        obscureText: isobscureText,
        keyboardType: keyboardType,
        controller: controller,
        decoration:  InputDecoration(
            prefixIcon: Icon(
              logo,
              color: Colors.indigo,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide.none,
            ),

            hintStyle: const TextStyle(color: Colors.grey,fontFamily: "WorkSansLight",fontWeight: FontWeight.bold),
            filled: true,
            fillColor: Colors.white,
            hintText: hinttext),
      ),
    );
  }
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName{
    final nameRegExp = new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword{
    final passwordRegExp =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull{
    return this!=null;
  }

  bool get isValidPhone{
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }

}