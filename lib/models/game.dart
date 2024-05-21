class Outcomes {
  final String desc;
  final String odds;
  final String probability;

  Outcomes.fromJSON(Map<String, dynamic> json)
      : desc = json['desc'],
        odds = json['odds'],
        probability = json['probability'];

  Outcomes({
    required this.desc,
    required this.odds,
    required this.probability,
  });
}

class Market {
  final String desc;
  final String group;
  final String id;
  final String marketGuide;

  final List<Outcomes> outcomes;

  Market.fromJSON(Map<String, dynamic> json)
      : desc = json['desc'],
        group = json['group'],
        id = json['id'],
        outcomes = json['outcomes']
            .map((a) => Outcomes.fromJSON(a))
            .toList()
            .cast<Outcomes>(),
        marketGuide = json['marketGuide'];

  Market({
    required this.desc,
    required this.group,
    required this.id,
    required this.marketGuide,
    required this.outcomes,
  });
}

class Tournament {
  final String id;
  final String name;

  Tournament.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}

class Category {
  final String id;
  final String name;
  final Tournament tournament;

  Category.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        tournament = Tournament.fromJSON(json['tournament']);
}

class Sport {
  final String id;
  final String name;
  final Category category;

  Sport.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        category = Category.fromJSON(json['category']);

  Sport({
    required this.id,
    required this.name,
    required this.category,
  });
}

class Game {
  final String awayTeamName;
  final int estimateStartTime;
  final String eventId;
  final String gameId;
  final String homeTeamName;

  final Sport sport;
  final List<Market> markets;

  Game.fromJSON(Map<String, dynamic> json)
      : awayTeamName = json['awayTeamName'],
        estimateStartTime = json['estimateStartTime'],
        eventId = json['eventId'],
        gameId = json['gameId'],
        homeTeamName = json['homeTeamName'],
        sport = Sport.fromJSON(json['sport']),
        markets = json['markets']
            .map((a) => Market.fromJSON(a))
            .toList()
            .cast<Market>();

  Game({
    required this.awayTeamName,
    required this.estimateStartTime,
    required this.eventId,
    required this.gameId,
    required this.homeTeamName,
    required this.sport,
    required this.markets,
  });

  // final String GroupName;
  // final String MarketName;
  // final String Liga;
  // final String Opp1;
  // final String Opp2;
  // final int Start;
  // final String SportName;
  // final String Opp1Link;
  // final String Opp2Link;

  // Game.fromSnapshot(Map<String, dynamic> snapshot)
  //     : GroupName = snapshot['GroupName'],
  //       MarketName = snapshot['MarketName'],
  //       Liga = snapshot['Liga'],
  //       Opp1 = snapshot['Opp1'],
  //       Opp2 = snapshot['Opp2'],
  //       Start = snapshot['Start'],
  //       SportName = snapshot['SportName'],
  //       Opp1Link = 'https://v3.traincdn.com/resized/size32/sfiles/logo_teams/' +
  //           snapshot['O1IMG'][0],
  //       Opp2Link = 'https://v3.traincdn.com/resized/size32/sfiles/logo_teams/' +
  //           snapshot['O2IMG'][0];

  // Game({
  //   required this.GroupName,
  //   required this.MarketName,
  //   required this.Liga,
  //   required this.Opp1,
  //   required this.Opp2,
  //   required this.Start,
  //   required this.SportName,
  //   required this.Opp1Link,
  //   required this.Opp2Link,
  // });
}
