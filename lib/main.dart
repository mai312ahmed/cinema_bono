import 'package:cinema_bono/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const CinemaBookingApp());
}

class CinemaBookingApp extends StatelessWidget {
  const CinemaBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cinema Booking App',
      home: SplashScreen(),
    );
  }
}
