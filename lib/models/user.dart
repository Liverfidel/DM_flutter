
class User{
  final String id;
  final String nome;
  final String email;
  final String avatarURL;

  User({
    required this.id,
    required this.nome,
    required this.email,
    this.avatarURL = '',
  });

}