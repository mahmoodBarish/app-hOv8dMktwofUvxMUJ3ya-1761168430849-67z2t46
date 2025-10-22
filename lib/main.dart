import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/whatsapp_chats.dart';
import 'screens/whatsapp_chat.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/whatsapp_chats',
  routes: [
    GoRoute(
      path: '/whatsapp_chats',
      builder: (context, state) => const WhatsappChats(),
    ),
    GoRoute(
      path: '/whatsapp_chat',
      builder: (context, state) => const WhatsappChat(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
