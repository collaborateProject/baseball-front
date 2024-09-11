import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingDrawer extends StatefulWidget {
  const SettingDrawer({Key? key}) : super(key: key);

  @override
  State<SettingDrawer> createState() => _SettingDrawerState();
}

class _SettingDrawerState extends State<SettingDrawer> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.7272727273, 783.2727272727),
      child: MaterialApp(
        title: "setting_drawer",
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
                width: double.infinity,
                height: double.infinity,
                color: Color(0xffB3C8CF),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          print("마이팀 설정됨");
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 30.w),
                          width: double.infinity,
                          // color: Colors.yellow,
                          child: Text(
                            "마이팀 설정하기",
                            style: TextStyle(
                                fontSize: 17.sp,
                                color: Color(0xff4E5B5F),
                                fontFamily: 'KBODiaMedium'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          print("데이터 초기화 됨");
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 30.w),
                          width: double.infinity,
                          // color: Colors.yellow,
                          child: Text(
                            "데이터 초기화하기",
                            style: TextStyle(
                                fontSize: 17.sp,
                                color: Color(0xff4E5B5F),
                                fontFamily: 'KBODiaMedium'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          print("로그아웃");
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 30.w),
                          width: double.infinity,
                          // color: Colors.yellow,
                          child: Text(
                            "로그아웃",
                            style: TextStyle(
                                fontSize: 17.sp,
                                color: Color(0xff4E5B5F),
                                fontFamily: 'KBODiaMedium'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
