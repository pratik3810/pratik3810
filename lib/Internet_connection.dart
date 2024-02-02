// add to main dart  ****************************************************************************

 //  return StreamProvider<InternetConnectionStatus>(
  //       initialData: InternetConnectionStatus.connected,
  //       create: (_) {
  //         return InternetConnectionChecker().onStatusChange;
  //       },
  //       builder: (context, snapshot) {
  //         return Sizer(
  //           builder: (context, orientation, deviceType) {
  //             return MaterialApp(
  //               theme: ThemeData(
  //                 primaryColor: ColorConstants.primaryColor,
  //                 textSelectionTheme: const TextSelectionThemeData(
  //                   cursorColor: ColorConstants.primaryColor,
  //                   selectionHandleColor: Colors.transparent,
  //                 ),
  //                 visualDensity: VisualDensity.adaptivePlatformDensity,
  //               ),
  //               debugShowCheckedModeBanner: false,
  //               title: 'One Two One',
  //               // home: StaffLogin(),
  //               // home: isBusiness == true
  //               //     ? const BottomNavigationStaff()
  //               //     : const BottomNavigation(),
  //             );
  //           },
  //         );
  //       });

  //  ui code  **************************************************************************************

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:sizer/sizer.dart';
// import 'package:provider/provider.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';


// class InternetNotAvailable extends StatelessWidget {
//   const InternetNotAvailable({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 3.5.h,
//       width: 100.w,
//       color: Colors.red,
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.only(bottom: 3),
//           child: Text(
//             'No Internet Connection !',
//             style: TextStyle(
//               decoration: TextDecoration.none,
//               color: Colors.white,
//               fontWeight: FontWeight.w600,
//               letterSpacing: 1.3,
//               fontSize: 10.sp,
//               fontFamily: GoogleFonts.sansita().fontFamily,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


    // Visibility(
    //                 visible: Provider.of<InternetConnectionStatus>(context) ==
    //                     InternetConnectionStatus.disconnected,
    //                 child: const InternetNotAvailable(),
    //               ),
