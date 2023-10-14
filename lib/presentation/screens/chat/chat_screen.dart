import 'package:flutter/material.dart';
import 'package:maybeapp/domain/entities/message.dart';
import 'package:maybeapp/presentation/providers/chat_provider.dart';
import 'package:maybeapp/presentation/widgets/chat/her_message_bubble.dart';
import 'package:maybeapp/presentation/widgets/chat/my_message_bubble.dart';
import 'package:maybeapp/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/200'),
          ),
        ),
        title: const Text('Mi adorable Sam'),
        centerTitle: false,
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messages[index];
                  print('message: ' + index.toString());
                  return message.fromWho == FromWho.me
                    ? MyMessageBubble(
                        message: message
                    )
                    : HerMessageBubble(
                        message: message,
                    );
                },
              ),
            ),
            // Box Text
            MessageFieldBox(
              onValue: chatProvider.senMessage,
            ),
          ],
        ),
      ),
    );
  }
}