import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String contactTable = "contactTable";
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String emailColumn = "emailColumn";
final String phoneColumn = "phoneColumn";
final String imgColumn = "imgColumn";

class ContactHelper {
  //padrao singleton - só vai ter 1 objeto da classe.

  //criacao da unica instancia da classe
  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper() => _instance;

  //contrutor interno
  ContactHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath(); //pega o local do db
    final path = join(databasePath, "contacts.db"); //pega o arquivo

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newVersion) async {
      await db.execute(
          "CREATE TABLE $contactTable($idColumn INTERGER PRIMARY KEY, $nameColumn TEXT"
          "$emailColumn TEXT, $phoneColumn TEXT, $imgColumn TEXT)");
    });
  }
}

class Contact {
  //classe model do contato

  int id;
  String name;
  String email;
  String phone;
  String img;

  Contact.fromMap(Map map) {
    //transforma os dados do mapa p/ o contato
    id = map[idColumn];
    name = map[nameColumn];
    email = map[emailColumn];
    phone = map[phoneColumn];
    img = map[imgColumn];
  }

  Map toMap() {
    // transforma contato p/ mapa
    Map<String, dynamic> map = {
      nameColumn: name,
      emailColumn: email,
      phoneColumn: phone,
      imgColumn: img
    };
    if (id != null) {
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
