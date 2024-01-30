import 'package:flutter/material.dart';

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
  int _counter = 0;
  int _enteredNumber = 0;
  int _result = 0;
  int _click = 0;

  final TextEditingController _inputController = TextEditingController();
  String _errorMessage = '';

  void _incrementCounter() {
    setState(() {
        _enteredNumber = int.tryParse(_inputController.text) ?? 0;
        if (_enteredNumber < 0) {
          // Display an error message if the entered number is less than 0
          _errorMessage = 'Please enter a number greater than or equal to 0.';
          _showErrorDialog();
        } else {
          // Clear the error message if the input is valid
          _errorMessage = '';
          _counter +=1;
          _result = _counter + _enteredNumber;
        }
        _click +=1;
      });
  }

  void _showErrorDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text('Validation Error'),
            content: Text(_errorMessage),
              actions: [
                ElevatedButton(onPressed: () {
                  Navigator.of(context).pop(); // Dismiss the dialog
                }, child: const Text('OK'),),
              ],
          );
        }
    );
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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter a number:',
              ),
            ),

            const SizedBox(height: 20.0), // Add some spacing
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$_counter + $_enteredNumber = ',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Center(
                      child: Text(
                        '$_result',
                        style: Theme.of(context).textTheme.headlineLarge,
                      )
                  )
                ],

            ),
            if (_counter>0)
              Text(
                'You have clicked $_click times.',
                style: const TextStyle(fontSize: 16),
              ),

          ],
        ),
      ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ButtonTheme(
            minWidth: 120.0,
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child:
                  Text(
                    '+$_enteredNumber',
                    style: const TextStyle(fontSize: 12),)

          )
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}