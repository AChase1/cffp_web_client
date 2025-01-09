// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../api/models/gametimes.dart';
import '../api/models/schedule.dart';
import '../api/models/teams.dart';

final _lgins = [
  {'username': '94', 'password': '28', 'name': 'aaron'},
  {'username': '54', 'password': '33', 'name': 'alex'},
  {'username': '87', 'password': '91', 'name': 'bruce'},
  {'username': '51', 'password': '87', 'name': 'chrissy'},
  {'username': '23', 'password': '98', 'name': 'cory'},
  {'username': '99', 'password': '08', 'name': 'ethan'},
  {'username': '45', 'password': '76', 'name': 'francois'},
  {'username': '68', 'password': '17', 'name': 'graham'},
  {'username': '37', 'password': '25', 'name': 'janet'},
  {'username': '18', 'password': '79', 'name': 'joy'},
  {'username': '14', 'password': '56', 'name': 'sara'},
  {'username': '06', 'password': '47', 'name': 'victoria'},
];

class GamesArea extends StatefulWidget {
  const GamesArea({super.key});

  @override
  State<StatefulWidget> createState() => _GamesArea();
}

class _GamesArea extends State<GamesArea> {
  TextEditingController _credsController = TextEditingController();

  Future<void> submitPicks(String member) async {
    String picks = "";
    for (var item in selections) {
      picks += item.toString();
    }
    var db = FirebaseFirestore.instance.collection('members');
    print("Adding $member with picks = $picks");
    await db.doc(member).set({"picks": picks});
  }

  Future<Map<String, dynamic>?> getPicks(String member) async {
    var db = FirebaseFirestore.instance.collection('members');
    var res = await db.doc(member).get();
    var resData = res.data();
    return resData;
  }

  var selectedMatchups = [
    {
      "i": 0,
      "away": teams["lac"],
      "day": GameTimes.sat430pm,
      "home": teams["hou"],
      "pick": PickType.none,
    },
    {
      "i": 1,
      "away": teams["pit"],
      "day": GameTimes.sat800pm,
      "home": teams["bal"],
      "pick": PickType.none,
    },
    {
      "i": 2,
      "away": teams["den"],
      "day": GameTimes.sun100pm,
      "home": teams["buf"],
      "pick": PickType.none,
    },
    {
      "i": 3,
      "away": teams["gb"],
      "day": GameTimes.sun425pm,
      "home": teams["phi"],
      "pick": PickType.none,
    },
    {
      "i": 4,
      "away": teams["was"],
      "day": GameTimes.sun820pm,
      "home": teams["tb"],
      "pick": PickType.none,
    },
    {
      "i": 5,
      "away": teams["min"],
      "day": GameTimes.mon815pm,
      "home": teams["lar"],
      "pick": PickType.none,
    }
  ];

  var selections = [0, 0, 0, 0, 0, 0];
  @override
  Widget build(BuildContext context) {
    print(selections);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 600.0,
          height: 600.0,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: selectedMatchups.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> something = selectedMatchups[index];
                      String home = something['home']['abb'];
                      String away = something['away']['abb'];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                color: selections[index] == 2 ? Colors.green : const Color.fromARGB(255, 212, 212, 212),
                              ),
                              height: 40.0,
                              width: 100.0,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    setState(
                                      () {
                                        selections[index] == 2 ? selections[index] = 0 : selections[index] = 2;
                                      },
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      away.toUpperCase(),
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                color: selections[index] == 1 ? Colors.green : const Color.fromARGB(255, 212, 212, 212),
                              ),
                              height: 40.0,
                              width: 100.0,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    setState(
                                      () {
                                        selections[index] == 1 ? selections[index] = 0 : selections[index] = 1;
                                      },
                                    );
                                  },
                                  child: Center(
                                    child: Text(home.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: SizedBox(
                  width: 300.0,
                  height: 60.0,
                  child: TextField(
                    maxLength: 4,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.blueGrey,
                    controller: _credsController,
                    decoration: InputDecoration(hintText: "Enter Credentials Here"),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.grey.shade200,
                  ),
                  width: 300.0,
                  height: 60.0,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        var creds = _credsController.text;
                        if (creds.length == 4) {
                          var u = _lgins.firstWhere(
                            (el) => el['username'] == '${creds[0]}${creds[1]}' && el['password'] == '${creds[2]}${creds[3]}',
                            orElse: () => {},
                          );
                          if (u.isNotEmpty && u['name'] != null) {
                            var res = await getPicks(u['name']!);
                            if (res != null && res["picks"] != null && res["picks"] is String && (res["picks"] as String).length == selections.length) {
                              var picks = (res["picks"] as String).split("");
                              for (var i = 0; i < picks.length; i++) {
                                selections[i] = int.tryParse(picks[i]) ?? 0;
                              }
                              setState(() {
                                selections = selections;
                              });
                              return;
                            } else {
                              showDialog(
                                // ignore: use_build_context_synchronously
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shadowColor: Colors.blueGrey,
                                    title: Text(
                                      'Picks Not Found',
                                      textAlign: TextAlign.center,
                                    ),
                                    content: Text(
                                      "Right credentials, but no picks",
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                },
                              );
                            }
                          }
                        }
                        showDialog(
                          // ignore: use_build_context_synchronously
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shadowColor: Colors.blueGrey,
                              title: Text(
                                'Picks Not Found',
                                textAlign: TextAlign.center,
                              ),
                              content: Text(
                                "You entered the wrong credentials",
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                        );
                      },
                      child: Center(
                        child: Text(
                          'GET PICKS',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.blueGrey,
                ),
                width: 300.0,
                height: 60.0,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      var creds = _credsController.text;
                      if (creds.length == 4) {
                        var u = _lgins.firstWhere(
                          (el) => el['username'] == '${creds[0]}${creds[1]}' && el['password'] == '${creds[2]}${creds[3]}',
                          orElse: () => {},
                        );
                        if (u.isNotEmpty && u['name'] != null) {
                          await submitPicks(u['name']!);
                          showDialog(
                            // ignore: use_build_context_synchronously
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shadowColor: Colors.blueGrey,
                                title: Text(
                                  'Picks Saved for ${u['name']!}',
                                  textAlign: TextAlign.center,
                                ),
                                content: Text(
                                  "Yup",
                                  textAlign: TextAlign.center,
                                ),
                              );
                            },
                          );
                          return;
                        }
                      }
                      showDialog(
                        // ignore: use_build_context_synchronously
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shadowColor: Colors.blueGrey,
                            title: Text('Picks Not Saved'),
                            content: Text("You entered the wrong credentials"),
                          );
                        },
                      );
                    },
                    child: Center(
                      child: Text(
                        'SAVE',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
