import 'package:flutter/material.dart';
import '../utils/data.dart';
import 'biodata.dart';

class ListMember extends StatefulWidget {
  const ListMember({super.key});

  @override
  State<ListMember> createState() => _ListMemberState();
}

class _ListMemberState extends State<ListMember> {
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
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) => Card(
          elevation: 3.0,
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: ListTile(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    image: AssetImage("assets/${members[index]['profile']}"),
                    fit: BoxFit.cover),
              ),
              height: 50,
              width: 50,
            ),
            title: Text(members[index]['name']),
            subtitle: Text(members[index]['nim']),
            onTap: () {
              final int urutan = index;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Biodata(urutan);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
