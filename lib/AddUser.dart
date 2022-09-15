import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatelessWidget {
  final String fullName;
  final String company;
  final int age;

  AddUser(this.fullName, this.company, this.age);

  late CollectionReference users;

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection

    users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: addUser,
              child: Text(
                "Add User",
              ),
            ),
            TextButton(
              onPressed: removeUser,
              child: Text(
                "Remove User",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> removeUser() {
    // Call the user's CollectionReference to add a new user
    return users.doc("0hOGzO12wGzBHJfeLd0Y").delete().then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error updating document $e"),
        );
  }

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'full_name': fullName, // John Doe
          'company': company, // Stokes and Sons
          'age': age // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
