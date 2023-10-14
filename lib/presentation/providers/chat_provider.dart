

import 'package:flutter/material.dart';
import 'package:maybeapp/config/helpers/get_yes_no_answers.dart';
import 'package:maybeapp/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswers = GetYesNoAnswers();

  final List<Message> messages = [
    Message(text: 'Hola como estas', fromWho: FromWho.me), 
    Message(text: 'Ya regresastes del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> senMessage(String text) async {
    if (text.isEmpty) return;
    messages.add(Message(text: text, fromWho: FromWho.me));

    print('text: ' + text);
    //herReply();

    if (text.endsWith('?')) {
      await Future.delayed(const Duration(milliseconds: 500));
      herReply();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    print(  'reply');
    final herMessage = await getYesNoAnswers.getAnswer();
    messages.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}