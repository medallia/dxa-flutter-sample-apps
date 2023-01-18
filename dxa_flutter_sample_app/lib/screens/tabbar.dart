import 'package:decibel_sdk/decibel_sdk.dart';
import 'package:dxa_flutter_sample_app/screens/reused_widgets.dart';
import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with TickerProviderStateMixin<TabBarScreen> {
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
    return ScreenWidget(
      screenName: 'home_sreen',
      tabController: tabController,
      tabNames: const [
        'form_screen',
        'layout_screen',
        'reused_screen_in_tabbar'
      ],
      child: Scaffold(
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
                        context, '/', ((route) => false));
                    //Implement logout functionality
                  }),
            ],
            title: const Text('Home Page'),
            backgroundColor: Colors.lightBlueAccent,
          ),
          body: TabBarView(controller: tabController, children: const [
            ///Don't put ScreenWidgets in these screens unless they are also
            ///going to be used as independent screens outside of this tabBar,
            ///like ReusedScreen()
            TabWidget(
              tabNumber: 1,
            ),
            TabWidget(
              tabNumber: 2,
            ),
            ReusedScreen(
              inTabBar: true,
            )
          ])),
    );
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
