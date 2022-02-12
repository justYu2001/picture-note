import 'package:flutter/material.dart';
import 'components/class_table_components/day_box.dart';
import 'components/class_table_components/show_dialog.dart';
import 'components/class_table_components/select_button.dart';
import 'components/class_table_components/normal_class_table.dart';
import 'components/class_table_components/select_class_table.dart';
class ClassTable extends StatelessWidget {
  const ClassTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/images/martin-adams-_OZCl4XcpRw-unsplash.jpg'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 21, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    SelectButton(),
                    AddButton(),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      color: const Color.fromRGBO(144, 159, 190, 0.5),
                      //color: Color.fromRGBO(202,214,241, 1),
                      child: const SizedBox(
                        width: 35,
                        height: 30,
                      ),
                    ),
                    const DayBox(day: "SUN"),
                    const DayBox(day: "MON"),
                    const DayBox(day: "TUE"),
                    const DayBox(day: "WED"),
                    const DayBox(day: "THU"),
                    const DayBox(day: "FRI"),
                    const DayBox(day: "SAT"),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: NormalClassTable(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      ),
    );
  }
}
