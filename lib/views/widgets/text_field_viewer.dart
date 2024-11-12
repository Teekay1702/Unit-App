import 'package:flutter/material.dart';

class TextFieldViewer extends StatelessWidget {
  const TextFieldViewer({super.key, required this.unitNumberController});
  final TextEditingController unitNumberController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        controller: unitNumberController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Enter Unit Number',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
