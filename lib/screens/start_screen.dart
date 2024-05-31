import 'package:boutoratakpa_cc_project/screens/acceuil_screen.dart';
import 'package:boutoratakpa_cc_project/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    Duration duration = Duration(seconds: 56);

    method();
    // Future.delayed(duration, method);

    super.initState();
  }

  void method() async {
// Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    int counter = prefs.getInt('counter') ?? 0;

    counter++;

    await prefs.setInt('counter', counter);

    print(counter);

    navigateHome(counter == 1);
  }

  void navigateHome(bool firstNav) {
    if (firstNav) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Acceuil()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 204, 2),
        body: Center(
          child: Container(
            margin: EdgeInsets.only(right: 8),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset(
                    "assets/icons/taga_logo.png",
                    width: 100,
                  ),
                ),
                Text(
                  "Taga ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 147, 70, 194),
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: SizedBox(
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
