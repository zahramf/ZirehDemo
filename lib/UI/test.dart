import 'package:flutter/material.dart';

void main() => runApp(Test());

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Demo',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Demo'),
          ),
          body: Stack(
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.red,
                                      width: 5.0)),
                              child: Center(
                                child: Text("hello world"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 0.0,
                  left: 20.0,
                  child: Container(
                    child: new Text(
                      "comment",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    color: Colors.white,
                  )),
            ],
          ),
        ));
  }
}





// import 'package:flutter/material.dart';

// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   FocusNode focusNode = FocusNode();
//   bool isFocused = false;

//   @override
//   void initState() {
//     focusNode.addListener(_onFocusChange);
//     super.initState();
//   }

//   void _onFocusChange() {
//     setState(() => isFocused = !isFocused);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 500, vertical: 300),
//         child: Stack(
//           children: <Widget>[
//             Container(
//               padding: const EdgeInsets.only(top: 10),
//               child: TextFormField(
//                 focusNode: focusNode,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30)),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.topCenter,
//               child: Container(
//                 color: Colors.white,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Text(
//                     'Address',
//                     style:
//                         isFocused ? TextStyle(color: Colors.blue[800]) : null,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }