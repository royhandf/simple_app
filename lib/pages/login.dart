import 'package:flutter/material.dart';
import '../utils/data.dart';
import 'menu.dart';
import 'package:fluttericon/elusive_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHidden = true;

  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white24,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Sign In",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Hi there! Nice to see you again.",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: username,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('username'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: password,
                obscureText: isHidden,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: const Text('password'),
                    suffixIcon: IconButton(
                      icon: (isHidden
                          ? const Icon(Elusive.eye)
                          : const Icon(Elusive.eye_off)),
                      onPressed: () {
                        setState(() {
                          if (isHidden == true) {
                            isHidden = false;
                          } else {
                            isHidden = true;
                          }
                        });
                      },
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  // color: Colors.blue,
                  height: 50,
                  width: double.infinity,
                  child: const Center(
                      child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  )),
                ),
                onTap: () {
                  int indexdata = login();
                  if (indexdata == -2) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            "username dan password yg Anda masukkan salah",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Exit"),
                            )
                          ],
                        );
                      },
                    );
                  } else {
                    // print(indexdata);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Menu(indexdata);
                        },
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  // SizedBox newMethod() {
  //   return const SizedBox(
  //     height: 20,
  //   );
  // }

  login() {
    int? index;
    for (var i = 0; i < members.length; i++) {
      if (username.text == members[i]['username'] &&
          password.text == members[i]['password']) {
        index = i;
        break;
      } else {
        index = -2;
      }
    }

    return index;
  }
}
