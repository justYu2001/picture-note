import 'package:flutter/material.dart';
import 'clock_box.dart';

class _ClassCard extends StatefulWidget {
  final int classIndex;
  const _ClassCard({Key? key, required this.classIndex}) : super(key: key);

  @override
  _ClassCardState createState() => _ClassCardState();
}

class _ClassCardState extends State<_ClassCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
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

class NormalClassTable extends StatefulWidget {
  const NormalClassTable({Key? key}) : super(key: key);

  @override
  _NormalClassTableState createState() => _NormalClassTableState();
}

class _NormalClassTableState extends State<NormalClassTable> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            for (int clock = 7; clock < 25; clock++)
              ClockBox(clock: clock, colorSelect: clock % 2),
          ],
        ),
        Expanded(
          child: Wrap(children: [
            for (int i = 0; i < 126; i++) _ClassCard(classIndex: i),
          ]),
        )
      ],
    );
  }
}

