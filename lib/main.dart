import 'package:flutter/material.dart';
import 'package:news_app/onboarding.dart';

main(){
  runApp( NewsApp() );
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }

}