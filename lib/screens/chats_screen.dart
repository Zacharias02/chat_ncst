import 'package:chat_ncst/helpers/firebase_repository.dart';
import 'package:chat_ncst/widgets/chat_textfield.dart';
import 'package:chat_ncst/widgets/chats_listing.dart';
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
    await _repo.signOut();

    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/login');
  }

  void _onSend() {
    _repo.sendMessage(_messageCtrl.text.trim());
    _messageCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          'Welcome to Chat NCST',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: _onSignOut,
            icon: const Icon(Icons.exit_to_app, color: Colors.red),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ChatsListing(repository: _repo),
            const Divider(color: Colors.white),
            ChatTextField(
              controller: _messageCtrl,
              onSend: _onSend,
            )
          ],
        ),
      ),
    );
  }
}
