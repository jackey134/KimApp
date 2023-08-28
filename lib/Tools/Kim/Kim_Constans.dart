//風險值
import 'package:flutter/material.dart';
import 'package:kim_app/Tools/Data/TargetListData.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../../screens/camera_view.dart';

class RiskLevel {
  static riskLevelCount() {
    return TimeLevel.timeLevel *
        (LoadLevel.loadLevel +
            PoseLevel.poseLevel +
            WorkingCondition.workingConditionLevel);
  }

  static getScore(BuildContext context) {
    final totalScoreProvider =
        Provider.of<TargetListData>(context, listen: false);
    totalScoreProvider.riskScore = RiskLevelScore.scoreNumber();

    debugPrint("總積分: ${totalScoreProvider.riskScore}");
    return totalScoreProvider.riskScore;
  }
}

class RiskLevelScore {
  static int? score;

  static scoreNumber() {
    int total = RiskLevel.riskLevelCount();
    if (total < 10) {
      score = 1;
    } else if (total > 10 && total < 25) {
      score = 2;
    } else if (total > 25 && total < 50) {
      score = 4;
    } else if (total >= 50) {
      score = 8;
    }

    debugPrint(
        "$total = ${TimeLevel.timeLevel} * (${LoadLevel.loadLevel} + ${PoseLevel.poseLevel} + ${WorkingCondition.workingConditionLevel})");

    return score;
  }
}

//時間評級
class TimeLevel {
  // ignore: non_constant_identifier_names
  static int timeLevel =
      0; //使用static的意義在進入記憶體的時候就給定值，因為會使用到多次參數所以寫入static以降低記憶體需求
  // 資料來源:https://ithelp.ithome.com.tw/articles/10230484
  // ignore: non_constant_identifier_names
  static int liftingScore = 0;

  // ignore: non_constant_identifier_names
  static int holdingTimeScore = 0;

  // ignore: non_constant_identifier_names
  static int carryingDistanceScore = 0;

  static lifting() {
    //單位為次數
    if (liftingScore == 1) {
      timeLevel = 1;
    } else if (liftingScore == 2) {
      timeLevel = 2;
    } else if (liftingScore == 4) {
      timeLevel = 4;
    } else if (liftingScore == 6) {
      timeLevel = 6;
    } else if (liftingScore == 8) {
      timeLevel = 8;
    } else if (liftingScore == 10) {
      timeLevel = 10;
    }
    return timeLevel;
  }

  //holdingTimeScore

  static holding() {
    //單位為次數
    if (holdingTimeScore == 1) {
      timeLevel = 1;
    } else if (holdingTimeScore == 2) {
      timeLevel = 2;
    } else if (holdingTimeScore == 4) {
      timeLevel = 4;
    } else if (holdingTimeScore == 6) {
      timeLevel = 6;
    } else if (holdingTimeScore == 8) {
      timeLevel = 8;
    } else if (holdingTimeScore == 10) {
      timeLevel = 10;
    }
    return timeLevel;
  }

  //carryingDistanceScore

  static carrying() {
    //單位為次數
    if (carryingDistanceScore == 1) {
      timeLevel = 1;
    } else if (carryingDistanceScore == 2) {
      timeLevel = 2;
    } else if (carryingDistanceScore == 4) {
      timeLevel = 4;
    } else if (carryingDistanceScore == 6) {
      timeLevel = 6;
    } else if (carryingDistanceScore == 8) {
      timeLevel = 8;
    } else if (carryingDistanceScore == 10) {
      timeLevel = 10;
    }
    return timeLevel;
  }
}

//荷重評級
class LoadLevel {
  // ignore: non_constant_identifier_names
  static int loadLevel = 0;

  // ignore: non_constant_identifier_names
  static int manLoad = 0;

  // ignore: non_constant_identifier_names
  static int womenLoad = 0;

  // genderChoice(){
  //   isChoiceMan ? manLoadLeveling() : girlLoadLeveling();
  // }
  static manLoadLeveling() {
    if (manLoad == 1) {
      loadLevel = 1;
    } else if (manLoad == 2) {
      loadLevel = 2;
    } else if (manLoad == 3) {
      loadLevel = 4;
    } else if (manLoad == 4) {
      loadLevel = 7;
    } else if (manLoad == 5) {
      loadLevel = 25;
    }
    return loadLevel;
  }

  static girlLoadLeveling() {
    if (manLoad == 1) {
      loadLevel = 1;
    } else if (manLoad == 2) {
      loadLevel = 2;
    } else if (manLoad == 3) {
      loadLevel = 4;
    } else if (manLoad == 4) {
      loadLevel = 7;
    } else if (manLoad == 5) {
      loadLevel = 25;
    }
    return loadLevel;
  }
}

//工作狀況評級
class WorkingCondition {
  // ignore: non_constant_identifier_names
  static int workingConditionLevel = workLevel();
  static int workingScore = 0;

  static workLevel() {
    if (workingScore == 1) {
      workingConditionLevel = 0;
    } else if (workingScore == 2) {
      workingConditionLevel = 1;
    } else if (workingScore == 3) {
      workingConditionLevel = 2;
    }
    return workingConditionLevel;
  }

// static levelGood() {
//   return workingConditionLevel = 0;
// }
//
// static levelNormal() {
//   return workingConditionLevel = 1;
// }
//
// static levelBad() {
//   return workingConditionLevel = 2;
// }
}

//姿勢評級
class PoseLevel {
  // ignore: non_constant_identifier_names
  static String poseResult = getFinalResult();
  static int poseLevel = getPoseLevel();

  static getPoseLevel() {
    debugPrint("姿態評級得分: " + poseResult);
    int poseScore = 0;
    if (poseResult == "label0") {
      poseScore = 1;
    }
    if (poseResult == "label5") {
      poseScore = 2;
    }
    if (poseResult == "label15") {
      poseScore = 4;
    }
    if (poseResult == "label20") {
      poseScore = 8;
    }
    return poseScore;
  }
}
