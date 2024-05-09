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
