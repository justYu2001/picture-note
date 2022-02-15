class SelectTableService{
  var selectCondition = <int, List>{
    0 : [],1 : [], 2:[], 3 : [], 4 : [], 5 : [], 6:[]
  };

  void setSelect(int day, int clock){
    selectCondition[day]?.add(clock);
  }

  List getDayClock(int day){
    selectCondition[day]?.sort();
    return selectCondition[day] ?? [];
  }

  void clear(){
    selectCondition.forEach((day, clocks) {
      selectCondition[day]?.clear();
    });
  }
}

