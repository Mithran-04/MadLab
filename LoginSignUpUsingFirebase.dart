import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signUp() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Navigate to the home page or any other screen after successful sign up
    } catch (e) {
      print('Error during sign up: $e');
      // Handle errors
    }
  }

  void _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Navigate to the home page or any other screen after successful login
    } catch (e) {
      print('Error during login: $e');
      // Handle errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social Media App'),
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

//
// void wrongCredentialsMessage(String message){
//   showDialog(context: context, builder: (context){
//     return AlertDialog(
//       backgroundColor: Colors.deepPurple,
//       title: Center(child: Text(message,style: TextStyle(color:Colors.white),)),
//     );
//   });
// }

// void SignUpUser() async{
//   showDialog(context: context, builder: (context){
//     return Center(child:CircularProgressIndicator(),);
//   });
//   try {
//     await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: userEmailController.text, password: passwordController.text);
//     Navigator.pop(context);
//   } on FirebaseAuthException catch(e){
//     Navigator.pop(context);
//     if(e.code=='invalid-email'){
//
//       wrongCredentialsMessage("Invalid email ID");
//     }
//
//     else if(e.code=='INVALID_LOGIN_CREDENTIALS'){
//       wrongCredentialsMessage("Incorrect password");
//     }
//   }
// }



// void wrongCredentialsMessage(String message){
//   showDialog(context: context, builder: (context){
//     return AlertDialog(
//       backgroundColor: Colors.deepPurple,
//       title: Center(child: Text(message,style: TextStyle(color:Colors.white),)),
//     );
//   });
// }
//
//
// void logInUser() async{
//   showDialog(context: context, builder: (context){
//     return Center(child:CircularProgressIndicator(),);
//   });
//   try {
//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: userEmailController.text, password: passwordController.text);
//     Navigator.pop(context);
//   } on FirebaseAuthException catch(e){
//     Navigator.pop(context);
//     if(e.code=='invalid-email'){
//
//       wrongCredentialsMessage("Invalid email ID");
//     }
//
//     else if(e.code=='INVALID_LOGIN_CREDENTIALS'){
//       wrongCredentialsMessage("Incorrect password");
//     }
//   }
//
// }
