
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/models/user.dart';

class Users with ChangeNotifier{
  Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int indice) {
    return _items.values.elementAt(indice);
  }

  //cadastrar//

  void put(User user){

    if(user.id.trim().isNotEmpty && _items.containsKey(user.id) ){
      //update
      _items.update(user.id, (_) => User(
        id: user.id,
        nome: user.nome,
        email: user.email,
        avatarURL: user.avatarURL,
      ),
    );
    }
    else{
      final id = Random().nextDouble().toString();
    
    _items.putIfAbsent(
      id,
      () => User(
        id: id, 
        nome: user.nome, 
        email: user.email, 
        avatarURL: user.avatarURL,),
    );
  }

    }
    

  @override
  void notifyListeners();
  
  
}