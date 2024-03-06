// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medallia_dxa/medallia_dxa.dart';
import 'package:sample_nav_2/dialog_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MedalliaDxa.initialize(
      dxaConfig: DxaConfig(
    property: 0,
    account: 0,
  ));
  runApp(NestedTabNavigationExampleApp());
}

class NestedTabNavigationExampleApp extends StatelessWidget {
  NestedTabNavigationExampleApp({super.key});

  final GoRouter _router = GoRouter(
    /// GoRouter class uses a Navigator Widget, so the
    /// observer needs to be added.
    observers: [MedalliaDxa.routeObserver],
    initialLocation: '/a',
    routes: <RouteBase>[
      StatefulShellRoute(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return navigationShell;
        },
        navigatorContainerBuilder: (BuildContext context,
            StatefulNavigationShell navigationShell, List<Widget> children) {
          return ScaffoldWithNavBar(
              navigationShell: navigationShell, children: children);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            /// StatefulShellBranch class uses a Navigator Widget, so the
            /// observer needs to be added.
            observers: [MedalliaDxa.routeObserver],
            routes: <RouteBase>[
              GoRoute(
                path: '/a',
                builder: (BuildContext context, GoRouterState state) =>
                    const RootScreenA(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (BuildContext context, GoRouterState state) =>
                        const DetailsScreen(label: 'A'),
                  ),
                  GoRoute(
                    path: 'custom-dialog',
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      return DialogPage(
                          builder: (_) => const Dialog(
                                child: SizedBox(
                                  height: 300,
                                  width: 100,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                          "This Dialog is pushed using Navigation 2.0, so it has its own custom name, defined in the same way as the rest of the screens"),
                                    ),
                                  ),
                                ),
                              ));
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            /// StatefulShellBranch class uses a Navigator Widget, so the
            /// observer needs to be added.
            observers: [MedalliaDxa.routeObserver],

            routes: <RouteBase>[
              StatefulShellRoute(
                builder: (BuildContext context, GoRouterState state,
                    StatefulNavigationShell navigationShell) {
                  return navigationShell;
                },
                navigatorContainerBuilder: (BuildContext context,
                    StatefulNavigationShell navigationShell,
                    List<Widget> children) {
                  return TabbedRootScreen(
                      navigationShell: navigationShell, children: children);
                },
                branches: <StatefulShellBranch>[
                  /// StatefulShellBranch class uses a Navigator Widget, so the
                  /// observer needs to be added.
                  StatefulShellBranch(observers: [
                    MedalliaDxa.routeObserver
                  ], routes: <GoRoute>[
                    GoRoute(
                      path: '/b1',
                      builder: (BuildContext context, GoRouterState state) =>
                          const TabScreen(
                        label: 'B1',
                        detailsPath: '/b1/details',
                        index: 1,
                      ),
                      routes: <RouteBase>[
                        GoRoute(
                            path: 'details',
                            builder:
                                (BuildContext context, GoRouterState state) =>
                                    const DetailsScreen(
                                      param: '1',
                                      label: 'B1',
                                      withScaffold: false,
                                    ),
                            routes: [
                              GoRoute(
                                path: 'details-extra',
                                builder: (context, state) =>
                                    const DetailsScreen(
                                  param: '3',
                                  label: 'B1-extra',
                                  withScaffold: false,
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ]),

                  /// StatefulShellBranch class uses a Navigator Widget, so the
                  /// observer needs to be added.
                  StatefulShellBranch(observers: [
                    MedalliaDxa.routeObserver
                  ], routes: <GoRoute>[
                    GoRoute(
                      path: '/b2',
                      builder: (BuildContext context, GoRouterState state) =>
                          const TabScreen(
                        label: 'B2',
                        detailsPath: '/b2/details',
                        index: 2,
                      ),
                      routes: <RouteBase>[
                        GoRoute(
                          path: 'details',
                          builder:
                              (BuildContext context, GoRouterState state) =>
                                  const DetailsScreen(
                            param: '2',
                            label: 'B2',
                            withScaffold: false,
                          ),
                        ),
                      ],
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    /// 1. Pass the delegate. A class that extends [RouterDelegate] class.
    /// 2. Provide a callback to the SDK so it can check the name of the current
    /// route.
    MedalliaDxa.setRouterDelegateAndScreenNameCallback(
        routerDelegate: _router.routerDelegate,
        screenNameCallback: () {
          return _router
              .routerDelegate.currentConfiguration.last.matchedLocation;
        });
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    required this.children,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.scale(
        scale: 1,
        child: AnimatedBranchContainer(
          currentIndex: navigationShell.currentIndex,
          children: children,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Section A'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Section B'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

class AnimatedBranchContainer extends StatelessWidget {
  const AnimatedBranchContainer(
      {super.key, required this.currentIndex, required this.children});

  final int currentIndex;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: children.mapIndexed(
      (int index, Widget navigator) {
        return AnimatedSlide(
          offset:
              index == currentIndex ? const Offset(0, 0) : const Offset(1, 1),
          duration: const Duration(milliseconds: 300),
          child: AnimatedScale(
            scale: index == currentIndex ? 1 : 1.5,
            duration: const Duration(milliseconds: 300),
            child: AnimatedOpacity(
              opacity: index == currentIndex ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: _branchNavigatorWrapper(index, navigator),
            ),
          ),
        );
      },
    ).toList());
  }

  Widget _branchNavigatorWrapper(int index, Widget navigator) => IgnorePointer(
        ignoring: index != currentIndex,
        child: TickerMode(
          enabled: index == currentIndex,
          child: navigator,
        ),
      );
}

class RootScreenA extends StatelessWidget {
  const RootScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Root of section A'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Screen A', style: Theme.of(context).textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
            const SizedBox(
              height: 100,
            ),
            TextButton(
              onPressed: () async {
                await showDialog<void>(
                  useRootNavigator: false,
                  context: context,
                  builder: (context) => const Dialog(
                    child: SizedBox(
                      height: 300,
                      width: 100,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                              "This Dialog is pushed using Navigation 1.0, so it gets its name from the current route being used by the router"),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: const Text('show Dialog with navigation API 1.0'),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/a/custom-dialog');
              },
              child: const Text(
                'show Dialog with navigation API 2.0',
              ),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/a/details');
              },
              child: const Text('View details'),
            ),
          ],
        ),
      ),
    );
  }
}

/// The details screen for either the A or B screen.
class DetailsScreen extends StatefulWidget {
  /// Constructs a [DetailsScreen].
  const DetailsScreen({
    required this.label,
    this.param,
    this.withScaffold = true,
    super.key,
  });

  /// The label to display in the center of the screen.
  final String label;

  /// Optional param
  final String? param;

  /// Wrap in scaffold
  final bool withScaffold;

  @override
  State<StatefulWidget> createState() => DetailsScreenState();
}

/// The state for DetailsScreen
class DetailsScreenState extends State<DetailsScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.withScaffold) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Details Screen - ${widget.label}'),
        ),
        body: _build(context),
      );
    } else {
      return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: _build(context),
      );
    }
  }

  Widget _build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Details for ${widget.label} - Counter: $_counter',
              style: Theme.of(context).textTheme.titleLarge),
          const Padding(padding: EdgeInsets.all(4)),
          TextButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: const Text('Increment counter'),
          ),
          const Padding(padding: EdgeInsets.all(8)),
          const SizedBox(
            height: 200,
          ),
          const MaskWidget(child: Text('this should be masked')),
          if (widget.param != null)
            Text('Parameter: ${widget.param!}',
                style: Theme.of(context).textTheme.titleMedium),
          const Padding(padding: EdgeInsets.all(8)),
          if (!widget.withScaffold) ...<Widget>[
            const Padding(padding: EdgeInsets.all(16)),
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: const Text('< Back',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
          ],
        ],
      ),
    );
  }
}

class TabbedRootScreen extends StatefulWidget {
  const TabbedRootScreen(
      {required this.navigationShell, required this.children, super.key});

  final StatefulNavigationShell navigationShell;

  final List<Widget> children;

  @override
  State<StatefulWidget> createState() => _TabbedRootScreenState();
}

class _TabbedRootScreenState extends State<TabbedRootScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
      length: widget.children.length,
      vsync: this,
      initialIndex: widget.navigationShell.currentIndex);

  @override
  void didUpdateWidget(covariant TabbedRootScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _tabController.index = widget.navigationShell.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    final List<Tab> tabs = widget.children
        .mapIndexed((int i, _) => Tab(text: 'Tab ${i + 1}'))
        .toList();

    return Scaffold(
      appBar: AppBar(
          title: const Text('Root of Section B (nested TabBar shell)'),
          bottom: TabBar(
            controller: _tabController,
            tabs: tabs,
            onTap: (int tappedIndex) => _onTabTap(context, tappedIndex),
          )),
      body: TabBarView(
        controller: _tabController,
        children: widget.children,
      ),
    );
  }

  void _onTabTap(BuildContext context, int index) {
    widget.navigationShell.goBranch(index);
  }
}

class TabScreen extends StatelessWidget {
  const TabScreen(
      {required this.label,
      required this.detailsPath,
      required this.index,
      super.key});

  final String label;
  final int index;

  final String detailsPath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Screen $label', style: Theme.of(context).textTheme.titleLarge),
          const Padding(padding: EdgeInsets.all(4)),
          SizedBox(
            height: index * 100,
          ),
          const MaskWidget(child: Text('this should be masked')),
          TextButton(
            onPressed: () {
              GoRouter.of(context).go(detailsPath);
            },
            child: const Text('View details'),
          ),
        ],
      ),
    );
  }
}
