import 'package:flutter/material.dart';

class Ktextformfield extends StatelessWidget {
  final logo ,hinttext;
  const Ktextformfield({
    Key? key,
    required this.logo, required this.hinttext,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        decoration:  InputDecoration(
            prefixIcon: Icon(
              logo,
              color: Colors.indigo,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide.none,
            ),

            hintStyle: TextStyle(color: Colors.grey,fontFamily: "WorkSansLight"),
            filled: true,
            fillColor: Colors.white,
            hintText: hinttext),
      ),
    );
  }
}