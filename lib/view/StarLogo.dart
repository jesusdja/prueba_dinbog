import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_app/services/auth.dart';

class StartLogo extends StatefulWidget {
  @override
  _StartLogoState createState() => _StartLogoState();
}

class _StartLogoState extends State<StartLogo> {
  AuthService auth;
  Future<bool> exit() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthService>(context);
    return WillPopScope(
        child: FutureBuilder(
          future: auth.init(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.none:
                return Container(
                  child: Center(
                    child: Text('Error'),
                  ),
                );
                break;
              case ConnectionState.waiting:
                return Scaffold(
                  body: Center(
                    child: FlutterLogo(
                      size: 50,
                    ),
                  ),
                );
                break;
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator(),);
                break;
              case ConnectionState.done:
                return Container(
                  child: Center(
                    child: Text('Saliendo'),
                  ),
                );
                break;
            }
            return Container();
          },
        ),
        onWillPop: exit
    );
  }
}