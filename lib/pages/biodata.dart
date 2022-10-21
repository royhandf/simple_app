import 'package:flutter/material.dart';
import '../utils/data.dart';

class Biodata extends StatelessWidget {
  final int index;

  const Biodata(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.blue[200],
          child: ListView(
            children: [
              Center(
                child: Text("${members[index]['name']}"),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "${members[index]['description']}",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
