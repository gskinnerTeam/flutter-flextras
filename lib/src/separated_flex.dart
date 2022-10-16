import 'package:flutter/material.dart';

/// Allows you to inject a widget between each item in the row
class SeparatedRow extends StatelessWidget {
  const SeparatedRow({
    Key? key,
    required this.children,
    required this.separatorBuilder,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline = TextBaseline.alphabetic,
    this.textDirection = TextDirection.ltr,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextBaseline textBaseline;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  final EdgeInsets padding;

  /// Return a widget, to be used in between each child widget
  final Widget Function() separatorBuilder;

  @override
  Widget build(BuildContext context) {
    List<Widget> c = [...children];
    for (var i = c.length; i-- > 0;) {
      if (i > 0) c.insert(i, separatorBuilder());
    }
    Widget row = Row(
      children: c,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
    );
    return Padding(padding: padding, child: row);
  }
}

/// Allows you to inject a widget between each item in the column
class SeparatedColumn extends StatelessWidget {
  final List<Widget> children;
  final Widget Function() separatorBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextBaseline textBaseline;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  final EdgeInsets padding;

  const SeparatedColumn({
    Key? key,
    required this.children,
    required this.separatorBuilder,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline = TextBaseline.alphabetic,
    this.textDirection = TextDirection.ltr,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> c = [...children];
    for (var i = c.length; i-- > 0;) {
      if (i > 0) c.insert(i, separatorBuilder());
    }
    Widget col = Column(
      children: c,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
    );
    return Padding(padding: this.padding, child: col);
  }
}
