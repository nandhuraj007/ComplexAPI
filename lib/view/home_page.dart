import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:restapicrud/controller/data_controller.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
final controllers=Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Obx((){
        return controllers.loading.value? Center(child: CircularProgressIndicator()) :Container(
          child: GridView.builder(
            itemCount: controllers.userData.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (c,i){
              var data=controllers.userData.value[i];
                return Container(
                  child: Column(
                    children:  [
                      SizedBox(height: 30),
                      Text("Branch Name "+data.branchName.toString()),
                      Text("Restaurant Name "+data.restaurantName.toString()),
                    ],
                  ),
                );
              }),
        );
      }),
    );
  }
}
