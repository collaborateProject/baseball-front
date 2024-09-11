import 'package:baseball_front/diary/page/WriteDiaryPage.dart';
import 'package:baseball_front/ticket/page/TicketPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ViewDiaryPage extends StatefulWidget {
  final DateTime date;
  final String watch;
  // 아이콘도 가져와야 함
  final String stardium;
  final String team1;
  final String team2;
  final int score1;
  final int score2;
  final String review;
  const ViewDiaryPage(
      {Key? key,
      required this.date,
      required this.watch,
      required this.stardium,
      required this.team1,
      required this.team2,
      required this.score1,
      required this.score2,
      required this.review})
      : super(key: key);

  @override
  State<ViewDiaryPage> createState() => _ViewDiaryPageState();
}

class _ViewDiaryPageState extends State<ViewDiaryPage> {
  late DateTime _date = widget.date;
  late String _watch = widget.watch;
  late String _stardium = widget.stardium;
  late String _team1 = widget.team1;
  late String _team2 = widget.team2;
  late int _score1 = widget.score1;
  late int _score2 = widget.score2;
  late String _review = widget.review;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.7272727273, 783.2727272727),
      child: MaterialApp(
        title: "diary_view_page",
        localizationsDelegates: const [],
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
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TicketPage()));
                  },
                  icon: Icon(Icons.chevron_left),
                  color: Color(0xff2F2C25),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WriteDiaryPage(
                                  date: _date,
                                  watch: _watch,
                                  stardium: _stardium,
                                  team1: _team1,
                                  team2: _team2,
                                  score1: _score1,
                                  score2: _score2,
                                  review: _review)));
                    },
                    icon: Icon(Icons.create),
                    color: Color(0xff2F2C25),
                  )
                ],
              ),
              body: Container(
                margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
                padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    width: 2.w,
                    color: Color(0xffC9BEA8),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateFormat("yyyy년 MM월 dd일 E요일", 'ko_KR')
                                  .format(_date)
                                  .toString(),
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'KBODiaLight',
                                color: Color(0xff2F2C25),
                              ),
                            ),
                            Text(
                              _watch,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'KBODiaLight',
                                color: Color(0xff2F2C25),
                              ),
                            ),
                          ]),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        width: 170.w,
                        height: 170.h,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Text(
                        _stardium,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: 'KBODiaLight',
                          color: Color(0xff837C6F),
                        ),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Text(
                        "${_team1} vs ${_team2}",
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontFamily: 'KBODiaLight',
                          color: Color(0xff2F2C25),
                        ),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Text(
                        "${_score1.toString()} : ${_score2.toString()}",
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontFamily: 'KBODiaLight',
                          color: Color(0xff2F2C25),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 120.w,
                            height: 2.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.w,
                                color: Color(0xffC9BEA8),
                              ),
                            ),
                          ),
                          Text(
                            "REVIEW",
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontFamily: 'KBODiaMedium',
                                color: Color(0xff837C6F)),
                          ),
                          Container(
                            width: 120.w,
                            height: 2.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.w,
                                color: Color(0xffC9BEA8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        _review,
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: 'KBODiaLight',
                            color: Color(0xff837C6F)),
                      ),
                    ],
                  ),
                ),
              ),
              backgroundColor: Color(0xffF1EADC),
            );
          },
        ),
      ),
    );
  }
}
