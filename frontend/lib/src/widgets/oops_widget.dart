import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OopsWidget extends StatelessWidget {
  final String? text;
  final VoidCallback? onTryAgain;

  const OopsWidget({super.key, this.text, this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: FaIcon(
                FontAwesomeIcons.faceFrownOpen,
                size: 48,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.87),
              ),
            ),
            Text(
              text ?? "Oops! Something went wrong...",
              style: const TextStyle(color: Colors.black54, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            if (onTryAgain != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed: onTryAgain,
                  child: const Text(
                    "Try again",
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
