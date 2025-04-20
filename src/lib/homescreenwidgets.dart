import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class PagesButtons extends StatefulWidget {
  const PagesButtons({
    super.key,
    required this.pages,
    required this.callback,
    required this.mouseHighlightCallBack,
    required this.isMobile,
  });

  final void Function(int) callback;
  final void Function(bool) mouseHighlightCallBack;
  final List<String> pages;
  final bool isMobile;

  @override
  State<PagesButtons> createState() => _PagesButtonsState();
}

class _PagesButtonsState extends State<PagesButtons> {
  int _currentIndex = -1;
  bool mouseHighlightOn = true;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: widget.isMobile ? 6 : 30),
          ),
          if (widget.isMobile)
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ...List<Widget>.generate(
              widget.pages.length,
              (index) => InkWell(
                    onHover: (value) {
                      setState(() {
                        if (value) {
                          _currentIndex = index;
                        } else {
                          _currentIndex = -1;
                        }
                      });
                    },
                    onTap: () => widget.callback(index),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(
                                widget.isMobile ? 6 : 20,
                                widget.isMobile ? 0 : 30,
                                widget.isMobile ? 6 : 20,
                                widget.isMobile ? 0 : 8),
                            child: Text(
                              widget.pages[index],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: widget.isMobile ? 12 : 26,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        buildDot(index: index),
                      ],
                    ),
                  )),
          const Spacer(),
          InkWell(
            onTap: () {
              setState(() {
                mouseHighlightOn = !mouseHighlightOn;
              });
              widget.mouseHighlightCallBack(mouseHighlightOn);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      widget.isMobile ? 4 : 20,
                      widget.isMobile ? 0 : 15,
                      widget.isMobile ? 4 : 20,
                      widget.isMobile ? 0 : 10),
                  child: Text(
                    mouseHighlightOn
                        ? "Disable mouse\n      highlight"
                        : "Enable mouse\n     highlight",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: widget.isMobile ? 10 : 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: widget.isMobile ? 8 : 40,
          )
        ]);
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      height: 4,
      width: _currentIndex == index ? 60 : 0,
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
      ),
    );
  }
}

class ImageAndContact extends StatelessWidget {
  ImageAndContact({super.key});

  final String myImagePath = "assets/my_picture_low_quality.png";
  final String githubImagePath = "assets/github_logo.png";
  final Uri _githubURL = Uri.parse("https://github.com/ilabiad");
  final String linkedinImagePath = "assets/linkedin_logo.png";
  final Uri _linkedinURL =
      Uri.parse("https://www.linkedin.com/in/ismail-labiad-130287214/");
  final String email = "Ag4WGg4XDBAfBB0HJR4DDh0fQRAKDg==";
  final String secretkey = "notsosecretkey";
  final double iconWidth = 20;
  final double iconHeight = 20;
  final Size myImageSize = const Size(4 * 60, 5 * 60);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(75.0),
          child: SizedBox(
              width: myImageSize.width,
              height: myImageSize.height,
              child: Image(image: AssetImage(myImagePath))),
        ),
        Text(
          "Ismail Labiad",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.mail,
                  size: iconWidth,
                ),
                Padding(padding: EdgeInsets.only(left: iconWidth * 0.2)),
                InkWell(
                    onTap: () => Clipboard.setData(
                                ClipboardData(text: decrypt(email, secretkey)))
                            .then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 2),
                                  content: Text(
                                      "Email address copied to clipboard")));
                        }),
                    child: const Text("email"))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    width: iconWidth,
                    height: iconHeight,
                    child: Image(image: AssetImage(linkedinImagePath))),
                Padding(padding: EdgeInsets.only(left: iconWidth * 0.2)),
                InkWell(
                    onTap: () => _launchUrl(_linkedinURL),
                    child: const Text("Linkedin"))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    width: iconWidth,
                    height: iconHeight,
                    child: Image(image: AssetImage(githubImagePath))),
                Padding(padding: EdgeInsets.only(left: iconWidth * 0.2)),
                InkWell(
                    onTap: () => _launchUrl(_githubURL),
                    child: const Text("Github"))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        )
      ],
    );
  }

  String decrypt(String text, String key) {
    List<int> encryptedBytes = base64.decode(text);
    List<int> keyBytes = utf8.encode(key);

    List<int> decryptedBytes = List<int>.generate(
      encryptedBytes.length,
      (i) => encryptedBytes[i] ^ keyBytes[i % keyBytes.length],
    );

    return utf8.decode(decryptedBytes);
  }

  String encrypt(String text, String key) {
    List<int> textBytes = utf8.encode(text);
    List<int> keyBytes = utf8.encode(key);

    List<int> encryptedBytes = List<int>.generate(
      textBytes.length,
      (i) => textBytes[i] ^ keyBytes[i % keyBytes.length],
    );

    return base64.encode(encryptedBytes);
  }

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
