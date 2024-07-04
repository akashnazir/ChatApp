// ignore_for_file: use_build_context_synchronously

import 'package:demo_app/pages/login_page.dart';
import 'package:demo_app/pages/settiing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/authentication/auth_service.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  // Sign out
  void signOut(BuildContext context) async {
    // Get the auth instance
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signout();
      // Navigate to the login page if sign out is successful
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } catch (e) {
      // Handle the error (e.g., show a snack bar)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign out failed: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Center(
              child: Icon(
                Icons.chat_sharp,
                size: 40,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ListTile(
              title: const Text(
                'Settings',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ListTile(
              title: const Text(
                'Sign Out',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: const Icon(Icons.logout),
              onTap: () {
                signOut(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
