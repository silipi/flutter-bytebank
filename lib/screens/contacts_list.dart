import 'package:alura_bytebank_sqflite/dao/contact_dao.dart';
import 'package:alura_bytebank_sqflite/models/contact.dart';
import 'package:alura_bytebank_sqflite/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  
  final ContactDao _dao = ContactDao();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text(
                      "Loading...",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return _ContactItem(contact);
                },
                itemCount: contacts.length,
              );
              break;
          }
          return Text("Unknown error.");
        },
        future: Future.delayed(Duration(seconds: 1)).then((value) => _dao.findAll()),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContactForm(),
            ),
          ).then((v) {
            setState(() {
              
            });
          });
        },
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(contact.name, style: TextStyle(fontSize: 24)),
        subtitle: Text(contact.accountNumber.toString(),
            style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
