import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PaddedColumn(
          padding: EdgeInsets.all(20),
          children: [
            Flexible(
              child: ExpandedScrollingRow(children: [
                Expanded(child: Container(width: 400, color: Colors.blue)),
                Expanded(
                    child: Container(
                  width: 400,
                  color: Colors.purple,
                  child: ExpandedScrollingColumn(
                    children: [
                      Text("TOP CONTENT", style: TextStyle(fontSize: 20)),
                      Expanded(
                        child: Container(height: 400, child: Text("MIDDLE CONTENT"), alignment: Alignment.center),
                      ),
                      Text("BOTTOM CONTENT", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                )),
              ]),
            ),
            SeparatedRow(children: [
              Expanded(child: Container(width: 200, height: 20, color: Colors.green)),
              Expanded(child: Container(width: 200, height: 20, color: Colors.green)),
            ], separatorBuilder: () => Text("divider"))
          ],
        ),
      ),
    );
  }
}
