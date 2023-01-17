import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mylogin_191/middle_auth.dart';
import 'package:mylogin_191/pages/login.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //function waxa lo adeegsadaa markaad inisualization sameyneyso
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: middleAuth(),
    );
  }
}
