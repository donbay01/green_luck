import 'game.dart';

class Code {
  final String id;
  final String code;
  final String collection;
  final List<Game> games;

  Code.fromSnapshot(String docId, Map<String, dynamic> snapshot)
      : id = docId,
        code = snapshot['code'],
        collection = snapshot['collection'],
        games = snapshot['games'] == null
            ? [].cast<Game>()
            : snapshot['games']
                .map((e) => Game.fromJSON(e))
                .toList()
                .cast<Game>();

  Code({
    required this.id,
    required this.code,
    required this.games,
    required this.collection,
  });
}
