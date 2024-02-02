import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/cont.dart';
import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: HomeScreen(),
      home: HomePage(),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   final ImagePickerController imageController = ImagePickerController();

//   HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Image Picker Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Obx(() => imageController.imagePath.value.isNotEmpty
//                 ? Image.file(
//                     File(imageController.imagePath.value),
//                     height: 200,
//                   )
//                 : Container(
//                     color: Colors.grey,
//                     height: 200,
//                   )),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => imageController.pickImage(ImageSource.gallery),
//               child: const Text('Pick from Gallery'),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () => imageController.pickImage(ImageSource.camera),
//               child: const Text('Capture from Camera'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  final TestController imageController = TestController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: const Text("pratik"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100, top: 200),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    TestController.shared.count.value += 1;
                  },
                  child: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
                Obx(
                  () => Text(
                    TestController.shared.count.value.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                InkWell(
                    onTap: () {
                      TestController.shared.count.value -= 1;
                    },
                    child: const Icon(Icons.remove))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  TestController.shared.count.value = 0;
                },
                child: const Icon(Icons.refresh))
          ],
        ),
      ),
    );
  }
}
