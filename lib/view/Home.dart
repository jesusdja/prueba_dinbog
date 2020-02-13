import 'dart:convert';
import 'package:flutter/material.dart';

import 'Page1/Listado.dart';


enum bottonSelect {opcion1,opcion2,opcion3,opcion4,opcion5}

class HomePage extends StatefulWidget {
  @override
  _HomePagePageState createState() => _HomePagePageState();
}

class _HomePagePageState extends State<HomePage> {

  double alto = 0;
  double ancho = 0;
  String titulo = 'Home';
  bottonSelect page = bottonSelect.opcion1;
  Map<bottonSelect,bool> mapNavigatorBotton = new Map<bottonSelect,bool>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mapNavigatorBotton[bottonSelect.opcion1] = true;
    mapNavigatorBotton[bottonSelect.opcion2] = false;
    mapNavigatorBotton[bottonSelect.opcion3] = false;
    mapNavigatorBotton[bottonSelect.opcion4] = false;
    mapNavigatorBotton[bottonSelect.opcion5] = false;
  }

  @override
  Widget build(BuildContext context) {
    alto = MediaQuery.of(context).size.height;
    ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('$titulo',style: TextStyle(color: Colors.grey),),
        elevation: 0,
        backgroundColor: Colors.grey[100],
      ),
      body: SafeArea(
        child: Container(
          child: contenido(),
        ),
      ),
      bottomNavigationBar: navigatorBotton(),
    );
  }

  Widget contenido(){

    switch(page){
      case bottonSelect.opcion1:
        return ListadoPage();
      case bottonSelect.opcion2:
        return Container();
      case bottonSelect.opcion3:
        return Container();
      case bottonSelect.opcion4:
        return Container();
      case bottonSelect.opcion5:
        return Container();
    }
  }

  Widget navigatorBotton(){
    return Container(
      height: alto * 0.08,
      child: Row(
        children: <Widget>[
          Expanded(
            child: navigatorBottonContenido(bottonSelect.opcion1,Icon(Icons.home,color: Colors.grey[500],size: alto * 0.04,),'Inicio'),
          ),
          Expanded(
            child: navigatorBottonContenido(bottonSelect.opcion2,Icon(Icons.search,color: Colors.grey[500],size: alto * 0.04,),'Busqueda'),
          ),
          Expanded(
            child: navigatorBottonContenido(bottonSelect.opcion3,Icon(Icons.add_circle_outline,color: Colors.grey[500],size: alto * 0.04,),'Agregar'),
          ),
          Expanded(
            child: navigatorBottonContenido(bottonSelect.opcion4,Icon(Icons.notifications,color: Colors.grey[500],size: alto * 0.04,),'Notificación'),
          ),
          Expanded(
            child: navigatorBottonContenido(bottonSelect.opcion5,Icon(Icons.live_tv,color: Colors.grey[500],size: alto * 0.04,),'Video'),
          ),
        ],
      ),
    );
  }

  navigatorBottonContenido(bottonSelect index,Icon icon,String tit){
    return InkWell(
      child: Container(
        color: !mapNavigatorBotton[index] ? Colors.white : Colors.grey[200],
        child: Center(child: icon,),
      ),
      onTap: (){
        if(!mapNavigatorBotton[index]){
          mapNavigatorBotton[index] = true;
          Map<bottonSelect,bool> auxMap = mapNavigatorBotton;
          auxMap.forEach((key,value){
            if(key != index){mapNavigatorBotton[key] = false;}
          });
        }


        titulo = tit;
        page = index;
        setState(() {});


      },
    );
  }

}

