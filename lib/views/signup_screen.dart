// ignore_for_file: use_build_context_synchronously
import 'package:cinema_bono/methods/get_data_methods.dart';
import 'package:cinema_bono/methods/signup_method.dart';
import 'package:cinema_bono/views/login_screen.dart';
import 'package:cinema_bono/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

GlobalKey<FormState> formstate = GlobalKey<FormState>();

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    String userName = '';
    return Scaffold(
      body: Stack(
        children: [
          const Background(
            image: 'assets/images/img1.jpeg',
          ),
          Form(
            key: formstate,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 100),
                    const Center(child: Logo()),
                    const SizedBox(height: 100),
                    TextFormField(
                      onChanged: (value) => userName = value,
                      validator: (val) {
                        if (val!.length < 2) {
                          return "User name can't be less than 2 letters";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'User Name',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onChanged: (value) => email = value,
                      validator: (val) {
                        if (val!.length < 12) {
                          return "Email can't be less than 12 letters";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onChanged: (value) => password = value,
                      validator: (val) {
                        if (val!.length < 8) {
                          return "Password can't be less than 8 letters";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () async {
                        if (formstate.currentState!.validate()) {
                          if (await signup(context,
                              email: email,
                              password: password,
                              userName: userName)) {
                            var userName = await getUserInfo();
                            List<Map<String, dynamic>> movies =
                                await getMovies();
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen(
                                        movies: movies,
                                        userName: userName ?? "Guest",
                                      )),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20, color: Colors.purple),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        child: const Text('Already have an account?',
                            style: TextStyle(color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
