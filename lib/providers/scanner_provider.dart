import 'package:flutter/cupertino.dart';
import 'package:huawei_ml/huawei_ml.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import '../services/util_service.dart';
import '../utils/service_locator.dart';
import '../models/user.dart';

class ScannerProvider with ChangeNotifier {
  AppUser userData = AppUser();
  var utilService = locator<UtilService>();
  get getUser {
    return this.userData;
  }

// for Android & IOS
  Future<void> scanImage(var file, var id) async {
    final inputImage = InputImage.fromFile(file);
    final textDetector = GoogleMlKit.vision.textDetector();
    final RecognisedText recognisedText =
        await textDetector.processImage(inputImage);

    String text = recognisedText.text;
    if (id == 1) {
      try {
        if (recognisedText.blocks[0].text != "United Arab Emirates") {
          utilService.showToast('Please insert front side of your card');
          return;
        }
        this.userData.id = recognisedText.blocks[3].text;
        this.userData.fullName =
            getSubString("Name", recognisedText.blocks[4].text);
        this.userData.nationality = getSubString(
            "Nationality:", recognisedText.blocks[5].lines[0].text);
      } catch (e) {
        utilService.showToast('Please insert front side of your card');
      }
    } else if (id == 2) {
      try {
        this.userData.dateOfBirth =
            recognisedText.blocks[1].text.substring(14, 24);
        this.userData.gender = recognisedText.blocks[0].text.substring(4, 5);
        this.userData.expiryDate = recognisedText.blocks[3].text;
      } catch (e) {
        utilService.showToast('Please insert back side of your card');
      }

      print(text);
    }
  }

// For Harmony OS
  Future<void> scanImageHarmonyOS(var file, var id) async {
    MLTextAnalyzer analyzer = MLTextAnalyzer();
    MLTextAnalyzerSetting setting = MLTextAnalyzerSetting();
    setting.path = file.path;
    setting.isRemote = false;
    setting.language = "en";

    MLText text = await analyzer.asyncAnalyzeFrame(setting);
    List<Blocks> list = await analyzer.analyzeFrame(setting);
    if (id == 1) {
      this.userData.id = list[3].textLines[1].stringValue;
      this.userData.fullName =
          getSubString("Name", list[5].textLines[1].stringValue);
      this.userData.nationality =
          getSubString("Nationality:", list[6].textLines[1].stringValue);
    } else if (id == 2) {
      this.userData.dateOfBirth =
          list[1].textLines[0].stringValue.substring(14, 24);
      this.userData.gender = list[0].stringValue.substring(4, 5);
      this.userData.expiryDate = list[2].stringValue;
    }
  }

  String getSubString(title, value) {
    return value.substring((title.length + 1));
  }
}
