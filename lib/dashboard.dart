import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'scaffold_with_drawer.dart';
import 'user_provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String? _fcmToken;

  @override
  void initState() {
    super.initState();
    _getToken();
  }

  Future<void> _getToken() async {
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    String? token = await firebaseMessaging.getToken();
    setState(() {
      _fcmToken = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final name = userProvider.name;

    return ScaffoldWithDrawer(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Dashboard'),
            if (_fcmToken != null)
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Token: $_fcmToken',
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome, $name!', style: const TextStyle(fontSize: 24)),
      ),
      activeRoute: '/dashboard',
    );
  }
}
