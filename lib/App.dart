import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_app/services/auth.dart';
import 'package:prueba_app/view/Home.dart';
import 'package:prueba_app/view/StarLogo.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App>{

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => AuthService.instance(),
      child: Consumer(
        // ignore: missing_return
        builder: (context, AuthService auth, _){
          switch (auth.status) {
            case Status.Logo:
              return StartLogo();
            case Status.Inicio:
              return HomePage();
          }
        },
      ),
    );
  }

}