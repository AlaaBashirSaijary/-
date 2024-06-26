import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../model/hadith_model.dart';


class AhadithDetailsProvider extends ChangeNotifier {
  List<HadithModel> ahadithData = [];

 void loadHadithFile() {
    rootBundle.loadString('assets/ahadeth.txt').then((hadithFile) {
      List<String> ahadith = hadithFile.split('#');
      for (int i = 0; i < ahadith.length; i++) {
        String hadith = ahadith[i];
        List<String> hadithLines = hadith.trim().split('\n');
        String title = hadithLines[0];
        hadithLines.removeAt(0);
        List<String> hadithContent = hadithLines;
        ahadithData.add(HadithModel(title: title, content: hadithContent));
      }
      notifyListeners();

    });
  }
}
