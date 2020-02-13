class PostUser {
  int id;
  String imagen;
  String descripcion;
  String like;
  String coment;

  PostUser(
      {this.id,
        this.imagen,
        this.descripcion,
        this.like,
        this.coment,
       });

  PostUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagen = json['imagen'];
    descripcion = json['descripcion'];
    like = json['like'];
    coment = json['coment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imagen'] = this.imagen;
    data['descripcion'] = this.descripcion;
    data['like'] = this.like;
    data['coment'] = this.coment;
    return data;
  }
  PostUser.fromMap(Map snapshot) :
        id = snapshot['id'],
        imagen = snapshot['imagen'],
        descripcion = snapshot['descripcion'],
        like = snapshot['like'],
        coment = snapshot['coment']
  ;

  PostUser.map(dynamic obj) {
    this.id = obj['id'];
    this.imagen = obj['imagen'];
    this.descripcion = obj['descripcion'];
    this.like = obj['like'];
    this.coment = obj['coment'];
  }
}
