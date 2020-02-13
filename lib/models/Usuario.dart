class Usuario {
  int id;
  String username;
  String email;
  String name;
  String avatar;

  Usuario(
      {this.id,
        this.username,
        this.email,
        this.name,
        this.avatar,
       });

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    name = json['name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    return data;
  }
  Usuario.fromMap(Map snapshot) :
        id = snapshot['id'],
        username = snapshot['username'],
        email = snapshot['email'],
        name = snapshot['name'],
        avatar = snapshot['avatar']
  ;

  Usuario.map(dynamic obj) {
    this.id = obj['id'];
    this.username = obj['username'];
    this.email = obj['email'];
    this.name = obj['name'];
    this.avatar = obj['avatar'];
  }
}
