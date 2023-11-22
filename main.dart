import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'newSqlUi.dart';
import 'routeScreen.dart';
import 'CrudSqliteCode.dart';
import 'calc.dart';
import 'drawShapes.dart';
import 'BMIcalc.dart';
import 'package:smaple_projectt/lightDarkMode.dart';
import 'groceryList.dart';
import 'diceGame.dart';
import 'quizApp.dart';
import 'ExpenseTracker.dart';
import 'circleSizeGame.dart';
import 'geoLocatorApp.dart';
import 'package:smaple_projectt/NotificationReminder.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:smaple_projectt/NotificationService.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  tz.initializeTimeZones();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationHomePage(),
      routes: {
        '/home':(context)=>MyPage(),
        routeScreen.routeName:(ctx)=>routeScreen(refresh: () { },),

      },
    );
  }
}

class FacebookAuthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook Login'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                try {
                  final result = await FacebookAuth.instance.login();

                  if (result.status == LoginStatus.success) {
                    final userData = await FacebookAuth.instance.getUserData();
                    print('User data: $userData');
                  } else {
                    print('Facebook login failed: ${result.message}');
                  }
                } catch (e) {
                  print('Error during Facebook login: $e');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: Text("Log in",style: TextStyle(fontSize: 18),)
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () async {
                try {
                  final result = await FacebookAuth.instance.login();

                  if (result.status == LoginStatus.success) {
                    final userData = await FacebookAuth.instance.getUserData();
                    print('User data: $userData');
                  } else {
                    print('Facebook login failed: ${result.message}');
                  }
                } catch (e) {
                  print('Error during Facebook login: $e');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook, color: Colors.white),
                  SizedBox(width: 8),
                  Text('Login with Facebook', style: TextStyle(fontSize: 24)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
