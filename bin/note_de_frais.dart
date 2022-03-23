import 'package:note_de_frais/note_de_frais.dart' as note_de_frais;

void main(List<String> arguments) {
  print('Hello world: ${note_de_frais.calculate()}!');
}

class NoteDeFrais {
  double prix;
  double tva;
  String fournisseur;
  late DateTime date;

  NoteDeFrais(
      {required this.fournisseur,
      required this.prix,
      required this.tva,
      DateTime? date}) {
    this.date = date ?? DateTime.now();
  }
}
