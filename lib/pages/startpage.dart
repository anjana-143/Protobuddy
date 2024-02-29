import 'dart:async';
import 'package:flutter/material.dart';
import 'package:protobuddy/database/firebase.dart';
import 'package:protobuddy/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      checkAuth();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: black,
      body: Center(
        child: CircularProgressIndicator(
          color: white,
        ),
      ),
    );
  }
}