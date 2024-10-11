import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Research extends StatelessWidget {
  Research({super.key});
  final Uri lognormaltURL = Uri.parse("https://arxiv.org/abs/2409.15119v2");
  final Uri magentURL = Uri.parse("https://team.inria.fr/magnet/");
  final Uri mperrotURL = Uri.parse("https://mperrot.github.io/");
  final Uri blebarsURL = Uri.parse("https://batistelb.github.io/");
  final Uri alphaGoURL = Uri.parse(
      "https://www.deepmind.com/research/highlighted-research/alphago");
  final Uri twoMinutesPaperURL =
      Uri.parse("https://www.youtube.com/channel/UCbfYPyITQ-7l4upoX8nvctg");
  final Uri decentralizedFairnessReportURI = Uri.parse(
      "https://ilabiad.github.io/Fairness_in_Decentralized_Learning.pdf");
  final Uri aiImagesDetectionURI =
      Uri.parse("https://ilabiad.github.io/AI_Images_Detection.pdf");

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
                    text: "2024 : I am currently doing an internship at Meta"
                        " FAIR in Paris. I am working on black-box adversarial"
                        " attacks and the integration of their detection for"
                        " AI generated images detection. "),
                TextSpan(
                    text: "paper",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _launchUrl(lognormaltURL)),
                const TextSpan(text: ". \n"),
                const TextSpan(
                    text: "I've also explored the"
                        " use of text watermarking on images via quantization. "),
                TextSpan(
                    text: "report",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _launchUrl(aiImagesDetectionURI)),
              ])),
          const SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                const TextSpan(
                    text: "2023 : I've finished an internship at INRIA Lille"
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
                        ", where I worked on \"Fully decentralized learning under group fairness"
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
                const TextSpan(
                    text: ". The report summarizing my work can be"
                        " found "),
                TextSpan(
                    text: "here",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => _launchUrl(decentralizedFairnessReportURI)),
                const TextSpan(text: ". \n"),
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
              " and I am still exploring different fields to see what stimulate my curiosity the most.\n"),
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
                    text: " that first got me hooked on ML applications."),
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
          const Text("My first (of many!) paper on arXiv :"),
          RichText(
            text: TextSpan(
                text:
                    "Log-normal Mutations and their Use in Detecting Surreptitious Fake Images",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => _launchUrl(lognormaltURL)),
          ),
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
