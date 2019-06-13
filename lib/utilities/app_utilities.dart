import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<bool> isLoggedIn() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool isLoggedIn = sharedPreferences.getBool( "isloggedin" );
  if( isLoggedIn == null || isLoggedIn == false){
    return false;
  }
  return true;
}