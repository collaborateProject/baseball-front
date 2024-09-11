import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:baseball_front/diary/widget/Calendar.dart';
import 'package:baseball_front/setting/SettingDrawer.dart';
import 'package:baseball_front/menu/CustomBottomNavigatorBar.dart';
import 'package:baseball_front/diary/page/WriteDiaryPage.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  late DateTime selectedDay = DateTime.now();

  void onDaySelected(DateTime selected) {
    setState(() {
      selectedDay = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.7272727273, 783.2727272727),
      child: MaterialApp(
        title: "diary_page",
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
              appBar: AppBar(
                backgroundColor: Color(0xffF1EADC),
                // leading: IconButton(
                //   icon: Icon(Icons.menu),
                //   onPressed: null,
                //   color: Color(0xff837C6F),
                // ),
              ),
              body: Container(
                width: 400.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 30.h),
                        child: Calendar(
                          onDaySelected: onDaySelected,
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 30.h),
                      width: 270.w,
                      height: 60.h,
                      // decoration: BoxDecoration(
                      //   color: Colors.yellow,
                      // ),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WriteDiaryPage(
                                      date: selectedDay,
                                      watch: "",
                                      stardium: "",
                                      team1: "",
                                      team2: "",
                                      score1: 0,
                                      score2: 0,
                                      review: "")));
                        },
                        style: OutlinedButton.styleFrom(
                            foregroundColor: Color(0xffD8CEBA),
                            side: BorderSide(
                                color: Color(0xff837C6F), width: 1.5)),
                        child: Text(
                          "일기 작성하기",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Color(0xff837C6F),
                              fontFamily: 'KBODiaMedium'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              drawer: Drawer(child: SettingDrawer()),
              backgroundColor: Color(0xffF1EADC),
              bottomNavigationBar: CustomBottomNavigatorBar(page: 1),
            );
          },
        ),
      ),
    );
  }
}
