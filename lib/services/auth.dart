import 'package:flutter/cupertino.dart';

enum Status { Logo,Inicio}

class AuthService with ChangeNotifier{
  Status _status = Status.Logo;

  AuthService.instance();

  Status get status => _status;

  Future init() async {
    //VERIFICACION ANTES DE INICIAR
    int counter = 0;
    await Future.delayed(Duration(seconds: 3));
    //INICIAR
    _status = Status.Inicio;
    notifyListeners();
  }
}