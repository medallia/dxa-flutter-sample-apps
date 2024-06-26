import 'package:flutter/material.dart';

class PopupsScreen extends StatelessWidget {
  const PopupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popups screen')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  await showDialog(
                    routeSettings: const RouteSettings(name: 'Alert Dialog'),
                    context: context,
                    builder: ((context) => AlertDialog(
                          title: const Text('Alert Dialog'),
                          content: const Text('Your content'),
                          actions: [
                            TextButton(
                              child: const Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        )),
                  );
                },
                child: const Text('open dialog')),
            const Divider(
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
