import 'package:flutter/material.dart';
import 'package:flutter_application_7/controller/home_controller.dart';
import 'package:flutter_application_7/model/contact_model.dart';
import 'package:provider/provider.dart';

TextEditingController nameCon = TextEditingController();
TextEditingController phone = TextEditingController();

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeController>(context);
    return Scaffold(

      appBar: AppBar(title: Text("contact book")
      ),
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            height: 200,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    controller: nameCon,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Name"),
                  ),
                  TextFormField(
                    controller: phone,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "number"),
                  ),
                  InkWell(
                    onTap: () {
                      provider.addToContacts(ContactModel(
                          name: nameCon.text,
                          phone: phone.text,
                          id: DateTime.now().microsecond));
                      nameCon.clear();
                      phone.clear();
                    },
                    child: Container(
                      color: Colors.blue,
                      height: 30,
                      width: 100,
                      child: Center(child: Text("Add Contact")),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: provider.mydb.length,
                itemBuilder: (context, index) {
                  final contact = provider.mydb.values.elementAt(index);
                  return ListTile(
                    title: Text(contact.name),
                    subtitle: Text(contact.phone),
                    trailing: InkWell(
                        onTap: () {
                          provider.deleteContact(contact);
                        },
                        child: Icon(Icons.delete)),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
