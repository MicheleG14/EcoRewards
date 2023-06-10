import 'package:flutter/material.dart';
import '../widgets/ecorewardslogo.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({super.key});

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [EcoRewardsLogo()],
    );
  }
}
