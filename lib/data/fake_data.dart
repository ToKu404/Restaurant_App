import 'dart:math';

class FakeData {
  static final List<String> _fakeFood = [
    "https://source.unsplash.com/Mzy-OjtCI70/",
    "https://source.unsplash.com/kcA-c3f_3FE/",
    "https://source.unsplash.com/auIbTAcSH6E/",
    "https://source.unsplash.com/Yr4n8O_3UPc/",
    "https://source.unsplash.com/wEBg_pYtynw/",
    "https://source.unsplash.com/WjdOYhgTGCM/"
  ];
  static final List<String> _fakeDrink = [
    "https://source.unsplash.com/AjG1BkDH4Zs/",
    "https://source.unsplash.com/CrK843Pl9a4/",
    "https://source.unsplash.com/jH1PBHevj38/",
    "https://source.unsplash.com/nzyzAUsbV0M/",
    "https://source.unsplash.com/g6e641CiHFQ/",
    "https://source.unsplash.com/dmkmrNptMpw/"
  ];

  static String getRandomFood() {
    int index = Random().nextInt(_fakeFood.length);
    return _fakeFood[index];
  }
  static String getRandomDrink() {
    int index = Random().nextInt(_fakeDrink.length);
    return _fakeDrink[index];
  }

  static int getRandomPrice() {
    int randNum = Random().nextInt(20000);
    return 20000+randNum;
  }
}
