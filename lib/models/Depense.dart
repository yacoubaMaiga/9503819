class Depense {
  int? id;
  final int montant;
  final String categorie;
  final String description;
  final DateTime date;

  Depense({
    this.id,
    required this.montant,
    required this.categorie,
    required this.description,
    required this.date,
  });
}
