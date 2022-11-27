String getDateToday(DateTime today) {
  List months = [
    'jan',
    'feb',
    'mar',
    'apr',
    'may',
    'jun',
    'jul',
    'aug',
    'sep',
    'oct',
    'nov',
    'dec'
  ];

  var currentMon = today.month;
  String dateStr =
      "${today.day} ${months[currentMon - 1].toString().toUpperCase()}, ${today.year - 2000}";
  return dateStr;
}
