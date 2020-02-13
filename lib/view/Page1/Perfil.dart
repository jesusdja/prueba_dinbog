import 'package:flutter/material.dart';
import 'package:prueba_app/models/Post.dart';
import 'package:prueba_app/models/Usuario.dart';
import 'package:prueba_app/utils/inicializar.dart';
class Perfil extends StatefulWidget {
  Perfil({this.userRes});
  final Usuario userRes;

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {

  Usuario user;
  double alto = 0;
  double ancho = 0;
  Map<int,bool> mapDetaPost = new Map<int,bool>();
  List<PostUser> listaPost = new List<PostUser>();
  Map<int,bool> MapLike = Map<int,bool>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = widget.userRes;

    listaPost =  listaTotalPost();

    MapLike[1] = false;
    MapLike[2] = false;
    MapLike[3] = false;
    MapLike[4] = false;

    mapDetaPost[0] = true;
    mapDetaPost[1] = false;
    mapDetaPost[2] = false;
    mapDetaPost[3] = false;
    mapDetaPost[4] = false;

  }

  @override
  Widget build(BuildContext context) {
    alto = MediaQuery.of(context).size.height;
    ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(user.name,style: TextStyle(color: Colors.black,)),
            Icon(Icons.check_circle,color: Colors.blue[800],size: 20,)
          ],
        ),
        leading: IconButton(
          onPressed: ()=>Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back,color: Colors.grey[500],),
        ),
        backgroundColor: Colors.grey[100],
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: <Widget>[
            Container(
              height: alto * 0.17,
              child: contenido1(),
            ),
            Container(
              height: alto * 0.08,
              child: contenido2(),
            ),
            Container(
              height: alto * 0.64,
              child: contenido3(),
            )
          ],
        ),
      ),
    );
  }



  Widget contenido3(){
    return ListView.builder(
      itemCount: listaPost.length,
      itemBuilder: (context,index){

        PostUser post = listaPost[index];

        Color colorIcon = Colors.grey[400];

        return Container(
          child: Column(
            children: <Widget>[
              Container(
                width: ancho,
                height: alto * 0.45,
                child: FittedBox(
                  child: Image.asset('assets/${post.imagen}'),
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: alto * 0.05,
                margin: EdgeInsets.only(left: ancho * 0.03),
                child: Row(
                  children: <Widget>[
                    InkWell(child: Icon(Icons.thumb_up,color: MapLike[post.id] ? Colors.blue : colorIcon)
                    ,onTap: (){
                      if(!MapLike[post.id]){
                        int li = int.parse(post.like) + 1;
                        post.like = li.toString();
                        MapLike[post.id] = true; setState(() {});
                      }

                      },),
                    SizedBox(width: ancho * 0.02,),
                    Text(post.like,style: TextStyle(color: MapLike[post.id] ? Colors.blue : colorIcon),),
                    SizedBox(width: ancho * 0.06,),
                    Icon(Icons.message,color: colorIcon),
                    SizedBox(width: ancho * 0.02,),
                    Text(post.coment,style: TextStyle(color: colorIcon),),
                    SizedBox(width: ancho * 0.06,),
                    Icon(Icons.share,color: colorIcon,)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Text('${user.name} : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: alto * 0.02),),
                    Text(post.descripcion,),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  Widget contenido2(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        items('Post','${20 * user.id}',0),
        items('Books','${85 * user.id}',1),
        items('Videos','${65 * user.id}',2),
        items('Music','${22 * user.id}',3),
        items('Works','${26 * user.id}',4),
      ],
    );
  }

  Widget items(String titulo,String num, int index){
    Color color = Colors.grey[500];
    if(mapDetaPost[index]){
      color = Colors.blue[600];
    }

    return Container(
      margin: EdgeInsets.only(right: ancho * 0.05),
      child: InkWell(
        child: Column(
          children: <Widget>[
            Text(titulo,style: TextStyle(color: color,fontSize: alto * 0.02,fontWeight: FontWeight.bold),),
            SizedBox(height: alto * 0.008),
            Text(num,style: TextStyle(color: color,fontSize: alto * 0.02,fontWeight: FontWeight.bold),),
          ],
        ),
        onTap: (){
          if(!mapDetaPost[index]){
            Map<int,bool> auxMap = mapDetaPost;
            auxMap.forEach((key,value){
              if(key == index){
                mapDetaPost[key] = true;
              }else{
                mapDetaPost[key] = false;
              }
            });
            setState(() {});
          }
        },
      ),
    );
  }



  Widget contenido1(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: ancho * 0.22,
          margin: EdgeInsets.only(left: ancho * 0.02),
          child: CircleAvatar(
            radius: alto * 0.06,
            backgroundImage: Image.asset('assets/${user.avatar}').image,
          ),
        ),
        Container(
          width: ancho * 0.70,
          height: alto * 0.1,
          margin: EdgeInsets.only(left: ancho * 0.02),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Text('Following',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('${50 * user.id}',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text('Following',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('${10 * user.id}',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text('Following',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('${20 * user.id}',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                SizedBox(height: alto * 0.01,),
                Text('Email : ${user.email}',style: TextStyle(color: Colors.grey[600]),textAlign: TextAlign.left,),
                SizedBox(height: alto * 0.01,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[

                     Container(
                       width: ancho * 0.25,
                       height: alto * 0.035,
                       child: RaisedButton(
                           color: Colors.blue,
                           elevation: 10,
                           shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                           onPressed: () async {
                             await showDialog(
                                 context: context,
                                 child: SimpleDialog(
                                   title: Center(child: Text('Follow',style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height * 0.022),)),
                                   children: <Widget>[

                                   ],
                                 )
                             );
                           },
                           child: Text('Follow',style: TextStyle(fontSize: alto * 0.017,color: Colors.white),)
                       ),
                     ),
                     SizedBox(width: ancho * 0.05,),
                     Container(
                       width: ancho * 0.25,
                       height: alto * 0.035,
                       child: RaisedButton(
                           elevation: 10,
                           color: Colors.white,
                           shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0),side: BorderSide(color: Colors.grey[600])),
                           onPressed: () async {},
                           child: Text('Pending',style: TextStyle(fontSize: alto * 0.017,color: Colors.grey[500]),)
                       ),
                     ),
                   ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
