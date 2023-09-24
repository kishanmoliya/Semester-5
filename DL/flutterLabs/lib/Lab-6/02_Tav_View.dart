import 'package:flutter/material.dart';

class TabViewDemo extends StatefulWidget {
  const TabViewDemo({Key? key}) : super(key: key);

  @override
  State<TabViewDemo> createState() => _TabViewDemoState();
}

class _TabViewDemoState extends State<TabViewDemo> {
  final TabController _tabController = TabController(length: 2, vsync: AnimatedListState());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabView Example'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Text('Tab 1'),
          ),
          Center(
            child: Text('Tab 2'),
          ),
        ],
      ),
    );
  }
}
