import 'package:decibel_sdk/decibel_sdk.dart';
import 'package:dxa_flutter_sample_app/main.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return ScreenWidget(
      screenName: 'registration_screen',
      child: Scaffold(
          appBar: AppBar(
            title: const Text('RegistrationScreen'),
          ),
          body: PageView(
            controller: controller,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Step 1'),
                  SizedBox(
                    height: 32,
                  ),
                  const TextField(
                    decoration: InputDecoration(hintText: 'Enter your email'),
                  ),
                  const TextField(
                    decoration:
                        InputDecoration(hintText: 'Enter your password'),
                  ),
                  Spacer(),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: ElevatedButton(
                        onPressed: () {
                          controller.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Icon(Icons.keyboard_arrow_right)),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Step 2'),
                  SizedBox(
                    height: 32,
                  ),
                  const TextField(
                    decoration:
                        InputDecoration(hintText: 'Confirm your password'),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/home_screen', ((route) => false));
                      },
                      child: const Text('Register')),
                  Spacer(),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: ElevatedButton(
                        onPressed: () {
                          controller.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Icon(Icons.keyboard_arrow_left)),
                  )
                ],
              ),
            ]
                .map((e) => Center(
                        child: Padding(
                      padding: EdgeInsets.all(32),
                      child: e,
                    )))
                .toList(),
          )),
    );
  }
}
