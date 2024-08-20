import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_provider.dart';

class AppDrawer extends StatelessWidget {
  final String activeRoute;

  const AppDrawer({
    super.key,
    required this.activeRoute,
  });

  @override
  Widget build(BuildContext context) {
    // Mendapatkan instance UserProvider dari context
    final userProvider = Provider.of<UserProvider>(context);
    // final username = userProvider.username;
    final name = userProvider.name;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    name.isNotEmpty ? name[0].toUpperCase() : '?',
                    style: const TextStyle(fontSize: 40.0, color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          _buildListTile(context, 'Dashboard', '/dashboard'),
          _buildListTile(context, 'Tabel', '/tabel'),
          _buildListTile(context, 'Gambar', '/gambar'),
          _buildListTile(context, 'Tambah Barang', '/tambah-barang'),
          _buildListTile(context, 'Menu Baru', '/menu-baru'),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              // Log out logic
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }

  ListTile _buildListTile(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight:
              activeRoute == route ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        Navigator.pushReplacementNamed(context, route);
      },
    );
  }
}
