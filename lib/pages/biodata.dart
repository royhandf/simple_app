import 'package:flutter/material.dart';
import '../utils/data.dart';

class Biodata extends StatelessWidget {
  final int index;

  const Biodata(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 40),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/${members[index]['profile']}",
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "${members[index]['name']}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "${members[index]['biodata']}",
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
