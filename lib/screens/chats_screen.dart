import 'package:chat_ncst/helpers/firebase_repository.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final FirebaseRepository _repo = FirebaseRepository();

  final TextEditingController _messageCtrl = TextEditingController();

  Future<void> _onSignOut() async {
    // TODO (9): Implement sign out.
  }

  void _onSend() {
    // TODO (10): Implement sending of message.
  }

  @override
  Widget build(BuildContext context) {
    //TODO (8): Design your chats screen.
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: const Center(child: Placeholder()),
    );
  }
}
