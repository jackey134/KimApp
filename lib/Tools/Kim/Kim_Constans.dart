//風險值
class RiskLevel {
  static riskLevelCount() {
    return TimeLevel.timeLevel *
        (LoadLevel.loadLevel +
            PoseLevel.poseLevel +
            WorkingCondition.workingConditionLevel);
  }

  static getScore() {
    RiskLevelScore riskLevelScore = RiskLevelScore();
    return riskLevelScore.scoreNumber();
  }
}

class RiskLevelScore{
  static int score = 0;
  scoreNumber(){
    if(RiskLevel.riskLevelCount() < 10){
      score = 1;
    }else if(RiskLevel.riskLevelCount() >10 && RiskLevel.riskLevelCount() < 25){
      score = 2;
    }else if(RiskLevel.riskLevelCount() >25 && RiskLevel.riskLevelCount() < 50){
      score = 4;
    }else if(RiskLevel.riskLevelCount() >=50){
      score = 8;
    }
    print("${RiskLevel.riskLevelCount()} = ${TimeLevel.timeLevel = 4} * (${LoadLevel.loadLevel} + ${PoseLevel.poseLevel} + ${WorkingCondition.workingConditionLevel})");

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
  static int liftingTotal = 0;

  // ignore: non_constant_identifier_names
  static int holdingTimeTotal = 0;

  // ignore: non_constant_identifier_names
  static int carryingDistanceTotal = 0;

  lifting() {
    //單位為次數
    if (liftingTotal >= 0 && liftingTotal < 10) {
      timeLevel = 1;
    } else if (liftingTotal >= 10 && liftingTotal < 40) {
      timeLevel = 2;
    } else if (liftingTotal >= 40 && liftingTotal < 200) {
      timeLevel = 4;
    } else if (liftingTotal >= 200 && liftingTotal < 500) {
      timeLevel = 6;
    } else if (liftingTotal >= 500 && liftingTotal < 1000) {
      timeLevel = 8;
    } else if (liftingTotal >= 1000) {
      timeLevel = 10;
    }
    return timeLevel;
  }

  holding() {
    //時間單位為分鐘(min)
    if (holdingTimeTotal >= 0 && holdingTimeTotal < 5) {
      timeLevel = 1;
    } else if (holdingTimeTotal >= 5 && holdingTimeTotal < 15) {
      timeLevel = 2;
    } else if (holdingTimeTotal >= 15 && holdingTimeTotal < 60) {
      timeLevel = 4;
    } else if (holdingTimeTotal >= 60 && holdingTimeTotal < 120) {
      timeLevel = 6;
    } else if (holdingTimeTotal >= 120 && holdingTimeTotal < 240) {
      timeLevel = 8;
    } else if (holdingTimeTotal >= 240) {
      timeLevel = 10;
    }
    return timeLevel;
  }

  carrying() {
    //單位為公里(KM)
    if (carryingDistanceTotal >= 0 && carryingDistanceTotal < 5) {
      timeLevel = 1;
    } else if (carryingDistanceTotal >= 5 && carryingDistanceTotal < 15) {
      timeLevel = 2;
    } else if (carryingDistanceTotal >= 15 && carryingDistanceTotal < 60) {
      timeLevel = 4;
    } else if (carryingDistanceTotal >= 60 && carryingDistanceTotal < 120) {
      timeLevel = 6;
    } else if (carryingDistanceTotal >= 120 && carryingDistanceTotal < 240) {
      timeLevel = 8;
    } else if (carryingDistanceTotal >= 240) {
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
  static int workingConditionLevel = 0;

  static levelGood() {
    return workingConditionLevel = 0;
  }

  static levelNormal() {
    return workingConditionLevel = 1;
  }

  static levelBad() {
    return workingConditionLevel = 2;
  }
}

//姿勢評級
class PoseLevel {
  // ignore: non_constant_identifier_names
  static int poseLevel = 0;

  level_1() {
    poseLevel = 1;
  }

  level_2() {
    poseLevel = 2;
  }

  level_4() {
    poseLevel = 4;
  }

  level_8() {
    poseLevel = 8;
  }
}



