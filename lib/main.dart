import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homepagescreen.dart';
import './couponpagescreen.dart';
import './mapscreen.dart';
import './profilepagescreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: true,
      systemNavigationBarColor: Colors.green,
      systemNavigationBarDividerColor: Colors.green,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
  int _index = 0;

  final _screens = [
    const HomePageScreen(),
    const MapScreen(),
    const CouponPageScreen(),
    const ProfilePageScreen()
  ];

  void _onTabTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
          enableFeedback: false,
          onTap: _onTabTapped,
          currentIndex: _index,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.green,
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.energy_savings_leaf, size: 40),
                label: 'HomePage',
                backgroundColor: Colors.transparent),
            BottomNavigationBarItem(
                icon: Icon(Icons.map, size: 40),
                label: 'MapPage',
                backgroundColor: Colors.transparent),
            BottomNavigationBarItem(
                icon: Icon(Icons.discount, size: 40),
                label: 'CouponPage',
                backgroundColor: Colors.transparent),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 40),
                label: 'ProfilePage',
                backgroundColor: Colors.transparent)
          ]),
    );
  }
}
