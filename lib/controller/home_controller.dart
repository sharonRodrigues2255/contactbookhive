import 'package:flutter/material.dart';
import 'package:flutter_application_7/model/contact_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeController with ChangeNotifier {
  var mydb = Hive.box("contact");

  addToContacts(ContactModel contact) {
    mydb.put(contact.id, contact);
    notifyListeners();
  }

  deleteContact(ContactModel contact) {
    mydb.delete(contact.id);
    notifyListeners();
  }
}
