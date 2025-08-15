String formatTime(Duration d) {
  return "${d.inHours}:${d.inMinutes - d.inHours * 60}";
}
