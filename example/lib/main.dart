import 'dart:math' as math show pi;
import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'datagrid.dart';
import 'editable_tabs.dart';
import 'sidebarPage.dart';
import 'venue_list.dart';
import 'trending_list.dart';
import 'justadded_list.dart';

void main() => runApp(MyApp());

  String currentRoute = '/dataTable';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: currentRoute,
      routes: {
        '/dataTable': (context) => TestDataTable(),
        '/sidebar': (context) => SidebarPage(),
      },
      title: 'Sidebar ui',
      // home: Scaffold(
      //   appBar: AppBar(
      //       title: Text('Nav Test'),
      //       actions: [vCenteredText('DataTable()', onClick: onClick(context))]),
      //   body: TestDataTable(), //SidebarPage(),
      // ),
    );
  }
}

  onClick(BuildContext context) {
    Navigator.pushNamed(
        context, currentRoute == '/dataTable' ? '/sidebar' : '/dataTable');
  }



Widget vCenteredText(String text, {onClick: Function}) {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Text(text))
  ]);
}
