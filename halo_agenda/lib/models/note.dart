class Note {
  final int id;
  final DateTime date;
  final int groupId;
  String text;
  int indexNumber;

  Note({
    this.id,
    this.text,
    this.date,
    this.indexNumber,
    this.groupId,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'date': date.toString(),
      'groupId': groupId,
      'indexNumber': indexNumber,
    };
  }
}
