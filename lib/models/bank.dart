class BankInformation {
  final String bank;
  final String number;
  final String name;

  BankInformation.fromJSON(Map<String, dynamic> json)
      : bank = json['bank'],
        name = json['name'],
        number = json['number'];

  BankInformation({
    required this.bank,
    required this.number,
    required this.name,
  });
}

class CryptoInformation {
  final String address;
  final String network;

  CryptoInformation.fromJSON(Map<String, dynamic> json)
      : address = json['address'],
        network = json['network'];

  CryptoInformation({
    required this.address,
    required this.network,
  });
}
