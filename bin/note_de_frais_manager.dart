import 'note_de_frais.dart';

class NoteDeFraisManager {
  List<NoteDeFrais> notesDeFrais = [];

  void addNoteDeFrais(NoteDeFrais ndf) {
    notesDeFrais.add(ndf);
  }

  List<NoteDeFrais> getNotesDeFrais() {
    return notesDeFrais;
  }

  double getTotal() {
    double result = 0;
    for (var ndf in notesDeFrais) {
      result += ndf.prix;
    }
    return result;
  }

  getTotalByMonth(DateTime date) {
    double result = 0;
    for (var ndf in notesDeFrais) {
      var isInRequestedMonth =
          date.year == ndf.date.year && date.month == ndf.date.month;
      if (isInRequestedMonth) {
        result += ndf.prix;
      }
    }
    return result;
  }
}
