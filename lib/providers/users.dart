

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:http/http.dart' as http;

class Users extends ChangeNotifier {
  static const _baseUrl = 'https://coder-firebase-teste-ff0a2-default-rtdb.firebaseio.com/';
  Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  Future <void> put(User user) async {
    if(user == null) {
      return;
    }

    if(user.id != null && user.id.trim().isNotEmpty && _items.containsKey(user.id)) {
      _items.update(user.id, (_) => User(
        id: user.id,
        nome: user.nome,
        email: user.email,
        avatarURL: user.avatarURL,
        
      )
      );
    }
    else {

      final response = await http.post(Uri.parse("$_baseUrl/users.json"),
  body: json.encode({
    'nome': user.nome,
    'email': user.email,
    'avatarURL': user.avatarURL
  }),
);

final responseBody = json.decode(response.body);
if (responseBody != null && responseBody.containsKey('nome')) {
  final id = responseBody['nome'];
  print(responseBody);
  _items.putIfAbsent(id, () => User(
    id: id,
    nome: user.nome,
    email: user.email,
    avatarURL: user.avatarURL,
  ));
}
    notifyListeners();
  }

}

  void remove(User user) {
     if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}