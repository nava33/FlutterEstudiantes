import 'package:flutter/material.dart';
import 'package:sii_patm/pages/login.dart';
class MyNavigator {
  static void goLogin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => new LoginPage()));
  }

  static void goDashBoard(BuildContext context){
    //Navigator.pushNamed(context, "/dashboard");
    Navigator.of(context) .pushNamedAndRemoveUntil("/dashboard", (Route<dynamic> route) => false);
  }

  static void goMenuOptions(BuildContext context, String route){
    Navigator.pushNamed(context, route);
  }
  
  static void goToSendMail(BuildContext context, String route){
    Navigator.pushNamed(context, route);
  }

  static void goToDashBoardTeach(BuildContext context){
    Navigator.of(context) .pushNamedAndRemoveUntil("/dashboardteach", (Route<dynamic> route) => false);
  }

  static void goToAlumnos(BuildContext context){
    Navigator.pushNamed(context, "/alumnos");
  }

  static void goToCalifciaciones(BuildContext context){
    Navigator.pushNamed(context, "/calificaciones");
  }
  /*
  static void goToIntro(BuildContext c  ontext) {
    Navigator.pushNamed(context, "/intro");
  }
  */
}