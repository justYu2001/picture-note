import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      color: Colors.white,
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => const AlertDialog(
          backgroundColor: Color.fromRGBO(122, 134, 157, 0.5),
          content: _DialogContent(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            side: BorderSide(
                color: Color.fromRGBO(175, 163, 119, 1),
                width: 3
            ),
          ),
          contentPadding: EdgeInsets.all(5),
        ),
      ),
    );
  }
}

class _DialogContent extends StatelessWidget {
  const _DialogContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 130,
        height: 410,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(175, 163, 119, 1),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(30),

        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
          child: Column(
            children: [
              const Text(
                'Selected',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 30,
                color: const Color.fromRGBO(102, 127, 180, 1),
                child: const Text(
                  '顯示已選時段',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'ClassName',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 30,
                color: const Color.fromRGBO(92, 109, 155, 1),
                child: const TextField(),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Class type',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 30,
                color: const Color.fromRGBO(94, 158, 179, 1),
                // child: DropdownButton(
                //   items: [],
                //   onChanged: (Object? value) {  },
                // ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 100,
                    width: 80,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Color.fromRGBO(98,108,126, 1),
                        size: 70.0,
                      ),
                      onPressed: null,
                    ),
                  ),
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                    height: 50,
                    width: 60,
                  ),
                  SizedBox(
                    height: 100,
                    width: 80,
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Color.fromRGBO(98,108,126, 1),
                        size: 70.0,
                      ),
                      onPressed: null,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}