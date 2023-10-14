import 'package:flutter/material.dart';
import 'package:maybeapp/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({
    super.key, 
    required this.message,
  });
  final Message  message;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}