String selecttypetime() {
  DateTime datetime = DateTime.now();
  if (datetime.hour < 12) {
    return "Good Morning";
  } else {
    return "Good Evening";
  }
}
