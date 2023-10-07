import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dinar/colors.dart';

// ignore: must_be_immutable
class SelectInput extends StatefulWidget {
  String title;
  final List<String> items;
  Function onSelect;
  SelectInput(
      {Key? key,
      required this.title,
      required this.items,
      required this.onSelect})
      : super(key: key);

  @override
  State<SelectInput> createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput> {
  Random rnd = Random();
  double border = 0.0;
  Color color = Colors.transparent;
  bool expanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SelectInput oldWidget) {
    if (oldWidget.title != widget.title) {
      setState(() {
        oldWidget.title = widget.title;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark().copyWith(
        dividerColor: Colors.transparent,
      ),
      child: Container(
        height: expanded
            ? widget.items.length > 2
                ? 210.0
                : widget.items.length * 50 + 58
            : 58.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(
            color: blue,
            width: 1.0,
          ),
          color: white,
        ),
        child: Column(
          children: [
            ListTile(
              trailing: Icon(
                expanded
                    ? Icons.keyboard_arrow_down_rounded
                    : Icons.keyboard_arrow_right_rounded,
                size: 33.0,
                color: blue,
              ),
              title: Text(
                widget.title,
                style: TextStyle(
                  color: widget.items.contains(widget.title) ? blue : grey,
                  fontSize: 15.0,
                ),
              ),
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
              },
            ),
            if (expanded)
              Container(
                height:
                    widget.items.length > 2 ? 150.0 : widget.items.length * 50,
                color: white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Drawer(
                    backgroundColor: white,
                    elevation: 0.0,
                    child: ListView(
                      key: const PageStorageKey<String>('lisences'),
                      children: List.generate(widget.items.length, (index) {
                        String item = widget.items[index];
                        return ListTile(
                          selected: widget.title == item,
                          selectedColor: blue,
                          hoverColor: grey.withOpacity(1),
                          selectedTileColor: grey,
                          onTap: () {
                            setState(() {
                              expanded = false;
                            });
                            widget.onSelect(item);
                          },
                          title: Text(
                            item,
                            style: TextStyle(
                              color: widget.title == item ? blue : grey,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
