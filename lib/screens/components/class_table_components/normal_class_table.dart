import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:picture_note/viewmodels/card_model.dart';
import 'package:picture_note/locator.dart';
import 'package:picture_note/services/select_class_table_services.dart';
import 'clock_box.dart';

class _ClassCard extends StatelessWidget {
  final int day;
  final int clock;


  const _ClassCard({Key? key, required this.day, required this.clock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    NormalCardModel normalCardModel = locator<NormalCardModel>();
    SelectTableService selectTableService = locator<SelectTableService>();
    selectTableService.normalCardModelInstances[day]?.add(normalCardModel);
    return ChangeNotifierProvider<NormalCardModel>.value(
        value: selectTableService.normalCardModelInstances[day]?[clock-7],
        child: Consumer<NormalCardModel>(
            builder: (context, normalCardModel, child) => Card(
                  margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  color: normalCardModel.classColor,
                  child: InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: 45,
                      height: 70,
                      child: Text(
                        '${normalCardModel.className}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        ),
                      ),
                    ),
                  ),
                )
        )
    );
  }
}

class NormalClassTable extends StatelessWidget {
  const NormalClassTable({Key? key}) : super(key: key);

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
