import 'package:blc_st_mgmt_clean_archit/config/components/internet_exception_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InternetExceptionWidget(
        onPress: () {},
      ),
    );
  }
}
