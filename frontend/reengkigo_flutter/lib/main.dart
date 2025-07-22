import 'package:flutter/material.dart';
import 'ffi/reengkigo_ffi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Reengkigo FFI Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _number1 = 5.0;
  double _number2 = 3.0;
  double _addResult = 0.0;
  double _multiplyResult = 0.0;
  String _greetResult = '';
  String _userName = 'Flutter';

  void _runFFITests() {
    setState(() {
      try {
        // Test add function
        _addResult = ReengkigoFFI.add(_number1, _number2);
        
        // Test multiply function
        _multiplyResult = ReengkigoFFI.multiply(_number1, _number2);
        
        // Test greet function
        _greetResult = ReengkigoFFI.greet(_userName);
      } catch (e) {
        _greetResult = 'Error: $e';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Reengkigo FFI Test App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              
              // Input values display
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('Test Values: $_number1 and $_number2'),
                      Text('User Name: $_userName'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              // Results display
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Results from Rust FFI:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text('Add: $_number1 + $_number2 = $_addResult'),
                      Text('Multiply: $_number1 × $_number2 = $_multiplyResult'),
                      Text('Greet: $_greetResult'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              // Test buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _runFFITests,
                    child: const Text('Run FFI Tests'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _number1 = (_number1 + 1) % 10;
                        _number2 = (_number2 + 1) % 10;
                      });
                    },
                    child: const Text('Change Values'),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
              const Text(
                'iPhone & Galaxy Compatible',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
