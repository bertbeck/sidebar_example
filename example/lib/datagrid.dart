import 'package:flutter/material.dart';

import 'main.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: TestDataTable(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class TestDataTable extends StatelessWidget {
  TestDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
        appBar: 
          AppBar(
            title: Text('Nav Test'),
            actions: [vCenteredText('DataTable()', onClick: onClick(context))]),    
    
     body:
      DataTable(
      columnSpacing: 20.0,
      columns: const <DataColumn>[
        DataColumn(
          label: SizedBox(
              width: 30,
              child: Text(
                '',
              )),
        ),
        DataColumn(
          label: Text(
            'Venue-id',
            style: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Venue Name',
            style: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'City',
            style: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'State',
            style: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Menu Items',
            style: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Center(child: Icon(Icons.edit, size: 16))),
            DataCell(Text('empire-boston')),
            DataCell(Text('Empire Boston')),
            DataCell(Text('Boston')),
            DataCell(Text('MA')),
            DataCell(Center(child: Icon(Icons.view_list, size: 18))),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Center(child: Icon(Icons.edit, size: 16))),
            DataCell(Text('scorpion-boston')),
            DataCell(Text('Scorpion Boston')),
            DataCell(Text('Boston')),
            DataCell(Text('MA')),
            DataCell(Center(child: Icon(Icons.view_list, size: 18))),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Center(child: Icon(Icons.edit, size: 16))),
            DataCell(Text('mystique-boston')),
            DataCell(Text('Mystique Boston')),
            DataCell(Text('Boston')),
            DataCell(Text('MA')),
            DataCell(Center(child: Icon(Icons.view_list, size: 18))),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Center(child: Icon(Icons.edit, size: 16))),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Center(child: Icon(Icons.view_list, size: 18))),
          ],
        ),
      ],
    )
    );
  }
}
