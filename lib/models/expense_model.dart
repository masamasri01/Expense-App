import 'dart:convert';

class ExpenseModel {
  String? title;
  String? descreption;
  int? id;
  String? amount;
  DateTime date = DateTime.now();
  // late DateTime dt;
  ExpenseModel(
      {this.title, this.descreption, this.id, this.amount, required this.date});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'descreption': descreption,
      'id': id,
      'amount': amount,
      'date': "${date.year}-${date.month}-${date.day}"
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    String tmp = map['date'];
    List<String> arr = tmp.split('-');
    return ExpenseModel(
        title: map['title'],
        descreption: map['descreption'],
        id: map['id'],
        amount: map['amount'],
        date: DateTime.parse("${arr[0]}-${arr[1]}-${arr[2]}"));
  }

  String toJson() => json.encode(toMap());

  factory ExpenseModel.fromJson(String source) =>
      ExpenseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
