
import 'package:flutter/cupertino.dart';

class Screen extends ChangeNotifier{
  
  int screenVal = 0;

  getScreenVal() => screenVal;  
    

  changeScreenVal(int val){

    screenVal = val;
    notifyListeners();    
  }

}