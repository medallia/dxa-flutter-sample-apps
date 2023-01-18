import 'package:decibel_sdk/decibel_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PopupsScreen extends StatelessWidget {
  const PopupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Popups screen')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: ((context) => ScreenWidget.popup(
                          screenName: "alert_dialog_popup",
                          child: AlertDialog(
                            title: const Text('Alert Dialog'),
                            content: Text('Your content'),
                            actions: [
                              TextButton(
                                child: const Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        )),
                  );
                },
                child: Text('open dialog')),
            Divider(
              thickness: 2,
            ),
            Text(
                'When this dialog is launched, an assertion error will be thrown due to it not being correctly implemented.'),
            ElevatedButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: ((context) => ScreenWidget(
                          screenName: "alert_dialog_popup",
                          child: AlertDialog(
                            title: const Text('Alert Dialog'),
                            content: Text('Your content'),
                            actions: [
                              TextButton(
                                child: const Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        )),
                  );
                },
                child: Text('open wrongly implemented dialog'))
          ],
        ),
      ),
    );
  }
}
