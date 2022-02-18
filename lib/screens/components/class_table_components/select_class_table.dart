import 'package:flutter/material.dart';
import 'package:picture_note/services/select_class_table_services.dart';
import 'package:picture_note/viewmodels/card_model.dart';
import 'package:provider/provider.dart';
import 'package:picture_note/locator.dart';
import 'clock_box.dart';

class _SelectClassCard extends StatelessWidget {
  final int day;
  final int clock;
  const _SelectClassCard({Key? key, required this.day, required this.clock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SelectedCardModel>(
        create: (context) => locator<SelectedCardModel>(),
        child: Consumer<SelectedCardModel>(
          builder: (context, selectedCardModel, child) => Card(
            margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
            color: selectedCardModel.showColor,
            child: InkWell(
              onTap: () {
                selectedCardModel.setSelect = true;
                var selectTableService = locator<SelectTableService>();
                selectTableService.setSelectCondition(day, clock);
              },
              child: const SizedBox(
                width: 45,
                height: 70,
              ),
            ),
          )
        ),
    );
  }
}

class SelectClassTable extends StatelessWidget {
  const SelectClassTable({Key? key}) : super(key: key);

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
            for(int clock = 7; clock < 25; clock++)// need fix
              for(int day = 0; day < 7; day++)
                _SelectClassCard(
                  day: day,
                  clock: clock,
                )
          ]),
        )
      ],
    );
  }
}
