import 'package:flutter/material.dart';
import './page1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import './screens/registrazione.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController _controller = PageController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              children: const [
                Page1(
                  "Earn for every Referal ",
                  "images/boba-wealth",
                  Color.fromARGB(255, 255, 255, 255),
                ),
                Page1(
                  "Send Money Fast",
                  "images/1.png",
                  Color.fromARGB(255, 255, 255, 255),
                ),
                Page1(
                  "Over 50 Countries",
                  "images/martina-guy-sends-a-message-from-phone.png",
                  Color.fromARGB(255, 255, 255, 255),
                ),
              ],
            ),
            SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Spacer(),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        fixedSize: const Size(250.0, 40.0),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => RegisterScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        fixedSize: const Size(250.0, 40.0),
                      ),
                      child: const Text(
                        "SignUp",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
