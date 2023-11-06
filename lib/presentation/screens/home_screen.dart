import 'package:flutter/material.dart';
import 'package:resistor_app/presentation/widgets/widgets.dart';
import 'package:resistor_app/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return const Scaffold(
      body: Stack(
        children: [
          BackgroundWidget(),
          _CalculatorWidget(),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: AppTheme().themeData.primaryColor,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(30),
      //   ),
      //   child: const Icon(
      //     Icons.menu,
      //     size: 35,
      //     color: Colors.white,
      //   ),
      // ),
    );
  }
}

class _CalculatorWidget extends StatelessWidget {
  const _CalculatorWidget();

  @override
  Widget build(BuildContext context) {
    var padding = MediaQueryData.fromView(View.of(context)).padding;
    final width = MediaQueryData.fromView(View.of(context)).size.width;

    return DefaultTabController(
      length: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: padding.top),
          const SizedBox(height: 25),
          // const SizedBox(
          //   height: 50,
          //   child: Row(
          //     children: [
          //       Spacer(),
          //       Padding(
          //         padding: EdgeInsets.only(right: 16.0),
          //         child: Icon(Icons.candlestick_chart),
          //       ),
          //     ],
          //   ),
          // ),
          const TitleWidget(),
          const SizedBox(height: 25),
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
                indicator: BoxDecoration(
                  color: AppTheme().themeData.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                labelColor: Colors.white,
                dividerColor: Colors.transparent,
                tabs: <Widget>[
                  Tab(
                    text: "4 ${AppLocalizations.of(context)?.bands ?? ''}",
                  ),
                  // Tab(
                  //   text: "5 Bandas",
                  // ),
                  // Tab(
                  //   text: "6 Bandas",
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                FourBandsView(width: width),
                // const Center(
                //   child: Text("It's rainy here"),
                // ),
                // const Center(
                //   child: Text("It's sunny here"),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
