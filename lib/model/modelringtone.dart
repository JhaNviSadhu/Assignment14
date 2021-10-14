class Ringtone {
  final String name;
  bool? isSelected;

  Ringtone({required this.name, isSelected});
}

List ringtone = [
  {
    "name": "it's realme",
    "isSelected": true,
  },
  {
    "name": "realme Tune",
    "isSelected": false,
  },
  {
    "name": "Clam",
    "isSelected": false,
  },
  {
    "name": "Nostalgic",
    "isSelected": false,
  },
];

List<Ringtone> getListOfRingtone() {
  return ringtone
      .map(
        (item) => Ringtone(
          name: item["name"],
          isSelected: item["isSelected"],
        ),
      )
      .toList();
}
