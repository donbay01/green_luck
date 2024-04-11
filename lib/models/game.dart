class Game {
  final String GroupName;
  final String MarketName;
  final String Liga;
  final String Opp1;
  final String Opp2;
  final int Start;
  final String SportName;
  final String Opp1Link;
  final String Opp2Link;

  Game.fromSnapshot(Map<String, dynamic> snapshot)
      : GroupName = snapshot['GroupName'],
        MarketName = snapshot['MarketName'],
        Liga = snapshot['Liga'],
        Opp1 = snapshot['Opp1'],
        Opp2 = snapshot['Opp2'],
        Start = snapshot['Start'],
        SportName = snapshot['SportName'],
        Opp1Link = 'https://v3.traincdn.com/resized/size32/sfiles/logo_teams/' +
            snapshot['O1IMG'][0],
        Opp2Link = 'https://v3.traincdn.com/resized/size32/sfiles/logo_teams/' +
            snapshot['O2IMG'][0];

  Game({
    required this.GroupName,
    required this.MarketName,
    required this.Liga,
    required this.Opp1,
    required this.Opp2,
    required this.Start,
    required this.SportName,
    required this.Opp1Link,
    required this.Opp2Link,
  });
}
