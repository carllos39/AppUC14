class Endereco {
  String? cep;
  String? logradouro;
  String? bairro;
  String? cidade;
  String? estado;


  Endereco({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.cidade,
    required this.estado,
  });

  factory Endereco.fromJson(Map<String,dynamic>map){
    return Endereco(
      cep: map['cep'],
       logradouro: map['logradouro'], 
       bairro: map['bairro'], 
       cidade: map['cidade'], 
       estado: map['estado']
       );
  }
}
