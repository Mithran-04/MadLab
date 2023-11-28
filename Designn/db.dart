// Data from DB: (CRUD )
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class FirebaseService {
// final CollectionReference _usersCollection =
// FirebaseFirestore.instance.collection('users');
//
// Stream<List<User>> readUsers() {
// return _usersCollection.snapshots().map((snapshot) {
// return snapshot.docs.map((doc) => User.fromMap(doc.data() as Map<String, dynamic>)).toList();
// });
// }
// }
//
// class User {
// final String name;
// final int age;
//
// User({required this.name, required this.age});
//
// factory User.fromMap(Map<String, dynamic> map) {
// return User(
// name: map['name'] ?? '',
// age: map['age'] ?? 0,
// );
// }
// }
// StreamBuilder<List<User>>(
// stream: FirebaseService().readUsers(),
// builder: (context, snapshot) {
// if (snapshot.connectionState == ConnectionState.waiting) {
// return CircularProgressIndicator();
// } else if (snapshot.hasError) {
// return Text('Error: ${snapshot.error}');
// } else {
// List<User> users = snapshot.data ?? [];
//
// // Now you can use the 'users' list in your UI
// return ListView.builder(
// itemCount: users.length,
// itemBuilder: (context, index) {
// return ListTile(
// title: Text(users[index].name),
// subtitle: Text('Age: ${users[index].age}'),
// );
// },
// );
// }
// },
// );