
class User{
  String id;
  String nome;
  String email;
  String avatarURL;

  User({
    required this.id,
    required this.nome,
    required this.email,
    this.avatarURL = '',
  });

}