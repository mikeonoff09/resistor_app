import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resistor_app/config/constants/padding.dart';
import 'package:resistor_app/presentation/widgets/background_widget.dart';
import 'package:resistor_app/presentation/widgets/title_widget.dart';
import 'package:resistor_app/theme/app_theme.dart';

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
      body: const Stack(
        children: [
          BackgroundWidget(),
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
        child: const Icon(
          Icons.menu,
          size: 35,
          color: Colors.white,
        ),
      ),
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
          const SizedBox(
            height: 50,
            child: Placeholder(),
          ),
          const TitleWidget(),
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
                tabs: const <Widget>[
                  Tab(
                    text: "4 Bandas",
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
                _FourBandsView(width: width),
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

class _FourBandsView extends StatelessWidget {
  const _FourBandsView({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppPadding.extraLarge,
          ),
          child: Center(
            child: Text(
              "40 kΩ",
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.extraLarge,
          ),
          child: FourBandResistor(
            width: width - (AppPadding.extraLarge * 2),
            height: (width - (AppPadding.extraLarge * 2)) * 0.3,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppPadding.extraLarge),
          child: Center(
            child: Text(
              "* toca la banda para seleccionar color",
              style: GoogleFonts.mulish(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

const List<String> _fruitNames = <String>[
  'Apple',
  'Mango',
  'Banana',
  'Orange',
  'Pineapple',
  'Strawberry',
];

class FourBandResistor extends StatefulWidget {
  final double width;
  final double height;
  const FourBandResistor({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  State<FourBandResistor> createState() => _FourBandResistorState();
}

class _FourBandResistorState extends State<FourBandResistor> {
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int _selectedFruit = 0;
    const double _kItemExtent = 32.0;
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: widget.height * 0.10,
              width: widget.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 211, 211, 211),
              ),
            ),
          ),
          Center(
            child: Container(
              height: widget.height,
              width: widget.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 248, 243, 232),
              ),
            ),
          ),
          Positioned(
            left: widget.width * 0.20,
            child: Container(
              height: widget.height,
              width: widget.width * 0.1,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 211, 211, 211),
              ),
              child: InkWell(
                child: Container(),
                onTap: () => _showDialog(
                  CupertinoPicker(
                    magnification: 1.22,
                    squeeze: 1.2,
                    useMagnifier: true,
                    itemExtent: _kItemExtent,
                    // This sets the initial item.
                    scrollController: FixedExtentScrollController(
                      initialItem: _selectedFruit,
                    ),
                    // This is called when selected item is changed.
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        _selectedFruit = selectedItem;
                      });
                    },
                    children:
                        List<Widget>.generate(_fruitNames.length, (int index) {
                      return Center(child: Text(_fruitNames[index]));
                    }),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: widget.width * 0.35,
            child: Container(
              height: widget.height,
              width: widget.width * 0.1,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 211, 211, 211),
              ),
            ),
          ),
          Positioned(
            left: widget.width * 0.50,
            child: Container(
              height: widget.height,
              width: widget.width * 0.1,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 211, 211, 211),
              ),
            ),
          ),
          Positioned(
            left: widget.width * 0.70,
            child: Container(
              height: widget.height,
              width: widget.width * 0.1,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 211, 211, 211),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
