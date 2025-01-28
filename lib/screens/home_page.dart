import 'package:alzpal/components/side_nav.dart';
import 'package:alzpal/screens/gps_tracking_screen.dart';
import 'package:alzpal/screens/reminders_screen.dart';
import 'package:alzpal/utils/contants.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  static final List<Widget> _widgetOptions = <Widget>[
    RemindersScreen(),
    GPSTrackingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        title: const Text(
          "AlzPal",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _widgetOptions.length,
              itemBuilder: (context, index) {
                return _widgetOptions[index];
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: primaryColor,
        items: <TabItem>[
          const TabItem(
            icon: Icons.notifications,
            title: 'Reminders',
          ),
          const TabItem(icon: Icons.gps_fixed, title: 'Locate'),
        ],
        onTap: (int index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
          );
          setState(() {
            _currentPage = index;
          });
        },
        initialActiveIndex: _currentPage,
        style: TabStyle.reactCircle,
        height: 60,
      ),
    );
  }
}
