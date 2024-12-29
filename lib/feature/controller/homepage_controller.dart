import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController{


  final pwlController = TextEditingController();
  final pwhController = TextEditingController();
  double pwl = 0;
  double pwh = 0;
  double rangWeek = 0;
  double adrZone = 0;
  double adr = 0;
  List<double> listADR = [];


  Future<void> clearData()async{
    pwl = 0;
    pwh = 0;
    rangWeek = 0;
    adrZone = 0;
    adr = 0;
    listADR.clear();
    update();
  }
  Future<void> resetData()async{
    await clearData();
    pwlController.text = '';
    pwhController.text = '';
    update();
  }
  Future<void> copyonTap({required int index})async{
    Clipboard.setData(ClipboardData(text: listADR[index].toString()));
  }
  Future<void> onADRTap()async{
    await clearData();

    pwh = double.parse(pwhController.text);
    pwl = double.parse(pwlController.text);
    rangWeek = (pwh - pwl)/5;
 
    for(int i =0; i<5;i++){
      if(i==0){
        adrZone = pwh-rangWeek;
        listADR.add(adrZone);
      }else{
         adrZone = adrZone-rangWeek;
        listADR.add(adrZone);
      }
    }
    update();
    rangWeek = double.parse(rangWeek.toStringAsFixed(2));
    for(int i =0; i<5;i++){
      listADR[i] = double.parse(listADR[i].toStringAsFixed(2));
    }
    update();
  }
}