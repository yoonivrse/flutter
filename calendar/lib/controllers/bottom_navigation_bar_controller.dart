import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {

  final currentIndex = 0.obs;

  void changeIndex(int index){
    switch(index){
      case 0:
        Get.offAllNamed('/home');
        currentIndex.value = index;
        break;
      case 1:
        Get.offAllNamed('/test');
        currentIndex.value = index;
        break;
      default:
        throw('invalid index');
    }
  }
}