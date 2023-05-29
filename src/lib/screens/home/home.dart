import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Uri polytechnicienProgramURL = Uri.parse(
      "https://programmes.polytechnique.edu/en/ingenieur-polytechnicien-program/ingenieur-polytechnicien-program");
  final Uri resumeURI = Uri.parse("https://minoaxl.github.io/resume.pdf");

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
              "About Me",
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
                        "I am a third year student at Ecole Polytechnique in the "),
                TextSpan(
                    text: "Ingénieur Polytechnicien program",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _launchUrl(polytechnicienProgramURL)),
                const TextSpan(
                    text:
                        " and I am majoring in applied mathematics (PA MAP)\n"),
              ])),
          const Text(
              "I will be doing a masters M2 next academic year (2023 - 2024) in mathematics, "
              "vision and machine learning (MVA) at ENS Paris-Saclay\n"),
          const Text(
              "I am looking to do a PhD, by the end of the next academic year, in"
              " Machine Learning or a related field\n\n"),
          RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                const TextSpan(
                    text:
                        "You can find more about my academic background bellow, "
                        "or take a look at my "),
                TextSpan(
                    text: "CV",
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _launchUrl(resumeURI)),
                const TextSpan(text: " for more details :)")
              ])),
          const SizedBox(
            height: 200,
          ),
          Text(
            "A short Curriculum vitae",
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Education",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          "2020 - 2024: Ecole Polytechnique, Engineering degree (specialization in Applied Mathematics)"),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          "2018 - 2020: Lycée d'Excellence de Bneguerir (Lydex), CPGE MPSI - MP*"),
                    )
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Internships",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          Text("2023: Research intern at INRIA (MAGNET team)"),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("2022: Research intern at ReciTAL"),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          Text("2021: Software engineer intern at Freterium"),
                    ),
                  ],
                ),
              ),
            ],
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
