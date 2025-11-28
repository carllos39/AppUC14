class Endereco {
  final String? logradouro;
  final String? bairro;
  final String? localidade;
  final String? uf;

  Endereco({
    this.logradouro,
    this.bairro,
    this.localidade,
    this.uf,
  });

  factory Endereco.fromJson(Map<String, dynamic> json) {
    return Endereco(
      logradouro: json['logradouro'],
      bairro: json['bairro'],
      localidade: json['localidade'],
      uf: json['uf'],
    );
  }
}

