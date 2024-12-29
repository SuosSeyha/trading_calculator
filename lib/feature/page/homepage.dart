import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_calculator/feature/controller/homepage_controller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = Get.put(HomepageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.purple,
        title: const Text(
          'Previous Day Rang in Weekly'
        ),
        centerTitle: true,
      ),
      body: GetBuilder<HomepageController>(
        builder: (_){
          return Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                 // color: Colors.amber,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0
                              ),
                              //color: Colors.pink,
                              child: TextField(
                                controller: homeController.pwhController,
                                decoration: InputDecoration(
                                  hintText: 'Previous Week High',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  )
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0
                              ),
                              //color: Colors.pink,
                              child: TextField(
                                controller: homeController.pwlController,
                                decoration: InputDecoration(
                                  hintText: 'Previous Week Low',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  )
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ZoomTapAnimation(
                            onTap: (){
                              homeController.onADRTap();
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 8.0
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8.0)
                              ),
                              child: const Text(
                                'Get ADR'
                              ),
                            ),
                          ),
                          ZoomTapAnimation(
                            onTap: (){
                              homeController.resetData();
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 8.0
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8.0)
                              ),
                              child: const Text(
                                'RESET'
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 10.0
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 8.0
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8.0)
                            ),
                            child:  Text(
                              'ADR: ${homeController.rangWeek}'
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ...List.generate(
                            homeController.listADR.length, 
                          (index){
                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 3
                          ),
                          width: 200,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10
                          ),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8.0)
                              ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ADR${index+1}: ${homeController.listADR[index]}'
                              ),
                              
                              ZoomTapAnimation(
                                onTap: (){
                                  homeController.copyonTap(index: index);
                                },
                                child: const Icon(Icons.copy),
                              )
                            ],
                          ),
                        );
                      })
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                 // color: Colors.red,
                ),
              ),

            ],
          );
        }
      )
    );
  }
}