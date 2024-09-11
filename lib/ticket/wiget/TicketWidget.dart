import 'package:baseball_front/diary/page/ViewDiaryPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TicketWidget extends StatefulWidget {
  const TicketWidget({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  _TicketWidgetState createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  late String _team1 = "NC 다이노스";
  late String _team2 = "키움 히어로즈";
  late int _score1 = 0;
  late int _score2 = 0;
  late DateTime _date = DateTime.now();
  late String _stardium = "고척스카이돔";
  late String _review = "리이이뷰우우";
  late String _watch = "직관";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ViewDiaryPage(
                      date: _date,
                      watch: _watch,
                      stardium: _stardium,
                      team1: _team1,
                      team2: _team2,
                      score1: _score1,
                      score2: _score2,
                      review: _review)));
        },
        child: Stack(
          children: [
            //티켓 이미지
            Container(
              margin: EdgeInsets.fromLTRB(0, 5.h, 17.w, 5.h),
              color: Color(0xffB3C8CF),
              child: Container(
                padding: EdgeInsets.fromLTRB(10.w, 5.h, 10.w, 5.h),
                child:
                    Image.asset('assets/img/ticket.png', fit: BoxFit.contain),
              ),
            ),
            //홈 vs 원정
            Positioned(
              top: 28.h,
              left: 55.w,
              child: Container(
                  height: 47.h,
                  width: 250.w,
                  // color: Colors.yellow,
                  child: Center(
                      child: Column(
                    children: [
                      Text(
                        "${_team1} vs ${_team2}",
                        style: TextStyle(
                            fontFamily: 'KBODiaMedium', fontSize: 16.sp),
                      ),
                      Text(
                        "${_score1.toString()} : ${_score2.toString()}",
                        style: TextStyle(
                            fontFamily: 'KBODiaMedium', fontSize: 15.sp),
                      ),
                    ],
                  ))),
            ),
            //경기 날짜 & 시간
            Positioned(
              top: 76.h,
              left: 55.w,
              child: Container(
                  height: 33.h,
                  width: 192.w,
                  // color: Colors.green,
                  child: Center(
                    child: Text(
                      DateFormat("yyyy년 MM월 dd일 E요일", 'ko_KR')
                          .format(_date)
                          .toString(),
                      style: TextStyle(
                          fontFamily: 'KBODiaMedium', fontSize: 11.5.sp),
                    ),
                  )),
            ),
            //경기장
            Positioned(
              top: 105.h,
              left: 55.w,
              child: Container(
                  height: 35.h,
                  width: 192.w,
                  // color: Colors.orange,
                  child: Center(
                    child: Text(
                      _stardium,
                      style: TextStyle(
                          fontFamily: 'KBODiaMedium', fontSize: 11.5.sp),
                    ),
                  )),
            ),
            // 아이콘
            Positioned(
              top: 81.h,
              left: 250.w,
              child: Container(
                  height: 55.h,
                  width: 55.w,
                  // color: Colors.yellow,
                  child: Center(
                      child: Container(
                    color: Colors.yellow,
                  )
                      // Image.asset(
                      //     'assets/img/${_buildMarker(widget.ticketData.liveType, widget.ticketData.isWin)}.png',
                      //     width: 55.w,
                      //     height: 55.h,
                      //     fit: BoxFit.contain),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
