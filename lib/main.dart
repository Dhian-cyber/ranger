import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;
import 'package:flutter/services.dart';
import 'login.dart'; // Mengimpor LoginScreen dari login.dart
import 'dashboard.dart';
import 'tabel.dart';
import 'gambar.dart';
import 'tambah_barang.dart';
import 'menu_baru.dart';
import 'user_provider.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PermissionCheckScreen(),
        '/login': (context) =>
            const LoginScreen(), // Menggunakan LoginScreen dari login.dart
        '/dashboard': (context) => const DashboardScreen(),
        '/tabel': (context) => const TabelScreen(),
        '/gambar': (context) => const GambarScreen(),
        '/tambah-barang': (context) => const TambahBarangScreen(),
        '/menu-baru': (context) => const MenuBaruScreen(),
      },
    );
  }
}

class PermissionCheckScreen extends StatefulWidget {
  const PermissionCheckScreen({super.key});

  @override
  State<PermissionCheckScreen> createState() => _PermissionCheckScreenState();
}

class _PermissionCheckScreenState extends State<PermissionCheckScreen> {
  @override
  void initState() {
    super.initState();
    _checkNotificationPermission();
  }

  Future<void> _checkNotificationPermission() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool permissionRequested = prefs.getBool('permissionRequested') ?? false;
    bool notificationGranted = await Permission.notification.isGranted;

    if (!permissionRequested || !notificationGranted) {
      PermissionStatus status = await Permission.notification.request();

      if (status.isGranted) {
        await prefs.setBool('permissionRequested', true);
        _navigateToLoginScreen();
      } else {
        if (Platform.isIOS) {
          openAppSettings();
        } else if (Platform.isAndroid) {
          SystemNavigator.pop();
        }
      }
    } else {
      _navigateToLoginScreen();
    }
  }

  void _navigateToLoginScreen() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  void openAppSettings() async {
    final Uri settingsUri = Uri(scheme: 'app-settings');

    if (await canLaunchUrl(settingsUri)) {
      await launchUrl(settingsUri);
    } else {
      throw 'Could not open settings.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Checking Notification Permission...')),
    );
  }
}
