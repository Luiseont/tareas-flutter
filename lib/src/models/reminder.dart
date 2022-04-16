class Reminder {
  int? id;
  String name;
  String description;
  DateTime? date;

  set setDate(DateTime date) {
    this.date = date;
  }

  set setName(String name) {
    this.name = name;
  }

  set setDescription(String name) {
    this.name = name;
  }

  Reminder({this.id, required this.name, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
