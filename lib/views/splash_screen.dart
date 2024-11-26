// ignore_for_file: use_build_context_synchronously
import 'package:cinema_bono/methods/get_data_methods.dart';
import 'package:cinema_bono/common%20widget/background.dart';
import 'package:cinema_bono/common%20widget/logo_section.dart';
import 'package:cinema_bono/views/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? userName;
  List<Map<String, dynamic>> movies = [];
  checkUserStatus() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userName = await getUserInfo();
      movies = await getMovies();
    }
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => user != null
                ? HomeScreen(
                    userName: userName ?? "Bono user",
                    movies: movies,
                  )
                : const LoginScreen()),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(
            image: 'assets/images/img2.jpeg',
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Logo(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Book you movie ticket any time",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  " any where with enjoy",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
