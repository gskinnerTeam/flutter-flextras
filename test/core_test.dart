import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('core tests', (tester) async {
    /// Column with 3 items and 2 separators
    final col = SeparatedColumn(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      verticalDirection: VerticalDirection.up,
      textBaseline: TextBaseline.ideographic,
      textDirection: TextDirection.rtl,
      padding: EdgeInsets.all(100),
      separatorBuilder: () => SizedBox(height: 100),
      children: [
        FlutterLogo(),
        FlutterLogo(),
        FlutterLogo(),
      ],
    );
    await tester.pumpWidget(col);

    expect(
      tester.widget(find.byType(SizedBox).first),
      isA<SizedBox>().having((t) => t.height, 'sized box', 100),
    );

    expect(
      tester.widget(find.byType(SizedBox).last),
      isA<SizedBox>().having((t) => t.height, 'sized box', 100),
    );

    /// Check proxy properties
    final w = tester.widget(find.byType(SeparatedFlex).first) as SeparatedFlex;
    expect(w.mainAxisAlignment, MainAxisAlignment.end);
    expect(w.crossAxisAlignment, CrossAxisAlignment.start);
    expect(w.mainAxisSize, MainAxisSize.min);
    expect(w.textBaseline, TextBaseline.ideographic);
    expect(w.textDirection, TextDirection.rtl);

    /// Empty row
    final row = SeparatedRow(separatorBuilder: () => SizedBox(height: 100), children: []);
    await tester.pumpWidget(row);

    /// row with 1 item
    final row2 = SeparatedRow(
      separatorBuilder: () => SizedBox(height: 100),
      children: [FlutterLogo()],
    );
    await tester.pumpWidget(row2);
    expect(find.byType(SizedBox), findsNothing);
  });
}
