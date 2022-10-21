import 'package:flutter/material.dart';
import '../utils/data.dart';
import 'menu.dart';
import 'profile.dart';
import 'package:fluttericon/elusive_icons.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
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
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign In",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Hi there! Nice to see you again.",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: username,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('username'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: password,
                obscureText: isHidden,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('password'),
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
              newMethod(),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // color: Colors.blue,
                  height: 50,
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 25),
                  )),
                ),
                onTap: () {
                  int indexdata = login();
                  // print(indexdata);
                  if (indexdata == -2) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                              "username dan password yg Anda masukkan salah"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Exit"),
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
                          return menu(indexdata);
                        },
                      ),
                    );
                    print("Hello Nilai index data adalah $indexdata");
                  }
                  // print("username dan password yg Anda masukkan salah");
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox newMethod() {
    return SizedBox(
      height: 20,
    );
  }

  login() {
    int? index;
    for (var i = 0; i < members.length; i++) {
      print(members[i]['username']);
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
