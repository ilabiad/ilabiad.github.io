import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'screens/home/home.dart';
import 'screens/projects/projects.dart';
import 'screens/research/research.dart';
import 'homescreenwidgets.dart';

void main() {
  runApp(const MyApp());
}

ThemeData themeData = ThemeData(
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
        titleLarge: TextStyle(fontSize: 38, color: Colors.black)));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ismail Labiad',
      theme: themeData,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String backgroundImagePath = "assets/traditional_moroccan_zellige.jpg";
  int _currentIndex = 0;
  late final ScrollController _scrollController;
  double _barHeight = 0;
  final double horizontalBarHeight = 30.0;
  double _offset = 0;
  late Size size;
  double x = 0.0;
  double y = 0.0;
  double radius = 0.0;
  double initRadius = 0.4;
  final double maxRadius = 0.4;

  List<String> pagesNames = ["Home", "Research", "Projects"];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(setBarHeigh);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: (event) => _changeRadius(initRadius),
      onExit: (event) => _changeRadius(0),
      onHover: (details) => _updateLocation(details, size),
      child: Stack(children: [
        SizedBox(
          width: size.width, // Set the desired width
          height: size.height, // Set the desired height

          child: ShaderMask(
            blendMode: BlendMode
                .dstIn, // Set the blend mode to reveal the background image
            shaderCallback: (Rect bounds) => radialGradientShader(bounds),
            child: Image.asset(
                backgroundImagePath, // Replace with your actual image path
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.multiply,
                color: Colors
                    .white // Adjust the fitting of the image within the container
                ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * 0.15,
                  child: PagesButtons(
                    pages: pagesNames,
                    callback: setCurrentIndex,
                    mouseHighlightCallBack: mouseHighlight,
                  ),
                ),
                SizedBox(
                  //alignment: Alignment.center,
                  width: size.width,
                  height: horizontalBarHeight,
                  child: Container(
                    width: size.width,
                    height: 3,
                    decoration: const BoxDecoration(color: Colors.black),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      margin: EdgeInsets.only(top: _offset),
                      width: size.width * 0.25,
                      child: ImageAndContact(),
                    ),
                    Container(
                      height: _barHeight > 0
                          ? _barHeight
                          : size.height * 0.85 - horizontalBarHeight,
                      width: 3,
                      decoration: const BoxDecoration(color: Colors.black),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: size.width * 0.7,
                      child: IndexedStack(
                          index: _currentIndex,
                          children: [Home(), Research(), Projects()]),
                    )
                  ],
                )
              ],
            ),
          ),
          floatingActionButton: Visibility(
            visible: _barHeight > 0,
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey,
              onPressed: scrollUp,
              child: const Icon(Icons.arrow_upward),
            ),
          ),
        ),
      ]),
    );
  }

  void mouseHighlight(bool on) {
    if (on) {
      initRadius = maxRadius;
      radius = initRadius;
    } else {
      setState(() {
        radius = 0;
        initRadius = 0;
      });
    }
  }

  void _updateLocation(PointerEvent details, Size size) {
    setState(() {
      x = details.position.dx - size.width * 0.5;
      y = details.position.dy - size.height * 0.5;
    });
    //print("x= $x, y= $y");
  }

  void _changeRadius(double r) {
    setState(() {
      radius = r;
    });
  }

  Shader radialGradientShader(Rect bounds) {
    return RadialGradient(
      radius: radius,
      colors: const [Color.fromARGB(100, 0, 0, 0), Colors.transparent],
      stops: const [0.0, 0.9],
    ).createShader(Rect.fromLTWH(x, y, bounds.width, bounds.height));
  }

  void scrollUp() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.minScrollExtent);
      setState(() {
        _barHeight = 0;
        _offset = 0;
      });
    }
  }

  void setBarHeigh() {
    if (_scrollController.hasClients) {
      setState(() {
        _offset =
            _scrollController.offset > size.height * 0.15 + horizontalBarHeight
                ? _scrollController.offset -
                    (size.height * 0.15 + horizontalBarHeight)
                : 0;
        _barHeight = _scrollController.offset > 0
            ? size.height * 0.85 -
                horizontalBarHeight +
                _scrollController.offset
            : 0;
      });
    }
  }

  void setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
