import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  final bool isAdmin;
  
  const ProfileScreen({Key? key, required this.isAdmin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFF6A6F4C),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // User Info Section
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile_placeholder.png'),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AuthService.currentUser?.email ?? 'Guest',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (isAdmin)
                    const Chip(
                      label: Text('ADMIN'),
                      backgroundColor: Colors.red,
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Admin Section (only visible to admins)
          if (isAdmin) ...[
            const Text(
              'Admin Tools',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A6F4C),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.dashboard, color: Color(0xFF6A6F4C)),
              title: const Text('Dashboard'),
              onTap: () {
                // Navigate to admin dashboard
              },
            ),
            ListTile(
              leading: const Icon(Icons.manage_accounts, color: Color(0xFF6A6F4C)),
              title: const Text('Manage Users'),
              onTap: () {
                // Navigate to user management
              },
            ),
            ListTile(
              leading: const Icon(Icons.inventory, color: Color(0xFF6A6F4C)),
              title: const Text('Product Management'),
              onTap: () {
                // Navigate to product management
              },
            ),
            const Divider(),
            const SizedBox(height: 16),
          ],

          // Account Settings Section
          const Text(
            'Account Settings',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6A6F4C),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit, color: Color(0xFF6A6F4C)),
            title: const Text('Edit Profile'),
            onTap: () {
              // Navigate to edit profile
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock, color: Color(0xFF6A6F4C)),
            title: const Text('Change Password'),
            onTap: () {
              // Navigate to change password
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications, color: Color(0xFF6A6F4C)),
            title: const Text('Notification Settings'),
            onTap: () {
              // Navigate to notification settings
            },
          ),

          // App Settings Section
          const SizedBox(height: 24),
          const Text(
            'App Settings',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6A6F4C),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language, color: Color(0xFF6A6F4C)),
            title: const Text('Language'),
            trailing: const Text('English'),
            onTap: () {
              // Navigate to language settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.color_lens, color: Color(0xFF6A6F4C)),
            title: const Text('Theme'),
            trailing: const Text('Light'),
            onTap: () {
              // Navigate to theme settings
            },
          ),

          // Logout Button
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6A6F4C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                AuthService.logout();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}