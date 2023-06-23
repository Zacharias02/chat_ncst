import 'package:chat_ncst/helpers/firebase_repository.dart';
import 'package:chat_ncst/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _showHidePassword() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  Future<void> _onSignIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        await _repo.signInWithEmailAndPassword(
          email: _emailCtrl.text,
          password: _passwordCtrl.text,
        );

        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/chats');
      } on FirebaseAuthException catch (authErr) {
        _showNotification(authErr.message ?? 'Something went wrong!');
      } catch (e) {
        _showNotification('Something went wrong!');
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Center(
        child: SizedBox(
          height: 500,
          width: 500,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome to Chat NCST!',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 25),
                    CustomTextField(
                      controller: _emailCtrl,
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      validator: (value) {
                        if ((value?.isEmpty ?? false) || value == null) {
                          return 'Email is required.';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: _passwordCtrl,
                      isObscured: _isObscured,
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                        onPressed: _showHidePassword,
                        icon: _isObscured
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                      validator: (value) {
                        if ((value?.isEmpty ?? false) || value == null) {
                          return 'Password is required.';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: _onSignIn,
                      child: (_isLoading)
                          ? const CircularProgressIndicator()
                          : const Text('Sign in'),
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/register');
                      },
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
