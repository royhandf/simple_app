import 'package:flutter/material.dart';
import '../utils/data.dart';
import 'login.dart';
import 'members.dart';

class Menu extends StatelessWidget {
  final int indexdata;
  const Menu(this.indexdata, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              // alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 200,
              color: Colors.lightBlue[200],
              child: Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/${members[indexdata]['profile']}"),
                            fit: BoxFit.cover),
                      ),
                      height: 125,
                      width: 125,
                      margin: const EdgeInsets.only(top: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("${members[indexdata]['name']}"),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.equalizer),
              title: const Text("Members"),
              trailing: const Icon(Icons.chevron_left),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ListMember();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Text("Selamat Datang ${members[indexdata]['name']}"),
      ),
    );
  }
}
