import 'package:hooks_riverpod/hooks_riverpod.dart';

final weekProvider = Provider<String>((ref) => getCurrWeek());

final _weekDates = [
  [DateTime(2024, 9, 1, 0, 0), DateTime(2024, 9, 10, 11, 55)],
  [DateTime(2024, 9, 10, 11, 55), DateTime(2024, 9, 17, 11, 55)],
  [DateTime(2024, 9, 17, 11, 55), DateTime(2024, 9, 24, 11, 55)],
  [DateTime(2024, 9, 24, 11, 55), DateTime(2024, 10, 1, 11, 55)],
  [DateTime(2024, 10, 1, 11, 55), DateTime(2024, 10, 8, 11, 55)],
  [DateTime(2024, 10, 8, 11, 55), DateTime(2024, 10, 15, 11, 55)],
  [DateTime(2024, 10, 15, 11, 55), DateTime(2024, 10, 22, 11, 55)],
  [DateTime(2024, 10, 22, 11, 55), DateTime(2024, 10, 29, 11, 55)],
  [DateTime(2024, 10, 29, 11, 55), DateTime(2024, 11, 5, 11, 55)],
  [DateTime(2024, 11, 5, 11, 55), DateTime(2024, 11, 12, 11, 55)],
  [DateTime(2024, 11, 12, 11, 55), DateTime(2024, 11, 19, 11, 55)],
  [DateTime(2024, 11, 19, 11, 55), DateTime(2024, 11, 26, 11, 55)],
  [DateTime(2024, 11, 26, 11, 55), DateTime(2024, 12, 3, 11, 55)],
  [DateTime(2024, 12, 3, 11, 55), DateTime(2024, 12, 10, 11, 55)],
  [DateTime(2024, 12, 10, 11, 55), DateTime(2024, 12, 17, 11, 55)],
  [DateTime(2024, 12, 17, 11, 55), DateTime(2024, 12, 24, 11, 55)],
  [DateTime(2024, 12, 24, 11, 55), DateTime(2024, 12, 31, 11, 55)],
  [DateTime(2024, 12, 31, 11, 55), DateTime(2025, 1, 7, 11, 55)],
  [DateTime(2025, 1, 7, 11, 55), DateTime(2025, 1, 14, 11, 55)],
  [DateTime(2025, 1, 14, 11, 55), DateTime(2025, 1, 21, 11, 55)],
  [DateTime(2025, 1, 21, 11, 55), DateTime(2025, 1, 28, 11, 55)],
  [DateTime(2025, 1, 28, 11, 55), DateTime(2025, 2, 31, 11, 55)]
];

String getCurrWeek() {
  final now = DateTime.now();
  var count = 1;
  for (final week in _weekDates) {
    if (now.compareTo(week[0]) >= 0 && now.compareTo(week[1]) <= 0) {
      return count.toString();
    }
    count++;
  }
  return count.toString();
}
