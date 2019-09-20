class Mail {

  String nom;
  String email;
  String message;

  Mail(String n, String e, String m) {
    this.nom = n;
    this.email = e;
    this.message = m;
  }

  @override
  String toString() {
    return 'Mail{nom: $nom, email: $email, message: $message}';
  }

  Mail.fromJson(Map<String, dynamic> json)
      : nom = json['nom'],
        email = json['email'],
        message = json['message'];

  Map<String, dynamic> toJson() =>
      {
        'nom': nom,
        'email': email,
        'message': message
      };

}