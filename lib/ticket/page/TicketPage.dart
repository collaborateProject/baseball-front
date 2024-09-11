import 'package:baseball_front/ticket/wiget/TicketWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:baseball_front/menu/CustomBottomNavigatorBar.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  State<TicketPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TicketPage> {
  late int _year = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.7272727273, 783.2727272727),
      child: MaterialApp(
        title: "ticket_page",
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
                margin: EdgeInsets.only(left: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    // 년도
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          iconSize: 25.sp,
                          onPressed: () {
                            setState(() {
                              _year--;
                            });
                          },
                          icon: Icon(Icons.arrow_left),
                          color: Color(0xff6D8B91),
                        ),
                        Text(
                          _year.toString() + "년",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'KBODiaBold',
                            color: Color(0xff4E5B5F),
                          ),
                        ),
                        IconButton(
                          iconSize: 25.sp,
                          onPressed: () {
                            setState(() {
                              _year++;
                            });
                          },
                          icon: Icon(Icons.arrow_right),
                          color: Color(0xff6D8B91),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 45.h,
                    // ),
                    // 검색 Container
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "검색하기",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: 'KBODiaMedium',
                                  color: Color(0xff2F2C25),
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 10.h),
                                    height: 40.h,
                                    width: 300.w,
                                    child: SizedBox(
                                        child: TextField(
                                      maxLines: null,
                                      decoration: InputDecoration(
                                          hintText: "구단을 검색해주세요.",
                                          hintStyle: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'KBODiaMedium',
                                            color: Color(0xff837C6F),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xff2F2C25)),
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                    ))),
                                Container(
                                  margin: EdgeInsets.only(top: 5.h),
                                  child: IconButton(
                                    iconSize: 30.sp,
                                    onPressed: () {},
                                    icon: Icon(Icons.search),
                                    color: Color(0xff2F2C25),
                                  ),
                                )
                              ],
                            ),
                          ]),
                    ),
                    Container(
                      width: double.infinity,
                      height: 540.h,
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return TicketWidget();
                        },
                      ),
                    )
                  ],
                ),
              ),
              backgroundColor: Color(0xffF1EADC),
              bottomNavigationBar: CustomBottomNavigatorBar(page: 2),
            );
          },
        ),
      ),
    );
  }
}
