extension Comparers on DateTime {
  bool operator >=(DateTime date) =>
      compareTo(date) > 0 || compareTo(date) == 0;
  bool operator <=(DateTime date) =>
      compareTo(date) < 0 || compareTo(date) == 0;
}
