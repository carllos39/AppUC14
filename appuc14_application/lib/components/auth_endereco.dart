class AuthEndereco {
  String? cep;
  String? logradouro;
  String? bairro;
  String? cidade;
  String? uf;
  String? estado;

  AuthEndereco({
    this.cep,
    this.logradouro,
    this.bairro,
    this.cidade,
    this.uf,
    this.estado,
  });

  factory AuthEndereco.fromJson(Map<String, dynamic> json) {
    return AuthEndereco(
      cep: json["cep"],
      logradouro: json["logradouro"],
      bairro: json["bairro"],
      cidade: json["cidade"],
      uf: json["uf"],
      estado: json["estado"],
    );
  }
}
