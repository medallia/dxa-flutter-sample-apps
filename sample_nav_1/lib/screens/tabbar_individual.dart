import 'package:flutter/material.dart';
import 'package:medallia_dxa/medallia_dxa.dart';

class TabBarScreenIndividual extends StatefulWidget {
  const TabBarScreenIndividual({Key? key}) : super(key: key);

  @override
  State<TabBarScreenIndividual> createState() => _TabBarScreenIndividualState();
}

class _TabBarScreenIndividualState extends State<TabBarScreenIndividual>
    with TickerProviderStateMixin<TabBarScreenIndividual> {
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
          TabWidget(
            tabNumber: 3,
          ),
        ]));
  }
}

class TabWidget extends StatelessWidget {
  const TabWidget({super.key, required this.tabNumber});
  final int tabNumber;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      observers: [MedalliaDxa.routeObserver],
      onGenerateRoute: (settings) => MaterialPageRoute(
          settings: RouteSettings(name: '/tab_widget_$tabNumber'),
          builder: (context) => Center(
                child: Text('tab widget $tabNumber'),
              )),
    );
  }
}
