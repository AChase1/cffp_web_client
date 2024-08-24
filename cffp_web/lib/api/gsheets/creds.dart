import 'package:gsheets/gsheets.dart';

const _credentials = r'''
{
  "type": "service_account",
  "project_id": "",
  "private_key_id": "",
  "private_key": "",
  "client_email": "",
  "client_id": "",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": ""
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
