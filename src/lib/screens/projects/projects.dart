import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatelessWidget {
  Projects({super.key});
  final Uri webSiteRepoURL =
      Uri.parse("https://github.com/minoaxl/minoaxl.github.io");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              "Projects",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                const TextSpan(
                    text:
                        "For starters this website, that I coded from scratch using Flutter"
                        ". Source code, can be found "),
                TextSpan(
                    text: "here",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _launchUrl(webSiteRepoURL)),
                const TextSpan(
                    text:
                        ".\nHope you like the Moroccan Zellige desing in the background."
                        " It can be disabled by toggling the button in the top right corner\n")
              ])),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
