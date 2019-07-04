import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final void Function(String text) onChanged;
  final void Function() onSubmitted;
  final TextInputType textInputType;
  final int maxLength;
  final FocusNode focusNode;

  FormTextField(this.hintText, this.textInputType, this.maxLength, {this.onChanged,  this.onSubmitted, this.controller, this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 16),
      controller: controller,
      keyboardType: textInputType,
      autocorrect: true,
      textCapitalization: TextCapitalization.sentences,
      textAlign: TextAlign.left,
      maxLength: maxLength,
      minLines: 1,
      maxLines: 3,
      focusNode: focusNode,
      onChanged: (text) => onChanged(text),
      onSubmitted: (text) => onSubmitted(),
      decoration: InputDecoration(
          labelText: hintText ,
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.pink))),
      
    );
  }
}
