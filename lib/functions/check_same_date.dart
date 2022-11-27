bool checkSameDate(DateTime d1, DateTime d2) {
  if (d1.day == d2.day && d1.month == d2.month && d1.year == d2.year) {
    return true;
  } else {
    return false;
  }
}
