import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(MaterialApp(
    home: UserInformation(),
  ));
}

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              final a = data['image'];
              // final db = base64.decode((data['info']['avatar']).toString());
              // print(db);

              return Column(
                children: [
                  Row(
                    children: [
                      Text(data['name']),
                      if (a != null)
                        Container(
                          width: 100,
                          child: Image(
                            image: NetworkImage(a),
                          ),
                        )
                    ],
                  ),
                  // Text(data["age"])
                ],
              );
              // return ListTile(
              //   title: Text(data['full_name']),
              //   subtitle: Text(data['company']),
              // );
            }).toList(),
          );
        },
      ),
    );
  }
}
