import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PhotosScreen extends StatefulWidget {
  final List<File> imageList;

  const PhotosScreen({super.key, required this.imageList});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Photos "),
          leading: Padding(
            padding: EdgeInsets.only(
              left: 2.w,
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                // color: ColorConstants.profilebutton,
                size: 20,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0),
              itemCount: widget.imageList.length,
              itemBuilder: (BuildContext context, index) {
                return SizedBox(
                  height: 16.h,
                  width: 16.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.sp),
                    child: widget.imageList[index] == File("")
                        ? Image.asset(
                            "assets/image/placeholdeer_transparent.png")
                        : Image.file(
                            widget.imageList[index],
                            fit: BoxFit.cover,
                          ),
                  ),
                );
                // return SizedBox(
                //   height: 16.h,
                //   width: 16.h,
                //   child: Stack(
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.only(top: 1.h),
                //         child: Container(
                //           height: 11.h,
                //           width: 11.h,
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(6.sp)),
                //           child: ClipRRect(
                //             borderRadius: BorderRadius.circular(6.sp),
                //             child: widget.imageList[index] == File("")
                //                 ? Image.asset(
                //                     "assets/image/placeholdeer_transparent.png")
                //                 : Image.file(
                //                     widget.imageList[index],
                //                     fit: BoxFit.cover,
                //                   ),
                //           ),
                //         ),
                //       ),
                //       Positioned(
                //           top: -2,
                //           right: -2,
                //           child: InkWell(
                //             onTap: () {
                //               setState(() {
                //                 widget.imageList.removeAt(index);
                //               });
                //             },
                //             child: Container(
                //               height: 3.5.h,
                //               width: 3.5.h,
                //               decoration: BoxDecoration(
                //                   color: Colors.white,
                //                   borderRadius: BorderRadius.circular(100)),
                //               child: const Icon(
                //                 Icons.highlight_remove_sharp,
                //                 color: ColorConstants.primaryColor,
                //                 size: 23,
                //               ),
                //             ),
                //           )),
                //     ],
                //   ),
                // );
              }),
        ));
  }
}
