import 'package:assignment14/constant.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List<String> ringTones = [
  "it's realme",
  "realme tune",
  "Clam",
  "Nostalgic",
  "Romance",
  "Dreams",
  "Visions",
  "Longing",
  "Bliss",
  "Delight",
  "Classic",
  "Playtime",
  "Dance",
  "trinkets",
];

class _HomeState extends State<Home> {
  int isSelected = 0;
  String name = "Hina";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.primary),
              child: GestureDetector(
                onTap: () async {
                  print("object");
                  final result = await showDialog(
                    // barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: SizedBox(
                          height: 320,
                          child: StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Column(
                                children: List.generate(
                                  profile.length,
                                  (int index) => InkWell(
                                    onTap: () {
                                      isSelected = index;
                                      Navigator.pop(
                                          context, profile[isSelected]);
                                      print(isSelected);
                                      // print(profile[isSelected]);
                                    },
                                    child: Text(
                                      profile[index],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                  print(result);
                  name = result;
                },
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/user1.jpg"),
                      radius: 35,
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: kfont,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "xyz123@gmail.com",
                            style: kfontlight,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Text(name),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Dialog Box"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showMyDialog(context);
          },
          child: const Text("Chnage ringtone"),
        ),
      ),
    );
  }
}

List profile = [
  "hina ",
  "karina",
];

//dialogbox
Future<void> showMyDialog(BuildContext context) {
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      int? val = 0;
      return AlertDialog(
        title: const Text('Ringtones'),
        actionsPadding: const EdgeInsets.all(0),
        contentPadding: const EdgeInsets.only(left: 10, right: 10),
        buttonPadding: const EdgeInsets.all(0),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancle"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
        insetPadding:
            const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        content: SizedBox(
          height: 400,
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children:
                      List<Widget>.generate(ringTones.length, (int index) {
                    return RadioListTile<int>(
                      value: index,
                      groupValue: val,
                      onChanged: (int? value) {
                        index = value!;
                        setState(() => val = value);
                      },
                      title: Text(ringTones[index]),
                    );
                  }),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
