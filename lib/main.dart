import 'package:flutter/material.dart';
import 'package:maybeapp/config/theme/app_theme.dart';
import 'package:maybeapp/presentation/providers/chat_provider.dart';
import 'package:maybeapp/presentation/screens/chat/chat_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
        title: 'Yes No App',
        theme: AppTheme(selectedColor: 13).theme(),
        home: const ChatScreen()
      ),
    );
  }
}