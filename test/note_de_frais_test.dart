import 'package:note_de_frais/note_de_frais.dart';
import 'package:test/test.dart';

import '../bin/note_de_frais.dart';
import '../bin/note_de_frais_manager.dart';

void main() {
  test('A l initialisation je n ai pas de note de frais', () {
    var ndf = NoteDeFrais(prix: 10.99, tva: 5.5, fournisseur: "FNAC");
    var ndfm = NoteDeFraisManager();

    List<NoteDeFrais> notesDeFrais = ndfm.getNotesDeFrais();
    expect(notesDeFrais.length, 0);
  });
  test('créer une note de frais et je veux la récupérer', () {
    var ndf = NoteDeFrais(prix: 10.99, tva: 5.5, fournisseur: "FNAC");
    var ndfm = NoteDeFraisManager();

    ndfm.addNoteDeFrais(ndf);
    List<NoteDeFrais> notesDeFrais = ndfm.getNotesDeFrais();
    expect(notesDeFrais.length, 1);
  });
  test(
      'créer une note de frais et je veux récupérer le total des notes frais depuis la nuit des temps',
      () {
    var ndf = NoteDeFrais(prix: 10.99, tva: 5.5, fournisseur: "FNAC");
    var ndfm = NoteDeFraisManager();

    ndfm.addNoteDeFrais(ndf);
    expect(ndfm.getTotal(), 10.99);
  });
  test(
      'créer deux notes de frais et je veux récupérer le total des notes frais depuis la nuit des temps',
      () {
    var ndf1 = NoteDeFrais(prix: 10.99, tva: 5.5, fournisseur: "FNAC");
    var ndf2 = NoteDeFrais(prix: 0.01, tva: 5.5, fournisseur: "FNAC");
    var ndfm = NoteDeFraisManager();

    ndfm.addNoteDeFrais(ndf1);
    ndfm.addNoteDeFrais(ndf2);
    expect(ndfm.getTotal(), 11.0);
  });
  test(
      'créer une note de frais en mars, deux notes de frais en avril et une note de frais en mai, je veux récupérer le total des notes frais d avril',
      () {
    var ndf1 = NoteDeFrais(
        prix: 1,
        tva: 5.5,
        date: DateTime(2021, 3, 31, 23, 59),
        fournisseur: "FNAC");
    var ndf2 = NoteDeFrais(
        prix: 2, tva: 5.5, date: DateTime(2021, 4, 1), fournisseur: "FNAC");
    var ndf3 = NoteDeFrais(
        prix: 3,
        tva: 5.5,
        date: DateTime(2021, 4, 30, 23, 59),
        fournisseur: "FNAC");
    var ndf4 = NoteDeFrais(
        prix: 4, tva: 5.5, date: DateTime(2021, 5, 1), fournisseur: "FNAC");
    var ndfm = NoteDeFraisManager();

    ndfm.addNoteDeFrais(ndf1);
    ndfm.addNoteDeFrais(ndf2);
    ndfm.addNoteDeFrais(ndf3);
    ndfm.addNoteDeFrais(ndf4);
    expect(ndfm.getTotalByMonth(DateTime(2021, 4)), 5.0);
  });
}
