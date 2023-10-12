import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        filled: true,
        suffixIcon: IconButton(
          icon: Icon(Icons.send),
          onPressed: () { 
            final textValue = textController.value.text;
            print('Send message: ${textValue}');
            textController.clear();
          },
        ),
      ),
      onTapOutside: (event) {
        print('Tap outside');
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        print('Submited value:$value');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}