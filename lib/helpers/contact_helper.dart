import 'package:sqflite/sqflite.dart';

final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String emailColumn = "emailColumn";
final String phoneColumn = "phoneColumn";
final String imgColumn = "imgColumn";

class ContactHelper{

}

class Contact {
  //classe model do contato

  int id;
  String name;
  String email;
  String phone;
  String img;

  Contact.fromMap(Map map){
    //transforma os dados do mapa p/ o contato
    id = map[idColumn];
    name = map[nameColumn];
    email = map[emailColumn];
    phone = map[phoneColumn];
    img = map[imgColumn];
  }

  Map toMap(){
    // transforma contato p/ mapa
    Map<String, dynamic> map = {
      nameColumn: name,
      emailColumn: email,
      phoneColumn: phone,
      imgColumn: img
    };
    if(id != null ){
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    //serve para ler os dados do contato
    return "Contact(id: $id, name: $name, email: $email, phone: $phone, img: $img)";

  }


}