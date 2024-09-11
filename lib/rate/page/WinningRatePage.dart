import 'package:baseball_front/rate/widget/OddPieChart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:baseball_front/menu/CustomBottomNavigatorBar.dart';

class WinningRatePage extends StatefulWidget {
  const WinningRatePage({Key? key}) : super(key: key);

  @override
  State<WinningRatePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WinningRatePage> {
  late int _year = DateTime.now().year;
  // 이 밑에 있는 것들은 DB에서 가져와서 바꿔야 됨
  final int _totalView = 10;
  final int _winningView = 7;
  final int _losingView = 2;
  final int _tieView = 1;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.7272727273, 783.2727272727),
      child: MaterialApp(
        title: "winning_rate",
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          iconSize: 50.sp,
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
                            fontSize: 25.sp,
                            fontFamily: 'KBODiaBold',
                            color: Color(0xff4E5B5F),
                          ),
                        ),
                        IconButton(
                          iconSize: 50.sp,
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
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 30.h, 0, 0),
                        width: 330.w,
                        //height: 150.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 2.w, color: Color(0xffC9BEA8))),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              "총 " + _totalView.toString() + "번의 관람 중",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: 'KBODiaMedium',
                                  color: Color(0xff2F2C25)),
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Text(
                              _winningView.toString() + "번 승리하였습니다.",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: 'KBODiaMedium',
                                  color: Color(0xff2F2C25)),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 30.h,
                    ),
                    OddPieChart()
                  ],
                ),
              ),
              backgroundColor: Color(0xffF1EADC),
              bottomNavigationBar: CustomBottomNavigatorBar(page: 0),
            );
          },
        ),
      ),
    );
  }
}
