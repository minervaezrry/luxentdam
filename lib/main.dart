import 'package:flutter/material.dart';
import 'screens/auth_service.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/cart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luxent Shop',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/home': (context) => HomeScreen(
              isAdmin: AuthService.currentUser?.isAdmin ?? false,
            ),
        '/login': (context) => const LoginScreen(),
        '/profile': (context) => ProfileScreen(
              isAdmin: AuthService.currentUser?.isAdmin ?? false,
            ),
        '/signup': (context) => const SignUpScreen(),
        '/cart': (context) => const CartScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF6A6F4C),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6A6F4C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }
}
