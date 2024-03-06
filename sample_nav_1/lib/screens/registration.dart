import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
        appBar: AppBar(
          title: const Text('RegistrationScreen'),
        ),
        body: PageView(
          controller: controller,
          children: [
            PageViewStep1(controller: controller),
            PageViewStep2(controller: controller),
          ]
              .map((e) => Center(
                      child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: e,
                  )))
              .toList(),
        ));
  }
}

class PageViewStep1 extends StatelessWidget {
  const PageViewStep1({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Step 1'),
        const SizedBox(
          height: 32,
        ),
        const TextField(
          decoration: InputDecoration(hintText: 'Enter your email'),
        ),
        const TextField(
          decoration: InputDecoration(hintText: 'Enter your password'),
        ),
        const Spacer(),
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
              child: const Icon(Icons.keyboard_arrow_right)),
        )
      ],
    );
  }
}

class PageViewStep2 extends StatelessWidget {
  const PageViewStep2({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Step 2'),
        const SizedBox(
          height: 32,
        ),
        const TextField(
          decoration: InputDecoration(hintText: 'Confirm your password'),
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home_screen', ((route) => false));
            },
            child: const Text('Register')),
        const Spacer(),
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
              child: const Icon(Icons.keyboard_arrow_left)),
        )
      ],
    );
  }
}
