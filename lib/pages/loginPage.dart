import 'package:basic_flutter/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class LoginPage1 extends StatefulWidget {
  const LoginPage1({super.key});

  @override
  State<LoginPage1> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage1> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(String email, String password) async {
    try {
      http.Response response =
          await http.post(Uri.parse('https://reqres.in/api/register'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        Get.off(() => const HomePage());
      } else {
        // Get.snackbar(
        //   "Hello dear,",
        //   "Your username and password doesn't match",
        //   icon: const Icon(Icons.person, color: Colors.white),
        //   snackPosition: SnackPosition.TOP,
        //   backgroundColor: Colors.redAccent,
        //   margin: const EdgeInsets.all(10),
        //   colorText: Colors.white,
        //   duration: const Duration(seconds: 2),
        // );
        Get.defaultDialog(
          title: 'Alert',
          backgroundColor: Colors.red,
          middleText: "Username and Password doesn't match",
          contentPadding: const EdgeInsets.all(10.0),
          titleStyle: const TextStyle(
            color: Colors.white,
          ),
          middleTextStyle: const TextStyle(
            color: Colors.white,
          )

        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: Colors.red,
        iconTheme: const IconThemeData(color: Colors.white),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/icons/user_id.svg',
                height: 250,
                width: 400,
              ),
              TextField(
                controller: emailController,
                enableSuggestions: true,
                decoration: const InputDecoration(
                  hintText: 'Email Address',
                  border: OutlineInputBorder(),
                  focusColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  focusColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  login(emailController.text, passwordController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(500, 60),
                ),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
