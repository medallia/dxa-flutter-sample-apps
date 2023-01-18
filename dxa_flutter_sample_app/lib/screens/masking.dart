import 'package:decibel_sdk/decibel_sdk.dart';
import 'package:flutter/material.dart';

class MaskingScreen extends StatelessWidget {
  const MaskingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      screenName: 'masking_screen',

      ///To disable automasking in this screen change to true. All manual
      ///masking will still work.
      enableAutomaticMasking: true,

      ///To disable the recording of popups that are launched from this screen,
      ///change enableAutomaticPopupRecording to false. Any popup (showDialog, Dropdowns, TimePickers...) will
      ///not be recorded.
      enableAutomaticPopupRecording: true,
      child: Scaffold(
        appBar: AppBar(title: Text('Masking screen')),
        body: Column(
          children: [
            const Text('''For manual Masking, just wrap the widget.'''),
            ColoredBox(
                color: Colors.blue.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Masked widget'),
                    ),
                  ),
                ),
              ),
            ),

            Divider(
              thickness: 2,
            ),
            const Text(
                "Masking for widgets that can't we wrapped: use the parameter enableAutomaticPopupRecording to mask them. These are usually widgets launched in a PopupRoute: showAboutDialog, showMenu showDatePicker showTimePicker. In this example, we are using a DropdownButton."),

            ///When the dropdown is opened it will be recorded, if you would
            ///like to mask the options change enableAutomaticPopupRecording
            ///to false

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
              icon: Icon(Icons.keyboard_arrow_down),
              elevation: 0,
            ),
          ]
              .map((e) => Padding(
                    padding: EdgeInsets.all(16),
                    child: e,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
