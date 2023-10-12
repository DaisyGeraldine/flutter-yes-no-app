import 'package:flutter/material.dart';
import 'package:maybeapp/presentation/widgets/chat/her_message_bubble.dart';
import 'package:maybeapp/presentation/widgets/chat/my_message_bubble.dart';
import 'package:maybeapp/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/200'),
          ),
        ),
        title: const Text('Yes No App'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return index % 2 == 0
                      ? const MyMessageBubble()
                      : const HerMessageBubble();
                },
              ),
            ),
            // Box Text
            MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}