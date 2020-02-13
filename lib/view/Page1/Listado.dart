import 'package:flutter/material.dart';
import 'package:prueba_app/models/Usuario.dart';
import 'package:prueba_app/utils/inicializar.dart';

import 'Perfil.dart';

class ListadoPage extends StatefulWidget {
  @override
  _ListadoPageState createState() => _ListadoPageState();
}

class _ListadoPageState extends State<ListadoPage> {

  List<Usuario> listUser;
  double alto = 0;
  double ancho = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listUser = listaUsuarios(6);
  }

  @override
  Widget build(BuildContext context) {
    alto = MediaQuery.of(context).size.height;
    ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          width: ancho * 0.9,
          height: alto * 0.8,
          child: ListView.builder(
            itemCount: listUser.length,
            itemBuilder: (context,index){

              Usuario user = listUser[index];

              return Card(
                color: Colors.grey[100],
                child: ListTile(
                  title: Text(user.name,style: TextStyle(fontWeight: FontWeight.bold),),
                  leading: CircleAvatar(
                    backgroundImage: Image.asset('assets/${user.avatar}').image,
                  ),
                  subtitle: Text('Usuario : ${user.username}'),
                  onTap: (){
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (BuildContext context) => new Perfil(userRes: user,)));
                  },
                ),
              );
            },
          ),

        ),
      ),
    );
  }
}
