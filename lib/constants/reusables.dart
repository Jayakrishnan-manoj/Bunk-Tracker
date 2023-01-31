int reqAttendance(int present, int total) {
  return ((75 * total - 100 * present) / (100 - 75)).toInt();
}

int daysToBunk(int present, total) {
  return ((100 * present - 75 * total) / 75).toInt();
}
