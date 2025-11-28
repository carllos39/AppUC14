class Usuario {
  final String id;
  final String nome;
  final String email;
  final String senha;

  Usuario({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
     
  });
  Map<String,dynamic>toMap(){
    return{
      "nome":nome,
      "email":email,
      "senha":senha,
    };
  }

  factory Usuario.fromJson(Map<String,dynamic>map,String idUser){
    return Usuario(
      id: idUser,
     nome: map['nome'], 
     email: map['email'],
      senha:map['senha']);
  }
}
