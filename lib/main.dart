import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:push_notification/services/PushNotificationService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PushNotification(),
    );
  }
}

class PushNotification extends StatefulWidget {
  @override
  _PushNotificationState createState() => _PushNotificationState();
}

class _PushNotificationState extends State<PushNotification> {
  @override
  void initState() {
    super.initState();
    PushNotificationService().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: RaisedButton(
        child: Text('login', style: TextStyle(color: Colors.white)),
        onPressed: () {
          FirebaseAuth.instance.signInAnonymously();
        },
      )),
    );
  }
}
