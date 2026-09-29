import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'Login Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Controllers let us read what the user typed
  late TextEditingController _loginController;
  late TextEditingController _passwordController;

  // NEW: which picture to show. Starts as the question mark.
  var imageSource = "images/question-mark.png";

  @override
  void initState() {
    super.initState();
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Runs when the Login button is pressed
  void _login() {
    String password = _passwordController.text;
    print("Password typed: $password");

    // NEW: change the picture and redraw the screen
    setState(() {
      if (password == "ASDF") {
        imageSource = "images/light-bulb.png";
      } else {
        imageSource = "images/stop-sign.png";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // NEW: lets the page scroll if the image doesn't fit
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Login name field
                TextField(
                  controller: _loginController,
                  decoration: const InputDecoration(
                    labelText: "Login name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                // Password field (hidden text)
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                // Login button
                ElevatedButton(
                  onPressed: _login,
                  child: const Text("Login"),
                ),
                const SizedBox(height: 16),
                // NEW: the 300 x 300 image
                Image.asset(
                  imageSource,
                  width: 300,
                  height: 300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}