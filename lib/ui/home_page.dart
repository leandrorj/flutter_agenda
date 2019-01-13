import 'package:flutter/material.dart';
import 'package:flutter_agenda/helpers/contact_helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ContactHelper helper = ContactHelper();


  @override
  void initState() {
    super.initState();

    Contact c = Contact();
    c.name = "Leandro Farias";
    c.email = "l.farias@outlook.com";
    c.phone = "5364127";
    c.img = "imgtest";

    helper.saveContact(c);

    helper.getAllContacts().then((list){
      print(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
