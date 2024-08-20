import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';
import 'user_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    AuthResponse response = await _authService.login(username, password);

    if (response.success) {
      // Set user data in UserProvider
      // ignore: use_build_context_synchronously
      Provider.of<UserProvider>(context, listen: false)
          .setUser(username, response.data['name']);

      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login First')),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                constraints: BoxConstraints(
                  maxWidth: orientation == Orientation.portrait ? 400 : 600,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(labelText: 'Username'),
                    ),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Password'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _login,
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
