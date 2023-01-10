import 'package:ecommerce_app_with_stock/controller/database_controller.dart';
import 'package:ecommerce_app_with_stock/helper/SQLDataBaseHelper.dart';
import 'package:ecommerce_app_with_stock/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  ProductController productController = Get.put(ProductController());
  await GetStorage.init();
  final box = GetStorage();

  bool isAppInit = box.read('isAppInit') ?? false;

  if(!isAppInit){
  await SQLDataBaseHelper.sqlDataBaseHelper.loadString(path: "assets/json/product_data.json");
  box.write('isAppInit', true);
  print("----------------------------");
  print("App  init");
  print("----------------------------");
  }

  productController.getData();

  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
