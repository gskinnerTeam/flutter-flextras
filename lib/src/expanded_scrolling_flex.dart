import 'package:flutter/material.dart';

// Normally having an Expanded in a Column will throw an error if you place that Column in a SingleChildScrollView.
// This widget addresses that issue allowing you to placed Expanded or Flexible content inside a scrollview.
class ExpandedScrollingFlex extends StatelessWidget {
  const ExpandedScrollingFlex({
    Key? key,
    required this.children,
    required this.direction,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.scrollViewBuilder,
    this.physics,
  }) : super(key: key);

  ///
  final List<Widget> children;
  final Axis direction;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final Widget Function(Axis direction, Widget child)? scrollViewBuilder;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      Widget content = Flex(
        direction: direction,
        children: children,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
      );
      // Intrinsic width or height stops the flexible from expanding when it's height/width becomes unbounded
      //content = direction == Axis.vertical ? IntrinsicHeight(child: content) : IntrinsicWidth(child: content);
      content = IntrinsicHeight(child: IntrinsicWidth(child: content));
      // Constrained box stops the column/row from getting too small, forcing it to be at least as big as it's parent
      content = ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
        child: content,
      );

      // Use an external scrollBuilder if one is available
      return scrollViewBuilder != null
          ? scrollViewBuilder!.call(direction, content)
          : SingleChildScrollView(
              scrollDirection: direction,
              physics: physics,
              child: content,
            );
    });
  }
}

class ExpandedScrollingRow extends StatelessWidget {
  const ExpandedScrollingRow({
    Key? key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.scrollViewBuilder,
    this.physics,
  }) : super(key: key);

  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final Widget Function(Axis direction, Widget child)? scrollViewBuilder;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return ExpandedScrollingFlex(
      direction: Axis.horizontal,
      children: children,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      scrollViewBuilder: scrollViewBuilder,
      physics: physics,
    );
  }
}

class ExpandedScrollingColumn extends StatelessWidget {
  const ExpandedScrollingColumn({
    Key? key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.scrollViewBuilder,
    this.physics,
  }) : super(key: key);

  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final Widget Function(Axis direction, Widget child)? scrollViewBuilder;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return ExpandedScrollingFlex(
      direction: Axis.vertical,
      children: children,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      scrollViewBuilder: scrollViewBuilder,
      physics: physics,
    );
  }
}
