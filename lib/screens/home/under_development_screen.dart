import 'package:flutter/material.dart';
class UnderDevelopmentScreen extends StatefulWidget {
  const UnderDevelopmentScreen({super.key});

  @override
  State<UnderDevelopmentScreen> createState() => _UnderDevelopmentScreenState();
}

class _UnderDevelopmentScreenState extends State<UnderDevelopmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Under Development'),
      ),
    );
  }
}
