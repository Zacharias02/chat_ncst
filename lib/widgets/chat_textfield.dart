import 'package:flutter/material.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({
    super.key,
    required this.controller,
    required this.onSend,
  });

  final TextEditingController controller;
  final VoidCallback onSend;

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  bool _enableSending = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: Colors.yellow,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Please enter your message here...',
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.send,
            color: (_enableSending) ? Colors.white : Colors.grey,
          ),
          onPressed: (_enableSending) ? widget.onSend : null,
        ),
      ),
      onEditingComplete: (_enableSending) ? widget.onSend : null,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            _enableSending = true;
          });
        } else {
          setState(() {
            _enableSending = false;
          });
        }
      },
    );
  }
}
