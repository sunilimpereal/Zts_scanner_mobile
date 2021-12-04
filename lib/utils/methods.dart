getCurrentDateTime(DateTime date) {
  DateTime newDate = date;
  return newDate.add(const Duration(hours: 5, minutes: 30));
}

cleanQr(String qr) {
  String output = "";
  for (int i = 0; i < qr.length; i++) {
    if (RegExp(r'^[A-Za-z0-9_.]+$').hasMatch(qr[i])) {
      output = output + qr[i];
    }
  }
  return output;
}
