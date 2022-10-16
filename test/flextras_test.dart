import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget app({
  required Widget child,
}) {
  return MaterialApp(
    home: Scaffold(
      body: child,
    ),
  );
}

void main() {
  final myList = <String>['hello', 'dog', 'launch'];
  final separatedColumn = SeparatedColumn(
    separatorBuilder: () => SizedBox(height: 12),
    children: myList.map((e) => Text('$e\n')).toList(),
  );
  final separatedColumn2 = SeparatedColumn(
    separatorBuilder: () => SizedBox(height: 12),
    children: [
      ...myList.map((e) => Text('$e\n')),
    ],
  );

  testWidgets('builds SeparatedColumn without error', (tester) async {
    await tester.pumpWidget(app(child: separatedColumn));
    expect(tester.takeException(), isNull);

    // Regression test for: https://github.com/gskinnerTeam/flutter-flextras/issues/3
    // This would throw an exception if regressed.
    await tester.pumpWidget(app(child: separatedColumn2));
    expect(tester.takeException(), isNull);
  });
}
