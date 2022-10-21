import 'package:flutter/material.dart';
import '../utils/data.dart';
import 'login.dart';
import 'profile.dart';

class menu extends StatelessWidget {
  final int indexdata;
  const menu(this.indexdata);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              // alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 200,
              color: Colors.lightBlue[200],
              child: Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color.fromARGB(123, 1, 50, 100),
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/${members[indexdata]['profile']}"),
                            fit: BoxFit.cover),
                      ),
                      height: 125,
                      width: 125,
                      margin: EdgeInsets.only(top: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("${members[indexdata]['name']}"),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => loginpage(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.equalizer),
              title: Text("Members"),
              trailing: Icon(Icons.chevron_left),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return profilemember();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Text("Ini adalah halaman ${members[indexdata]['name']}"),
      ),
    );
  }
}
