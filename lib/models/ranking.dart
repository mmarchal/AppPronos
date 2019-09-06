class Ranking {

  int place;
  String equipe;
  int points;

  @override
  String toString() {
    return 'Ranking{"place": "$place", "equipe": "$equipe", "points": "$points"}';
  }

  Ranking.fromJson(Map json) :
        place = json['place'],
        equipe = json['equipe'],
        points = json['points'];

}