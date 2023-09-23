import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resistor_app/theme/app_theme.dart';
import 'dart:math';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String name = "home_screen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _HomeView());
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: const Stack(
        children: [
          _BackgroundWidget(),
          _CalculatorWidget(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppTheme().themeData.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Icon(Icons.menu, size: 35,color: Colors.white,),
      ),
    );
  }
}

class _CalculatorWidget extends StatelessWidget {
  const _CalculatorWidget();

  @override
  Widget build(BuildContext context) {
    var padding = MediaQueryData.fromView(View.of(context)).padding;

    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: padding.top),
          const SizedBox(
            height: 50,
            child: Placeholder(),
          ),
          const _TitleWidget(),
          Center(
            child: Container(
              width: 300,
              height: 46,
              padding: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme().themeData.shadowColor.withOpacity(.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Colors.black54,
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                // isScrollable: true,
                indicator: BoxDecoration(
                  color: AppTheme().themeData.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                labelColor: Colors.white,
                dividerColor: Colors.transparent,
                tabs: const <Widget>[
                  Tab(
                    text: "4 Bandas",
                  ),
                  Tab(
                    text: "5 Bandas",
                  ),
                  Tab(
                    text: "6 Bandas",
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: <Widget>[
                Center(
                  child: Text("It's cloudy here"),
                ),
                Center(
                  child: Text("It's rainy here"),
                ),
                Center(
                  child: Text("It's sunny here"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 16,
      ),
      child: Text(
        "Resistor Color Calculator",
        style: GoogleFonts.mulish(
            fontSize: 40,
            fontWeight: FontWeight.w800,
            color: Colors.white.withAlpha(200)),
      ),
    );
  }
}

class _BackgroundWidget extends StatelessWidget {
  const _BackgroundWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme().themeData.primaryColor,
      height: 245,
      child: Stack(
        children: [
          Positioned(
            top: -50,
            left: 200,
            child: Transform.rotate(
              angle: 5 * pi / 6,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color.fromARGB(100, 107, 93, 228),
                ),
                width: 400,
                height: 170,
              ),
            ),
          ),
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                color: Color.fromARGB(50, 63, 52, 147),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
