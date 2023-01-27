import 'package:flutter/material.dart';
import 'package:todo_app_mobile/widgets/homeWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeWidget(),
    );
  }
}
