import 'package:flutter/material.dart';
import 'package:introapp/data/users.dart';
import 'package:introapp/models/user.dart';
import 'package:introapp/screens/home_screen.dart';
import 'package:introapp/widgets/text_form_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  final List<User> users = List.of(myUsers);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void checkCredentials(String username, String password) {
    for (User user in widget.users) {
      if (user.username == username && user.password == password) {
        clearText();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomeScreen(
                  name: user.name,
                  info: user.info,
                  myProjects: user.projects,
                )));
      }
    }
    //showMessage("Incorrect credentials!!");
  }

  void clearText() {
    usernameController.clear();
    passwordController.clear();
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 150, 20, 20),
        behavior: SnackBarBehavior.floating,
        content: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.white70),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 125,
                child:
                    Icon(Icons.account_circle, size: 250, color: Colors.white),
              ),
              TextFormWidget(
                hintText: "Username",
                prefixIcon: const Icon(Icons.account_circle),
                controller: usernameController,
              ),
              TextFormWidget(
                hintText: "Password",
                obscureText: true,
                prefixIcon: const Icon(Icons.key),
                controller: passwordController,
              ),
              ElevatedButton(
                onPressed: () {
                  checkCredentials(
                      usernameController.text, passwordController.text);
                },
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                    Size.fromWidth(125),
                  ),
                ),
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
