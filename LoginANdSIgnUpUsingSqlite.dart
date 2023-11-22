import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthPage(),
    );
  }
}

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late Database _database;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  void _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, email TEXT, password TEXT)',
        );
      },
      version: 1,
    );
  }

  void _signUp() async {
    await _database.insert(
      'users',
      {
        'email': _emailController.text,
        'password': _passwordController.text,
      },
    );
    // Navigate to the home page or any other screen after successful sign up
  }

  void _login() async {
    final List<Map<String, dynamic>> users = await _database.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [_emailController.text, _passwordController.text],
    );

    if (users.isNotEmpty) {
      // Successful login
      // Navigate to the home page or any other screen
    } else {
      // Invalid credentials
      // Handle the error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Auth Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _signUp,
                  child: Text('Sign Up'),
                ),
                ElevatedButton(
                  onPressed: _login,
                  child: Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Using List
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class User {
//   final String email;
//   final String password;
//
//   User(this.email, this.password);
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AuthPage(),
//     );
//   }
// }
//
// class AuthPage extends StatefulWidget {
//   @override
//   _AuthPageState createState() => _AuthPageState();
// }
//
// class _AuthPageState extends State<AuthPage> {
//   List<User> users = [];
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   void _signUp() {
//     User newUser = User(_emailController.text, _passwordController.text);
//     setState(() {
//       users.add(newUser);
//     });
//     // Navigate to the home page or any other screen after successful sign up
//   }
//
//   void _login() {
//     User? foundUser = users.firstWhere(
//           (user) =>
//       user.email == _emailController.text &&
//           user.password == _passwordController.text,
//       orElse: () => null,
//     );
//
//     if (foundUser != null) {
//       // Successful login
//       // Navigate to the home page or any other screen
//     } else {
//       // Invalid credentials
//       // Handle the error
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('List Auth Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 16.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: _signUp,
//                   child: Text('Sign Up'),
//                 ),
//                 ElevatedButton(
//                   onPressed: _login,
//                   child: Text('Login'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
