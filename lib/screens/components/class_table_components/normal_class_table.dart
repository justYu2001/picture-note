import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:picture_note/viewmodels/card_model.dart';
import 'package:picture_note/viewmodels/class_manage_model.dart';
import 'package:picture_note/locator.dart';
import 'clock_box.dart';

class _ClassCard extends StatelessWidget {
  final int day;
  final int clock;

  const _ClassCard({Key? key, required this.day, required this.clock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NormalCardModel>(
        create: (context)  => locator<NormalCardModel>(),
        child: Consumer<NormalCardModel>(
            builder: (context, normalCardModel, child) => Card(
                  margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  color: normalCardModel.getColor(day, clock),
                  child: InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: 45,
                      height: 70,
                    ),
                  ),
                )
        )
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
            for (int clock = 7; clock < 25; clock++) // need fix
              for (int day = 0; day < 7; day++)
                _ClassCard(
                  day: day,
                  clock: clock,
                )
          ]),
        )
      ],
    );
  }
}
