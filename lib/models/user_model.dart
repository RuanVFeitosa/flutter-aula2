
class UserModel {
  String name;
  int idade;

  UserModel({ 
    required this.name, 
    required this.idade
  });

  int anoNascimento() {
    return DateTime.now().year - idade;
  }
}