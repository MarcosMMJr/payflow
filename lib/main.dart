import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:payflow/app_widget.dart';

void main() {
  runApp(const AppFirebase());
}

class AppFirebase extends StatefulWidget {
  const AppFirebase({Key? key}) : super(key: key);

  @override
  State<AppFirebase> createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  final Future<FirebaseApp> _initilization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initilization,
      builder: (context, snapshot) {
        //Check for erros
        if (snapshot.hasError) {
          return const Material(
            child: Center(
              child: Text(
                "Não foi possível inicializar o Firebase.",
                textDirection: TextDirection.ltr,
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return AppWidget();
        }
        //Otherwise, show something whilst waiting
        else {
          return const Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
