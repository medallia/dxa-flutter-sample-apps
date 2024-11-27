import 'package:flutter/material.dart';
import 'package:medallia_dxa/medallia_dxa.dart';

class MaskingScreen extends StatelessWidget {
  const MaskingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Masking screen')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('''For manual Masking, just wrap the widget.'''),
            ColoredBox(
                color: Colors.blue.shade100,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Unmasked widget'),
                )),

            ///You shouldn't see the red box in the Session replay,
            ///but the green box should be visible
            ColoredBox(
              color: Colors.green.shade100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaskWidget(
                  child: ColoredBox(
                    color: Colors.red.shade100,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Masked widget'),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 2,
            ),

            const Divider(
              thickness: 2,
            ),
            const Text(
                "Dropdowns are Dialog Routes, so a new screen will start when the dropdown is opened."),
            DropdownButton(
              items: <String>[
                'Option 1',
                'Option 2',
                'Option 3',
              ].map((val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Container(
                      color: Colors.white,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            val,
                            maxLines: 2,
                            semanticsLabel: '...',
                            overflow: TextOverflow.ellipsis,
                          ))),
                );
              }).toList(),
              onChanged: (val) {},
              value: 'Option 1',
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              elevation: 0,
            ),
            const Divider(
              thickness: 2,
            ),
          ]
              .map((e) => Padding(
                    padding: const EdgeInsets.all(16),
                    child: e,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
