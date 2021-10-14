import 'package:assignment14/model/modelringtone.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Ringtone> ringtones = getListOfRingtone();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialog Box"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                int? val = 0;
                return AlertDialog(
                  content: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List<Widget>.generate(4, (int index) {
                          return RadioListTile<int>(
                              value: index,
                              groupValue: val,
                              onChanged: (int? value) {
                                setState(() => val = value);
                              },
                              title: Text("data"));
                        }),
                      );
                    },
                  ),
                );
              },
            );
          },
          child: const Text("Chnage ringtone"),
        ),
      ),
    );
  }
}
