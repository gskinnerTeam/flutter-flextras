# flextras
A collection of Columns and Rows with extra functionality:

* `PaddedColumn` / `PaddedRow` - Wraps a column/row in padding
* `SeparatedColumn` / `SeparatedRow` - Insert any widget between each child
* `ExpandedScrollingColumn` / `ExpandedScrollingRow` - Allow a column to hold Expandable children, while still scrolling if it needs to.

## 🔨 Installation
```yaml
dependencies:
  flextras: ^0.0.1
```

### ⚙ Import

```dart
import 'package:flextras/flextras.dart';
```

## 🕹️ Usage
### PaddedContainer and PaddedRow

A simple combination of Padding and Column/Row, as is often needed. Very simple, but saves a few lines in your tree:
```dart
return PaddedColumn(
    padding: EdgeInsets.all(20),
    children: [ ... ]
)
```

### SeparatedColumn and SeparatedRow

Often you want to place a divider between the elements of a Column or Row. Use the `separatorBuilder` method to do so easily:
```dart
return SeparatedColumn(
    // 10px gap between each element
    separatorBuilder: () => SizedBox(height: 10),
    children: [ ... ]
)
```

### ExpandedScrollingColumn and ExpandedScrollingRow

Solves a common use case where you want to have some expanding content, that can also begin scrolling if it runs out of room.

Normally, if you do something like this it will throw a layout error:
```dart
SingleChildScrollView(
    child: Column(
        children: [
            Expanded(child: ...) // This tries to expand to infinity :(
        ]
    )
)
```

`ExpandedScrollingColumn` fixes this by using the content's natural height, **or** the height of the parent view, whichever is greater.
```dart
// This will expand vertically to fill the parent, but begin scrolling when it has to
ExpandedScrollingColumn(
    children: [
        Expanded(child: Container(height: 400)),
    ]
)
```

## 🐞 Bugs/Requests

If you encounter any problems please open an issue. If you feel the library is missing a feature, please raise a ticket on Github and we'll look into it. Pull request are welcome.

## 📃 License

MIT License
