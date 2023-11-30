
import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';

class UserTile extends StatelessWidget {
  User user;

  UserTile({
    super.key,
    required this.user,
    });

  @override
  Widget build(BuildContext context) {
    CircleAvatar ca;
    if(user.avatarURL.isEmpty){
      ca = CircleAvatar(child: Icon(Icons.person),);
    }else{
      ca = CircleAvatar(backgroundImage: NetworkImage(user.avatarURL),);
    }
    return ListTile(
      leading: ca,
      title: Text(user.nome),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(onPressed: (){
              
            }, icon: Icon(Icons.edit), color: Color.fromARGB(255, 10, 141, 114),),
            IconButton(onPressed: (){

            }, icon: Icon(Icons.delete), color: Colors.red,),
          ],
        ),
      ),
    );
  }
}