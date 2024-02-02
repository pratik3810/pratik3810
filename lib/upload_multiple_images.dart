import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/photos_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

class UploadMultipleImages extends StatefulWidget {
  const UploadMultipleImages({super.key});

  @override
  State<UploadMultipleImages> createState() => _UploadMultipleImagesState();
}

class _UploadMultipleImagesState extends State<UploadMultipleImages> {
  List<File> _imageList = [];
  Future<void> _getStoragePermission() async {
    var request = Platform.isAndroid
        ? await Permission.storage.request()
        : await Permission.photos.request();

    if (request.isGranted) {
      await _getImage();
    } else if (request.isPermanentlyDenied) {
      await openAppSettings();
    } else if (request.isLimited) {
      await _getImage();
    }
  }

  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().pickMultiImage(
      imageQuality: 70,
      maxWidth: 800,
      maxHeight: 800,
    );
    if (pickedFile.isNotEmpty) {
      setState(() {
        _imageList
            .addAll(pickedFile.map((file) => File(file.path)).toSet().toList());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2.h, left: 0.w),
          child: Text(
            "Upload multiple images",
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        InkWell(
          onTap: () async {
            _getStoragePermission();
          },
          child: Container(
            height: 5.h,
            width: 100.w,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black54, width: 1.sp),
                borderRadius: BorderRadius.circular(11)),
            child: Padding(
              padding: EdgeInsets.only(left: 2.w),
              child: Row(
                children: [
                  Text(
                    "Upload multiple images",
                    textAlign: TextAlign.left,
               
                  ),
                ],
              ),
            ),
          ),
        ),
        _imageList.isEmpty
            ? Container()
            : SizedBox(
                height: _imageList.length > 3 ? 30.h : 15.h,
                width: 100.w,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 2.h, left: 4.w, right: 4.w, bottom: 1.h),
                  child: GridView.builder(
                      itemCount: _imageList.length > 6 ? 6 : _imageList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 2.w,
                          crossAxisSpacing: 5.w,
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        if (index == 5) {
                          return SizedBox(
                            height: 16.h,
                            width: 16.h,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 1.h),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PhotosScreen(
                                                      imageList: _imageList)));
                                    },
                                    child: Container(
                                      height: 11.h,
                                      width: 11.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6.sp)),
                                      child: SizedBox(
                                        height: 11.h,
                                        width: 11.h,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6.sp),
                                          child: _imageList[index] == File("")
                                              ? Image.asset(
                                                  "assets/image/placeholdeer_transparent.png")
                                              : Image.file(
                                                  _imageList[index],
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: -2,
                                    right: -2,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _imageList.removeAt(index);
                                        });
                                      },
                                      child: Container(
                                        height: 3.5.h,
                                        width: 3.5.h,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: const Icon(
                                          Icons.highlight_remove_sharp,
                                          size: 23,
                                        ),
                                      ),
                                    )),
                                Positioned(
                                    top: 10,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PhotosScreen(
                                                        imageList:
                                                            _imageList)));
                                      },
                                      child: Container(
                                        height: 11.h,
                                        width: 11.h,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right: 4.5.w, left: 4.5.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.add,
                                                size: 16.sp,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                "11",
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: 16.h,
                            width: 16.h,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 1.h),
                                  child: Container(
                                    height: 11.h,
                                    width: 11.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.sp)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6.sp),
                                      child: _imageList[index] == File("")
                                          ? Image.asset(
                                              "assets/image/placeholdeer_transparent.png")
                                          : Image.file(
                                              _imageList[index],
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: -2,
                                    right: -2,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _imageList.removeAt(index);
                                        });
                                      },
                                      child: Container(
                                        height: 3.5.h,
                                        width: 3.5.h,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: const Icon(
                                          Icons.highlight_remove_sharp,
                                          size: 23,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          );
                        }
                      }),
                ),
              ),
      ],
    );
  }
}







//  List<File> _imageList = [];
//   Future<void> _getStoragePermission() async {
//     var request = Platform.isAndroid
//         ? await Permission.storage.request()
//         : await Permission.photos.request();

//     if (request.isGranted) {
//       await _getImage();
//     } else if (request.isPermanentlyDenied) {
//       await openAppSettings();
//     } else if (request.isLimited) {
//       await _getImage();
//     }
//   }

//   Future<void> _getImage() async {
//     final pickedFile = await ImagePicker().pickMultiImage(
//       imageQuality: 70,
//       maxWidth: 800,
//       maxHeight: 800,
//     );
//     if (pickedFile.isNotEmpty) {
//       setState(() {
//         _imageList
//             .addAll(pickedFile.map((file) => File(file.path)).toSet().toList());
//       });
//     }
//   }


                           //  Padding(
                            //   padding: EdgeInsets.only(top: 2.h, left: 0.w),
                            //   child: Text(
                            //     "Upload multiple images",
                            //     style: CommonTextStyles().normalTextStyle,
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 1.h,
                            // ),
                            // InkWell(
                            //   onTap: () async {
                            //     _getStoragePermission();
                            //   },
                            //   child: Container(
                            //     height: 5.h,
                            //     width: 100.w,
                            //     decoration: BoxDecoration(
                            //         color: Colors.white,
                            //         border: Border.all(
                            //             color: Colors.black54, width: 1.sp),
                            //         borderRadius: BorderRadius.circular(11)),
                            //     child: Padding(
                            //       padding: EdgeInsets.only(left: 2.w),
                            //       child: Row(
                            //         children: [
                            //           Text(
                            //             "Upload multiple images",
                            //             textAlign: TextAlign.left,
                            //             style: CommonTextStyles()
                            //                 .texfieldHintTextStyle
                            //                 .copyWith(fontSize: 13.sp),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // _imageList.isEmpty
                            //     ? Container()
                            //     : SizedBox(
                            //         height: _imageList.length > 3 ? 30.h : 15.h,
                            //         width: 100.w,
                            //         child: Padding(
                            //           padding: EdgeInsets.only(
                            //               top: 2.h,
                            //               left: 4.w,
                            //               right: 4.w,
                            //               bottom: 1.h),
                            //           child: GridView.builder(
                            //               itemCount: _imageList.length > 6
                            //                   ? 6
                            //                   : _imageList.length,
                            //               gridDelegate:
                            //                   SliverGridDelegateWithFixedCrossAxisCount(
                            //                       mainAxisSpacing: 2.w,
                            //                       crossAxisSpacing: 5.w,
                            //                       crossAxisCount: 3),
                            //               itemBuilder: (context, index) {
                            //                 if (index == 5) {
                            //                   return SizedBox(
                            //                     height: 16.h,
                            //                     width: 16.h,
                            //                     child: Stack(
                            //                       children: [
                            //                         Padding(
                            //                           padding: EdgeInsets.only(
                            //                               top: 1.h),
                            //                           child: InkWell(
                            //                             onTap: () {
                            //                               Navigator.push(
                            //                                   context,
                            //                                   MaterialPageRoute(
                            //                                       builder: (context) =>
                            //                                           PhotosScreen(
                            //                                               imageList:
                            //                                                   _imageList)));
                            //                             },
                            //                             child: Container(
                            //                               height: 11.h,
                            //                               width: 11.h,
                            //                               decoration: BoxDecoration(
                            //                                   borderRadius:
                            //                                       BorderRadius
                            //                                           .circular(
                            //                                               6.sp)),
                            //                               child: SizedBox(
                            //                                 height: 11.h,
                            //                                 width: 11.h,
                            //                                 child: ClipRRect(
                            //                                   borderRadius:
                            //                                       BorderRadius
                            //                                           .circular(
                            //                                               6.sp),
                            //                                   child: _imageList[
                            //                                               index] ==
                            //                                           File("")
                            //                                       ? Image.asset(
                            //                                           "assets/image/placeholdeer_transparent.png")
                            //                                       : Image.file(
                            //                                           _imageList[
                            //                                               index],
                            //                                           fit: BoxFit
                            //                                               .cover,
                            //                                         ),
                            //                                 ),
                            //                               ),
                            //                             ),
                            //                           ),
                            //                         ),
                            //                         Positioned(
                            //                             top: -2,
                            //                             right: -2,
                            //                             child: InkWell(
                            //                               onTap: () {
                            //                                 setState(() {
                            //                                   _imageList
                            //                                       .removeAt(
                            //                                           index);
                            //                                 });
                            //                               },
                            //                               child: Container(
                            //                                 height: 3.5.h,
                            //                                 width: 3.5.h,
                            //                                 decoration: BoxDecoration(
                            //                                     color: Colors
                            //                                         .white,
                            //                                     borderRadius:
                            //                                         BorderRadius
                            //                                             .circular(
                            //                                                 100)),
                            //                                 child: const Icon(
                            //                                   Icons
                            //                                       .highlight_remove_sharp,
                            //                                   color: ColorConstants
                            //                                       .primaryColor,
                            //                                   size: 23,
                            //                                 ),
                            //                               ),
                            //                             )),
                            //                         Positioned(
                            //                             top: 10,
                            //                             child: InkWell(
                            //                               onTap: () {
                            //                                 Navigator.push(
                            //                                     context,
                            //                                     MaterialPageRoute(
                            //                                         builder: (context) =>
                            //                                             PhotosScreen(
                            //                                                 imageList:
                            //                                                     _imageList)));
                            //                               },
                            //                               child: Container(
                            //                                 height: 11.h,
                            //                                 width: 11.h,
                            //                                 decoration:
                            //                                     BoxDecoration(
                            //                                   color: Colors
                            //                                       .white
                            //                                       .withOpacity(
                            //                                           0.2),
                            //                                 ),
                            //                                 child: Padding(
                            //                                   padding: EdgeInsets
                            //                                       .only(
                            //                                           right:
                            //                                               4.5.w,
                            //                                           left: 4.5
                            //                                               .w),
                            //                                   child: Row(
                            //                                     mainAxisAlignment:
                            //                                         MainAxisAlignment
                            //                                             .spaceBetween,
                            //                                     children: [
                            //                                       Icon(
                            //                                         Icons.add,
                            //                                         size: 16.sp,
                            //                                         color: Colors
                            //                                             .white,
                            //                                       ),
                            //                                       Text(
                            //                                         "11",
                            //                                         style: TextStyle(
                            //                                             fontSize: 14
                            //                                                 .sp,
                            //                                             color: Colors
                            //                                                 .white),
                            //                                       )
                            //                                     ],
                            //                                   ),
                            //                                 ),
                            //                               ),
                            //                             ))
                            //                       ],
                            //                     ),
                            //                   );
                            //                 } else {
                            //                   return SizedBox(
                            //                     height: 16.h,
                            //                     width: 16.h,
                            //                     child: Stack(
                            //                       children: [
                            //                         Padding(
                            //                           padding: EdgeInsets.only(
                            //                               top: 1.h),
                            //                           child: Container(
                            //                             height: 11.h,
                            //                             width: 11.h,
                            //                             decoration: BoxDecoration(
                            //                                 borderRadius:
                            //                                     BorderRadius
                            //                                         .circular(
                            //                                             6.sp)),
                            //                             child: ClipRRect(
                            //                               borderRadius:
                            //                                   BorderRadius
                            //                                       .circular(
                            //                                           6.sp),
                            //                               child: _imageList[
                            //                                           index] ==
                            //                                       File("")
                            //                                   ? Image.asset(
                            //                                       "assets/image/placeholdeer_transparent.png")
                            //                                   : Image.file(
                            //                                       _imageList[
                            //                                           index],
                            //                                       fit: BoxFit
                            //                                           .cover,
                            //                                     ),
                            //                             ),
                            //                           ),
                            //                         ),
                            //                         Positioned(
                            //                             top: -2,
                            //                             right: -2,
                            //                             child: InkWell(
                            //                               onTap: () {
                            //                                 setState(() {
                            //                                   _imageList
                            //                                       .removeAt(
                            //                                           index);
                            //                                 });
                            //                               },
                            //                               child: Container(
                            //                                 height: 3.5.h,
                            //                                 width: 3.5.h,
                            //                                 decoration: BoxDecoration(
                            //                                     color: Colors
                            //                                         .white,
                            //                                     borderRadius:
                            //                                         BorderRadius
                            //                                             .circular(
                            //                                                 100)),
                            //                                 child: const Icon(
                            //                                   Icons
                            //                                       .highlight_remove_sharp,
                            //                                   color: ColorConstants
                            //                                       .primaryColor,
                            //                                   size: 23,
                            //                                 ),
                            //                               ),
                            //                             )),
                            //                       ],
                            //                     ),
                            //                   );
                            //                 }
                            //               }),
                            //         ),
                            //       ),
                         
                         
                         