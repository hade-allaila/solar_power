String formatTime(Duration d) {
  int hours = d.inHours;
  int minutes = d.inMinutes - d.inHours * 60;
  String hoursString = hours < 10 ? "0$hours" : "$hours";
  String minutesString = minutes < 10 ? "0$minutes" : "$minutes";
  return "${hoursString}:${minutesString}";
}
