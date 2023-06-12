import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/homepagescreen.dart';
import 'screens/couponpagescreen.dart';
import 'screens/mapscreen.dart';
import 'screens/profilepagescreen.dart';
import './widgets/bottomnavbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        bottomNavigationBar:
            BottomNavBar(index: _index, onTabTapped: _onTabTapped));
  }
}
