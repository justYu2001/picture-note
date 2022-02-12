import 'package:flutter/material.dart';
import 'clock_box.dart';

class _SelectClassCard extends StatefulWidget {
  final int classIndex;
  const _SelectClassCard({Key? key, required this.classIndex}) : super(key: key);

  @override
  _SelectClassCardState createState() => _SelectClassCardState();
}

class _SelectClassCardState extends State<_SelectClassCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: 45,
          height: 70,
        ),
      ),
    );
  }
}

class SelectClassTable extends StatefulWidget {
  const SelectClassTable({Key? key}) : super(key: key);

  @override
  SelectClassTableState createState() => SelectClassTableState();
}

class SelectClassTableState extends State<SelectClassTable> {
  var isSelected = List<List<bool>>.filled(19, List<bool>.filled(7, false));

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            for (int clock = 7; clock < 25; clock++)
              ClockBox(clock: clock, colorSelect: clock % 2),
          ],
        ),
        Expanded(
          child: Wrap(children: [
            for (int i = 0; i < 126; i++) _SelectClassCard(classIndex: i),
          ]),
        )
      ],
    );
  }
}