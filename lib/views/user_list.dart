
import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/providers/users.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context){
    Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Usuários"),
        actions: [
          IconButton(onPressed: () {
            User user = User(
              id: '', 
              nome: "Zéca", 
              email: 'zeka@mail.com', 
              avatarURL: '',
          );
            users.put(user);

          }, icon: Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, i){
          return UserTile(user: users.byIndex(i));

        },
        itemCount: users.count,
    ),
    );
  }
}