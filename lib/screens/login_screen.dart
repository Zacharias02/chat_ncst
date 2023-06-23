import 'package:chat_ncst/helpers/firebase_repository.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseRepository _repo = FirebaseRepository();

  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  bool _isObscured = true;
  bool _isLoading = false;

  void _showNotification(String message) {
    //TODO (3): Implement notification when
    // showing an error upong signing in.
  }

  void _showHidePassword() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  Future<void> _onSignIn() async {
    //TODO (4): Implement signing in process.
  }

  @override
  Widget build(BuildContext context) {
    //TODO (5): Design your login screen.
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: const Center(child: Placeholder()),
    );
  }
}
