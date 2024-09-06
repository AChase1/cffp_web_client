import 'package:cffp_web/api/models/members.dart';
import 'package:cffp_web/api/models/week_indices.dart';
import 'package:gsheets/gsheets.dart';

const _credentials = r'''
{
  "type": "service_account",
  "project_id": "cffp2024",
  "private_key_id": "8061511439216de4f98f5434c415b6fb89213c25",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCiOm9vX+Epb2p6\nOk1Ux2NeNEqHbrbPsYoUH9NiHVHtINMG4rTtjgzKVvTx0YopV5iYHsoKbtW6lhCT\ny3HgBKyuj67I9QEZTUWKPGHte6D0wV3S/NPc1+U1bGuooFzonEauEhyoIT+4EC+9\nhZ8WYe7IIbcTstLohxSjnSW+RS6wVVSTx0sE9u9I/Xm8xvJ2R1tXT7Q2/tlIwUXR\nurF6AjpLm+6jeE3DUPWVypN5XxiWAiFIWzBHHlaNsUUCovqwVK4bbSnEH5WAdc7G\nFXPAnLinOTqEaM6B/GkCqq30Jsw53Nsfs5QJ1TAfS7s4EdxhouhUA2+qKeSZ4FN3\nndFCiY0zAgMBAAECggEAEBVuDeM6HhMLQfH8z75y5hiWGQZLfpzx/RvIp84TXMin\n02Nvn6u5LehgIYduRLoICXDoBA/IBdcx7o05jYW5Hxdks0zDHqCQF+vzo4lhxFJV\nfIEPejI3acwFgnLfszonMcPe7nZZbGTCbu5L/vqXo2TgU0Yj7eTSkYQXhV0zi0zJ\n4/85bB2T1CxaqrD7LNmQTwCREoznlwxSy2AgQpu/z+0kZtO7QDvt+jc1MuNkqTOH\nGTrQG/aEZ2BooyFE6QEknW6qmtG2AEtPdVndkJavrF0sGFVoZjQlrxbVnoB8qvKW\n7dPcP1WbPh9Dr5TyHYc5g+cXwcoucNr1r6kT9fOXDQKBgQDeqtX38JmREZdaYRTE\nSFtFNbNZB2FBbWPZH0pdYkfqBp7RIYF9t0qERXChJFT8p1g53F2vs7ZR9JER2kl+\n4OoYJdjqSWiIijriwTVKeaoSHupCWFdc2mlo6e0zZrKraa2PO27AUdwHRqjVYzgJ\nWxqVhYQ0uNtLAMtPErqDX+/lzwKBgQC6g2y1RSRCoG52O55oLrhyYhz0P95wjrdS\nRYp8DfTOPkrlre3TkxmkRZF22XpqjQEBTB6LmMySSK3ISMJxaufLJWEvNTOPnHwj\naKSNfgTSvK1GPhfqgkzaf/yMrtIwPaWZX+TYos05zIA7ycExEuQBSJKq8OpbnuXB\naOVyXkEfXQKBgQC8dCQx+21NjXDm6mF0GrU8p02KnSdgA6BNRCFhVev9kurZnx0E\ndJvZxRelGqXfTBbsqaiVK2m0hWQ+ktw/SUZ3d5jV+ZlCbpOWFOXwiXY6bfXgfvo5\nuRUb2ViLd3DiiMd/AVMj7GRnuBLuv1HPAU9Hm0Agiw/2s85et0AqLolQmwKBgBAp\neU8P6b94RXorWmOuwL7wr4+exTi9tTcE3aY4U2FX1oemlbhCw/MPMDa7S7dV9qNV\nJER2fiui7qQvYeIQIHvjBlPf6VLlfYBX/gJgzCwyu1Ud5lak6eH5Ozo5n+8cOHBc\n9eir2trKVMZZikslVuqhjkwPyk8cKs6it1c8wanlAoGAbOFb9GUaK7+ZsVGf/NWx\naZDsKonFp8wFS9WvJrFV2hZSWIgIN3k/kCzEr3Gl5dJp92DMIx0pP9fFMc9PNZJr\nC5POyngjuciXSXKYxxgKxujvoJp3VzoQqkSWb4FrP7Y3nJFBzrTFnWkRaIJIIkKy\n16A4BqqC6GHZ9y2LilrSOnQ=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@cffp2024.iam.gserviceaccount.com",
  "client_id": "112227264807589627422",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40cffp2024.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';

const _spreadsheetId = '';

Future<Worksheet?> setUpSheets() async {
  final gsheets = GSheets(_credentials);
  final ss = await gsheets.spreadsheet(_spreadsheetId);
  final sheet = ss.worksheetByTitle('CFFP 20242025');
  return sheet;
}

Future<void> getCellData() async {
  final sheet = await setUpSheets();
  if (sheet != null) {
    // Get value at B2
    await sheet.values.value(column: 2, row: 2);
  }
}

Future<void> getCellColumn() async {
  final sheet = await setUpSheets();
  if (sheet != null) {
    // Get all values in column B starting at B2
    await sheet.values.column(2, fromRow: 2);
  }
}

Future<void> insertCellData() async {
  final sheet = await setUpSheets();
  if (sheet != null) {
    // Insert new value into C2
    await sheet.values.insertValue('Banana', row: 2, column: 3);
  }
}

Future<void> insertCellRow() async {
  final sheet = await setUpSheets();
  if (sheet != null) {
    // Insert values into row 3, starting at column C (C3, D3, E3, ...)
    await sheet.values.insertRow(3, ['CIN', 'BAL', 'TEN', 'SEA'], fromColumn: 3);
  }
}

/// Legitimate Method
///
/// Takes in list of [picks] for the current [week] (team is abbreviated, can be uppercase)
/// Ensure that [member] is in lowercase
Future<void> insertPicks(String member, List<String> picks, String week) async {
  final sheet = await setUpSheets();
  var weekIndex = weekIndices.entries.firstWhere(
    (el) => el.key == week,
    orElse: () => const MapEntry("null", {}),
  );
  var memberPickIndex = members.entries.firstWhere(
    (el) => el.key == member,
    orElse: () => const MapEntry("null", {}),
  );
  if (sheet != null &&
      memberPickIndex.key != "null" &&
      memberPickIndex.value["picks_index"] != null &&
      weekIndex.key != "null" &&
      weekIndex.value["row"] != null &&
      weekIndex.value["games"] == picks.length) {
    await sheet.values.insertColumn(memberPickIndex.value["picks_index"]! as int, picks, fromRow: weekIndex.value["row"]!);
  }
}

/// Legitimate method
Future<List<String>> getPicks(String member, String week) async {
  final sheet = await setUpSheets();
  var weekIndex = weekIndices.entries.firstWhere(
    (el) => el.key == week,
    orElse: () => const MapEntry("null", {}),
  );
  var memberPickIndex = members.entries.firstWhere(
    (el) => el.key == member,
    orElse: () => const MapEntry("null", {}),
  );
  if (sheet != null &&
      memberPickIndex.key != "null" &&
      memberPickIndex.value["picks_index"] != null &&
      weekIndex.key != "null" &&
      weekIndex.value["row"] != null &&
      weekIndex.value["games"] != null) {
    return await sheet.values.column(memberPickIndex.value["picks_index"]! as int, fromRow: weekIndex.value["row"]!, length: weekIndex.value["games"]!);
  }
  return [];
}

/// Legitimate method
Future<String> validatePassword(String guessedPwd) async {
  final sheet = await setUpSheets();
  if (sheet != null && guessedPwd.isNotEmpty) {
    for (var i = 1; i < 15; i++) {
      var oogla = await sheet.values.value(column: i, row: 7);
      if (guessedPwd == oogla) {
        return (await sheet.values.value(column: i, row: 4)).toLowerCase();
      }
    }
  }
  return "";
}