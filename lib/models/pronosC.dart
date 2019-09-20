class PronosC {

  int id;
  String bookmaker;
  String sport;
  DateTime date_match;
  String match_prono;
  String pronostic;
  double cote;
  String explication;
  int resultat;

  @override
  String toString() {
    return 'PronosC{id: $id, bookmaker: $bookmaker, sport: $sport, date_match: $date_match, match_prono: $match_prono, pronostic: $pronostic, cote: $cote, explication: $explication, resultat: $resultat}';
  }

  PronosC.fromJson(Map json) :
        id = json['id'],
        bookmaker = json['bookmaker'],
        sport = json['sport'],
        date_match = DateTime.parse(json['date_match']),
        match_prono = json['match_prono'],
        pronostic = json['pronostic'],
        cote = json['cote'],
        explication = json['explication'],
        resultat = json['resultat'];

}