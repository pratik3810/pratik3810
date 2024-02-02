// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class ImagePickerController extends GetxController {
//   static final ImagePickerController shared = ImagePickerController._internal();

//   factory ImagePickerController() {
//     return shared;
//   }

//   ImagePickerController._internal();

//   RxString imagePath = RxString('');

//   Future<void> pickImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);

//     if (pickedFile != null) {
//       imagePath.value = pickedFile.path;
//     } else {
//       print('No image selected');
//     }
//   }
// }
// import 'package:get/get.dart';

// class Test extends GetxController {
//   static final Test shared = Test._internal();

//   factory Test(){
//     return shared;
//   }

//   Test._internal {

//   }

//   RxString addtext = RxString('');
//     RxString removetext = RxString('');
//   RxString count = RxString('');

// }

import 'package:get/get.dart';

class TestController extends GetxController {
  static final TestController shared = TestController._internal();

  factory TestController() {
    return shared;
  }

  TestController._internal();

  // RxString addtext = RxString('');
  // RxString removetext = RxString('');
  RxInt count = RxInt(0);
}
