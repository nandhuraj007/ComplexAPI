import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restapicrud/model/data_controller.dart';

class UserController extends GetxController{
  var userData=<ModelClass>[].obs;
  var loading=true.obs;
  getData()async{
    loading.value=true;
    String url="https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad";
    try{
      var res=await http.get(Uri.parse(url));
      if(res.statusCode==200){
        userData.value=List<ModelClass>.from(json.decode(res.body).map((x)=>ModelClass.fromJson(x))).toList();
        loading.value=false;
      }
    }catch(e){
      loading.value=false;
      Get.snackbar("title", "$e");
    }
  }
  @override
  void onInit() {
    getData();
    super.onInit();
  }
}