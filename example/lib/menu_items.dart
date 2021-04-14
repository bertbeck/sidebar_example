//import 'package:editable/editable.dart';
import 'editable/lib/editable.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  CategoryList({required this.title});

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
      home: Category(title: title),
    );
  }
}

class Category extends StatefulWidget {
  Category({required this.title});

  final String title;

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  /// Create a Key for EditableState
  final _editableKey = GlobalKey<EditableState>();

  late List rows;
  static int id = 0;

  @override
  initState() {
    id++;
    rows = [
      {
        "item-id": '$id-shrimp-cocktail',
        "name": 'Shrimp cocktail',
        "description": 'Plate of 6 fresh shrimp',
        "ingredients": '',
        "price1": '15\$',
        "label1": '',
        "price2": '15\$',
        "label2": '',
      },
      {
        "item-id": '$id-honey-wings',
        "name": 'Honey Wings',
        "description": 'Plate of 6 honey wings',
        "ingredients": '',
        "price1": '15\$',
        "label1": '',
        "price2": '15\$',
        "label2": '',
      },
      {
        "item-id": '$id-hot-wings',
        "name": 'Honey Wings',
        "description": 'Plate of 6 honey wings',
        "ingredients": '',
        "price1": '15\$',
        "label1": '',
        "price2": '15\$',
        "label2": '',
      },
      {
        "item-id": '$id-sliders',
        "name": 'Sliders',
        "description": 'Three hot sliders',
        "ingredients": '',
        "price1": '15\$',
        "label1": '',
        "price2": '15\$',
        "label2": '',
      },
    ];
    for (int i = 0; i < 3;  i++) {
      rows.add({
        "item-id": '',
        "name": '',
        "description": '',
        "ingredients": '',
        "price1": '',
        "label1": '',
        "price2": '',
        "label2": '',

      });
    }
    super.initState();
  }

  List cols = [
    {
      "title": 'Item ID',
      //'widthFactor': 0.2,
      'key': 'item-id',
      //'editable': true
    },
    {"title": 'Name', 'key': 'name', 'widthFactor': 0.1},
    {"title": 'Description', 'key': 'description', 'widthFactor': 0.2},
    {"title": 'Ingredients', 'key': 'ingredients', 'widthFactor': 0.2},
    {"title": 'Price1', 'key': 'price1', 'widthFactor': 0.1},
    {"title": 'Label1', 'key': 'label1', 'widthFactor': 0.08},
    {"title": 'Price2', 'key': 'price2', 'widthFactor': 0.1},
    {"title": 'Label2', 'key': 'label2', 'widthFactor': 0.08},
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
        Container(
            height: height - 60,
            width: 3000,
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
