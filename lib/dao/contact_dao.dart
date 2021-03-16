import 'package:alura_bytebank_sqflite/database/app_database.dart';
import 'package:alura_bytebank_sqflite/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  
  static const String tableSql = 'CREATE TABLE $_tableName('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'account_number INTEGER)';
      
  static const String _tableName = 'contacts';
  
  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    
    Map<String, dynamic> contactMap = _toMap(contact);
    
    return db.insert(_tableName, contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    
    contactMap["name"] = contact.name;
    contactMap["account_number"] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Contact> contacts = _toList(result);
    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    
    for(Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row['id'], 
        row['name'], 
        row['account_number'],
      );
      
      contacts.add(contact);    
    }
    return contacts;
  }
}