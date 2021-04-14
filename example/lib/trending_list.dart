//import 'package:editable/editable.dart';
import 'editable/lib/editable.dart';
import 'package:flutter/material.dart';

class TrendingList extends StatelessWidget {
  TrendingList({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Editable example',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.grey,
        accentColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Trending(title: title),
    );
  }
}

class Trending extends StatefulWidget {
  Trending({required this.title});

  final String title;

  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  /// Create a Key for EditableState
  final _editableKey = GlobalKey<EditableState>();

  late List rows;
  static int id = 0;

  @override
  initState() {
    id++;
    rows = [
      {
        "venue-id": 'empire-boston',
        "name": 'Empire Boston',
        "address": '',
        "city": 'Boston',
        "state": 'MA',
        "geolat": '',
        "geolng": '',
      },
      {
        "venue-id": 'scorpion-boston',
        "name": 'Scoripion Boston',
        "address": '',
        "city": 'Boston',
        "state": 'MA',
        "geolat": '',
        "geolng": '',
      },
      {
        "venue-id": 'high-rollers',
        "name": 'Empire Boston',
        "address": '',
        "city": 'Boston',
        "state": 'MA',
        "geolat": '',
        "geolng": '',
      },
      {
        "venue-id": 'mystique-boston',
        "name": 'Empire Boston',
        "address": '',
        "city": 'Boston',
        "state": 'MA',
        "geolat": '',
        "geolng": '',
      },
    ];
    for (int i = 0; i < 3; i++) {
      rows.add({
        "venue-id": '',
        "name": '',
        "address": '',
        "city": '',
        "state": '',
        "geolat": '',
        "geolng": '',
      });
    }
    super.initState();
  }

  List cols = [
    {
      "title": 'Venue ID',
      //'widthFactor': 0.2,
      'key': 'venue-id',
      //'editable': true
    },
    {"title": 'Name', 'key': 'name', 'widthFactor': 0.1},
    {"title": 'Address', 'key': 'address', 'widthFactor': 0.2},
    {"title": 'Ingredients', 'key': 'ingredients', 'widthFactor': 0.2},
    {"title": 'City', 'key': 'city', 'widthFactor': 0.1},
    {"title": 'State', 'key': 'state', 'widthFactor': 0.08},
    {"title": 'Geo Lat', 'key': 'geolat', 'widthFactor': 0.1},
    {"title": 'Geo Lng', 'key': 'geolng', 'widthFactor': 0.08},
  ];

  /// Function to add a new row
  /// Using the global key assigined to Editable widget
  /// Access the current state of Editable
  void _addNewRow() {
    setState(() {
      _editableKey.currentState!.createRow();
    });
  }

  ///Print only edited rows.
  void _printEditedRows() {
    List editedRows = _editableKey.currentState!.editedRows;
    print(editedRows);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        // appBar: AppBar(
        //   leadingWidth: 200,
        //   leading: TextButton.icon(
        //       onPressed: () => _addNewRow(),
        //       icon: Icon(Icons.add),
        //       label: Text(
        //         'Add',
        //         style: TextStyle(fontWeight: FontWeight.bold),
        //       )),
        //   //title: Text(widget.title),
        //   actions: [
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: TextButton(
        //           onPressed: () => _printEditedRows(),
        //           child: Text('Print Edited Rows',
        //               style: TextStyle(fontWeight: FontWeight.bold))),
        //     )
        //   ],
        // ),
        body: SingleChildScrollView(
            child: Column(
      children: [
        Text('Trending',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Container(
            height: height - 60,
            width: 900,
            child: Editable(
              key: _editableKey,
              columns: cols,
              //columnCount: 8,
              rows: rows,
              zebraStripe: true,
              stripeColor1: Colors.blue.shade50,
              stripeColor2: Colors.grey.shade50,
              onRowSaved: (value) {
                print(value);
              },
              onSubmitted: (value) {
                print(value);
              },
              borderColor: Colors.blueGrey,
              tdStyle: TextStyle(fontWeight: FontWeight.normal),
              trHeight: 80,
              thStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              thAlignment: TextAlign.center,
              thVertAlignment: CrossAxisAlignment.end,
              thPaddingBottom: 3,
              showEditIcon: true,
              showSaveIcon: true,
              saveIconColor: Colors.black,
              showCreateButton: true,
              tdAlignment: TextAlign.left,
              tdEditableMaxLines: 100, // don't limit and allow data to wrap
              tdPaddingTop: 10,
              tdPaddingBottom: 14,
              tdPaddingLeft: 5,
              tdPaddingRight: 8,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.all(Radius.circular(0))),
            )),
      ],
    )));
  }
}
