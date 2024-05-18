class Plan {
  final String id;
  final int amount;
  final String color;
  final String name;
  final String interval;
  final String? planId;
  final String? appleId;

  Plan.fromJSON(String docId, Map<String, dynamic> json)
      : id = docId,
        amount = json['amount'],
        color = json['color'],
        name = json['name'],
        interval = json['interval'],
        appleId = json['apple_id'],
        planId = json['planId'];

  Plan({
    required this.id,
    required this.amount,
    required this.color,
    required this.name,
    required this.interval,
    required this.planId,
    this.appleId,
  });
}
