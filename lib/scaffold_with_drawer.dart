import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_drawer.dart';
import 'user_provider.dart';

class ScaffoldWithDrawer extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;
  final String activeRoute;

  const ScaffoldWithDrawer({
    super.key,
    required this.body,
    this.appBar,
    required this.activeRoute,
  });

  @override
  Widget build(BuildContext context) {
    // Mendapatkan instance UserProvider dari context
    final userProvider = Provider.of<UserProvider>(context);
    // ignore: unused_local_variable
    final username = userProvider.username;
    // ignore: unused_local_variable
    final name = userProvider.name;

    return Scaffold(
      appBar: appBar ?? AppBar(),
      drawer: AppDrawer(activeRoute: activeRoute), // Hanya kirim activeRoute
      body: body,
    );
  }
}
