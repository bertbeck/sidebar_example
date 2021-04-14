import 'dart:math' as math show pi;
import 'package:example/trending_list.dart';
import 'package:example/venue_list.dart';
import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';

import 'editable_tabs.dart';
import 'justadded_list.dart';

class SidebarPage extends StatefulWidget {
  static _SidebarPageState? state;

  static goto(String s) {
    state!.goto(s);
  }

  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  late List<CollapsibleItem> _items;
  late String headline;
  NetworkImage _avatarImg = NetworkImage(
      'http://tenfins.com/public/images/bignight/app_icon.png?ver=1');

  goto(String route) {
    setState(() {
      headline = route;
    });
  }

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    headline = _items.firstWhere((item) => item.isSelected).text;
    SidebarPage.state = this;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Venues',
        icon: Icons.deck,
        onPressed: () => setState(() => headline = 'Venues'),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Trending',
        icon: Icons.trending_up,
        onPressed: () => setState(() => headline = 'Trending'),
      ),
      CollapsibleItem(
        text: 'Just Added',
        icon: Icons.search,
        onPressed: () => setState(() => headline = 'Just Added'),
      ),
      CollapsibleItem(
        text: 'Events',
        icon: Icons.list,
        onPressed: () => setState(() => headline = 'Notifications'),
      ),
      CollapsibleItem(
        text: 'Activity',
        icon: Icons.sync_alt,
        onPressed: () => setState(() => headline = 'Activity'),
      ),
      CollapsibleItem(
        text: 'Users',
        icon: Icons.account_circle,
        onPressed: () => setState(() => headline = 'Users'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CollapsibleSidebar(
        items: _items,
        avatarImg: _avatarImg,
        title: 'Comped Admin',
        body: _body(size, context),
        backgroundColor: Color(0xff0e2d46),
        selectedTextColor: Colors.limeAccent,
        textStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
        titleStyle: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        toggleTitleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    if (headline == 'Venues') return VenueList(title: 'Venues');
    if (headline == 'Trending') return TrendingList(title: 'Trending');
    if (headline == 'Just Added') return JustAdded(title: 'JustAdded');

    return TabContainer(key: Key('xxx'));

    return Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueGrey[50],
        child: Center(
          child: Transform.rotate(
            angle: math.pi / 2,
            child: Transform.translate(
              offset: Offset(-size.height * 0.3, -size.width * 0.23),
              child: Text(
                headline,
                style: Theme.of(context).textTheme.headline1,
                overflow: TextOverflow.visible,
                softWrap: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}