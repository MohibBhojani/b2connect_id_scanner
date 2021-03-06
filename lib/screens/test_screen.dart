// import 'package:flutter/material.dart';
// import 'package:huawei_ml/models/ml_text.dart';
// import 'package:huawei_ml/text/ml_text_analyzer.dart';
// import 'package:huawei_ml/text/ml_text_analyzer_setting.dart';
// import 'package:image_picker/image_picker.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage('Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage(this.title);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var t1, t2, t3;
//   int _counter = 0;

//   void _incrementCounter() async {
//     // Create an MLTextAnalyzer object.
//     MLTextAnalyzer analyzer = MLTextAnalyzer();

// // Create an MLTextAnalyzerSetting object to configure the recognition.
//     MLTextAnalyzerSetting setting = MLTextAnalyzerSetting();

//     final ImagePicker _picker = ImagePicker();
//     // Pick an image
//     var image = await _picker.getImage(source: ImageSource.camera);
//     // Create a MLText object to store the result.
// // Set the image to be recognized and other desired options.
//     setting.path = image.path;
//     setting.isRemote = true;
//     setting.language = "en";

// // Call asyncAnalyzeFrame to recognize text asynchronously.
//     MLText text = await analyzer.asyncAnalyzeFrame(setting);

// // Call analyzeFrame to recognize text synchronously.
//     List<Blocks> list = await analyzer.analyzeFrame(setting);

// // After the recognition ends, stop the text analyzer.
//     bool result = await analyzer.stopTextAnalyzer();
//     setState(() {
//       _counter++;
//       t1 = text;
//       t2 = list;
//       t3 = result;
//       print(text);
//       print(list);
//       print(result);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             Text(
//               '$t1',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             Text(
//               '$t2',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             Text(
//               '$t3',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }