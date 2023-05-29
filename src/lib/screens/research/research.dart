import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Research extends StatelessWidget {
  Research({super.key});
  final Uri magentURL = Uri.parse("https://team.inria.fr/magnet/");
  final Uri mperrotURL = Uri.parse("https://mperrot.github.io/");
  final Uri blebarsURL = Uri.parse("https://batistelb.github.io/");
  final Uri alphaGoURL = Uri.parse(
      "https://www.deepmind.com/research/highlighted-research/alphago");
  final Uri twoMinutesPaperURL =
      Uri.parse("https://www.youtube.com/channel/UCbfYPyITQ-7l4upoX8nvctg");

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
              "Research",
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
                    text: "I am currently a research intern at INRIA Lille"
                        " in the "),
                TextSpan(
                    text: "MAGNET team",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _launchUrl(magentURL)),
                const TextSpan(
                    text:
                        ", and I am working on \"Fully decentralized learning under group fairness"
                        " and heterogeneity constraints\" under the supervision"
                        " of: "),
                TextSpan(
                    text: "Michaël Perrot",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _launchUrl(mperrotURL)),
                const TextSpan(text: " and "),
                TextSpan(
                    text: "Batiste Le Bars",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _launchUrl(blebarsURL)),
                const TextSpan(text: " \n")
              ])),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Text(
              "Interests",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: Colors.black),
            ),
          ),
          const Text(
              "I am interested in research related to machine learning algorithms"
              " and I am still exploring different fields to see what stimulate my curiosity the most\n"),
          RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                const TextSpan(text: "It was "),
                TextSpan(
                    text: "DeepMind's AlphaGo",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _launchUrl(alphaGoURL)),
                const TextSpan(text: " and "),
                TextSpan(
                    text: "Two Minute Papers",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _launchUrl(twoMinutesPaperURL)),
                const TextSpan(
                    text: " that first got me hooked on ML applications"),
              ])),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, bottom: 20),
            child: Text(
              "Publications",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: Colors.black),
            ),
          ),
          const Text("Coming soon ! (Hopefully ^^')"),
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
