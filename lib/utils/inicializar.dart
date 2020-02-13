
import 'package:prueba_app/models/Post.dart';
import 'package:prueba_app/models/Usuario.dart';

List<Usuario> listaUsuarios(int cant){

  List<Usuario> lista = new List<Usuario>();
  for(int x = 1; x < cant; x++){
    Usuario user = Usuario(
      id: x,
      email: 'correo$x@gmail.com',
      avatar: 'perfil$x.jpg',
      name: 'Nombre $x',
      username: 'user$x'
    );
    lista.add(user);
  }
  return lista;
}

List<PostUser> listaTotalPost(){
  List<PostUser> lista = new List<PostUser>();
  for(int x = 1; x < 5; x++){
    PostUser post = new PostUser(
      id: x,
      descripcion: 'Este es el animal N° $x y es muy bonito',
      imagen: 'imagen$x.jpg',
      coment: '${67 * x}',
      like: '${20 * x}',
    );
    lista.add(post);
  }
  return lista;
}