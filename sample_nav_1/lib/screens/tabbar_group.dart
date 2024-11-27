import 'package:sample_nav_1/screens/reused_widgets.dart';
import 'package:flutter/material.dart';

class TabBarScreenGroup extends StatefulWidget {
  const TabBarScreenGroup({Key? key}) : super(key: key);

  @override
  State<TabBarScreenGroup> createState() => _TabBarScreenGroupState();
}

class _TabBarScreenGroupState extends State<TabBarScreenGroup>
    with TickerProviderStateMixin<TabBarScreenGroup> {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(icon: Icon(Icons.assignment)),
              Tab(icon: Icon(Icons.dashboard_customize_rounded)),
              Tab(icon: Icon(Icons.recycling)),
            ],
          ),
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/welcome_screen', ((route) => false));
                  //Implement logout functionality
                }),
          ],
          title: const Text('Home Page'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: TabBarView(controller: tabController, children: const [
          TabWidget(
            tabNumber: 1,
          ),
          TabWidget(
            tabNumber: 2,
          ),
          ReusedScreen(
            inTabBar: true,
          )
        ]));
  }
}

class TabWidget extends StatelessWidget {
  const TabWidget({super.key, required this.tabNumber});
  final int tabNumber;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Tab number $tabNumber"),
    );
  }
}
