import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({
    super.key, 
    required this.onValue,
  });

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.transparent),
        );
    final textController = TextEditingController();
    final focusNode = FocusNode();
    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: InputDecoration(
        hintText: 'Escribe un mensaje',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        filled: true,
        suffixIcon: IconButton(
          icon: Icon(Icons.send),
          onPressed: () { 
            final textValue = textController.text;
            print('Send message: ${textValue}');
            textController.clear();
            onValue(textValue);
          },
        ),
      ),
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}