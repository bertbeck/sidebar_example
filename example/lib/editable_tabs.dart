import 'package:flutter/material.dart';

import 'menu_items.dart';
import 'main.dart';
import 'tabs.dart';


class TabContainer extends StatefulWidget {
  TabContainer({required Key key}) : super(key: key);

  @override
  _TabContainerState createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  List<Widget> originalList = [];
  Map<int, bool> originalDic = Map<int, bool>();
  List<Widget> listScreens = [];
  List<int> listScreensIndex = [];

  int tabIndex = 0;
  Color tabColor = Colors.white;
  Color selectedTabColor = Colors.amber;

  @override
  void initState() {
    super.initState();

    originalList = [
      CategoryList(title:'Main menu'),
      CategoryList(title:'Appetizers'),
      CategoryList(title:'Drinks'),
      CategoryList(title:'Deserts'),      
    ];
    originalDic = {0: true, 1: false, 2: false, 3:false};
    listScreens = [originalList.first];
    listScreensIndex = [0];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.yellow,
      home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text("Empire Boston - Main Menu", style:TextStyle(color:Colors.white)),
      ),        
      //drawer: NavDrawer(),        
        body: IndexedStack(
            index: listScreensIndex.indexOf(tabIndex), children: listScreens),
        bottomNavigationBar: _buildTabBar(),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  void _selectedTab(int index) {
    if (originalDic[index] == false) {
      listScreensIndex.add(index);
      originalDic[index] = true;
      listScreensIndex.sort();
      listScreens = listScreensIndex.map((index) {
        return originalList[index];
      }).toList();
    }

    setState(() {
      tabIndex = index;
    });
  }

  Widget _buildTabBar() {
    var listItems = [
      Text('Main', style:TextStyle(color:Colors.white)),
      Text('Appetizers', style:TextStyle(color:Colors.white)),
      Text('Drinks', style:TextStyle(color:Colors.white)),
      Text('Deserts', style:TextStyle(color:Colors.white)),
    ];

    var items = List.generate(listItems.length, (int index) {
      return _buildTabItem(
        item: listItems[index],
        index: index,
        onPressed: _selectedTab,
      );
    });

    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: items,
      ),
      color: Colors.black54, //Theme.of(context).primaryColor,
    );
  }

  Widget _buildTabItem({
    required Widget item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    var color = tabIndex == index ? selectedTabColor : tabColor;
    return //Expanded(
      //child: 
      SizedBox(
        height: 60,
        width: 100,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                item
              ],
            ),
          ),
        ),
      //),
    );
  }
}

class BottomAppBarItem {
  BottomAppBarItem({required this.iconData, required this.text});
  IconData iconData;
  String text;
}