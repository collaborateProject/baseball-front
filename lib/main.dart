import 'package:baseball_front/diary/page/DiaryPage.dart';
import 'package:baseball_front/diary/widget/Calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:baseball_front/menu/CustomBottomNavigatorBar.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.7272727273, 783.2727272727),
      child: MaterialApp(
        title: "main_page",
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300.w,
                    height: 150.h,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 170.w,
                        height: 2.h,
                        color: Color(0xffC9BEA8),
                      ),
                      Text(
                        "로그인",
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: Color(0xffC9BEA8),
                            fontFamily: 'KBODiaLight'),
                      ),
                      Container(
                        width: 170.w,
                        height: 2.h,
                        color: Color(0xffC9BEA8),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Container(
                    width: 200.w,
                    height: 60.h,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DiaryPage()));
                      },
                      icon: Image.asset(
                        'assets/img/kakao_login.png',
                        width: double.infinity,
                        height: double.infinity,
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              )
                  //child: DiaryPage(),
                  ),
              backgroundColor: Color(0xffF1EADC),
            );
          },
        ),
      ),
    );
  }
}
