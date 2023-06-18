import 'package:camera/camera.dart';
import 'package:ecorewards/screens/transactionlistscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'screens/homepagescreen.dart';
import 'screens/couponpagescreen.dart';
import 'screens/mapscreen.dart';
import 'screens/profilepagescreen.dart';
import './widgets/customappbar.dart';

late List<CameraDescription> _cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: true,
      systemNavigationBarColor: Colors.green,
      systemNavigationBarDividerColor: Colors.green,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));

  _cameras = await availableCameras();

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
        fontFamily: 'MadeTommy',
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
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        iconSize: 40,
        icon: const Icon(Icons.energy_savings_leaf),
        activeColorPrimary: Colors.yellow,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        iconSize: 40,
        icon: const Icon(Icons.map_rounded),
        activeColorPrimary: Colors.yellow,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        iconSize: 35,
        icon: const Icon(Icons.discount),
        activeColorPrimary: Colors.yellow,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        iconSize: 40,
        icon: const Icon(Icons.person),
        activeColorPrimary: Colors.yellow,
        inactiveColorPrimary: Colors.white,
      ),
    ];
  }

  final _screens = [
    HomePageScreen(cameras: _cameras),
    const MapScreen(),
    const CouponPageScreen(),
    const ProfilePageScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        controller: _controller, screens: _screens, items: _navBarsItems());
  }
}
