import 'dart:math';

import 'package:flutter/material.dart';
import 'package:img/img.dart';

const primary = Color(0xFFE6A6BE);

const _messages = [
  'Are you certain?',
  'Are you positive about that?',
  'Do you mean it?',
  'Is that correct?',
  'Are you confident about this?',
  'Can you confirm that?',
  'Is that really the case?',
  'Are you absolutely sure?',
  'Do you stand by that?',
  'Is there no doubt?',
  'Are you sure about it?',
  'Can you double-check?',
];

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primary,
      body: Center(child: _ValentineCard()),
    );
  }
}

class _ValentineCard extends StatefulWidget {
  const _ValentineCard();

  @override
  State<_ValentineCard> createState() => _ValentineCardState();
}

class _ValentineCardState extends State<_ValentineCard> {
  bool hasAccepted = false;
  bool dialogShown = false;

  int? lastMessageIndex;
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: SizedBox(
          width: double.infinity,
          child: Card(
            key: ValueKey(hasAccepted),
            child: Padding(
              padding: const .all(24),
              child: Column(
                mainAxisSize: .min,
                children: hasAccepted
                    ? [
                        Text(
                          'YAY!!!',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const Animg.asset(
                          asset: 'assets/yay.json',
                          height: 350,
                        ),
                      ]
                    : [
                        const Animg.asset(
                          asset: 'assets/heart.json',
                          height: 150,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Selina, will you be my valentine?',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 48),
                        Row(
                          mainAxisSize: .min,
                          children: [
                            FilledButton(
                              onPressed: () {
                                setState(() {
                                  hasAccepted = true;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Yes',
                                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(width: 64),
                            OutlinedButton(
                              onPressed: () => showConfirmation(context),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'No',
                                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showConfirmation(BuildContext context) {
    if (dialogShown) {
      Navigator.of(context).pop();
    }
    final message = _messages[_selectMessage(lastMessageIndex)];
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        dialogShown = true;
        return AlertDialog(
          title: const Text('Hmmm!'),
          content: Text(message),

          actions: [
            TextButton(
              onPressed: () => showConfirmation(context),
              child: const Text('Yeah'),
            ),
            TextButton(
              onPressed: () {
                dialogShown = false;
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  int _selectMessage([int? last]) {
    if (last == null) {
      return random.nextInt(_messages.length);
    }

    int index = random.nextInt(_messages.length - 1);

    if(index >= last) {
      index++;
    }

    return index;
  }
}
