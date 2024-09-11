import 'package:baseball_front/diary/page/DiaryPage.dart';
import 'package:baseball_front/enum/PlayData.dart';
import 'package:baseball_front/ticket/page/TicketPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class WriteDiaryPage extends StatefulWidget {
  final DateTime date;
  final String watch;
  // 아이콘도 가져와야 함
  final String stardium;
  final String team1;
  final String team2;
  final int score1;
  final int score2;
  final String review;
  const WriteDiaryPage(
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
  State<WriteDiaryPage> createState() => _WriteDiaryPageState();
}

class _WriteDiaryPageState extends State<WriteDiaryPage> {
  late DateTime _date = widget.date;
  PlayData _playData = PlayData();
  late List<String> _watchList = _playData.getWatchList();
  String? _selectedWatch; // 현재 선택된 라디오 버튼의 값
  late List<String> _stadiumList = _playData.getStardiumList();
  String? _selectedStadium;
  late List<String> _teamList = _playData.getTeamList();
  String? _selectedTeam1;
  String? _selectedTeam2;
  int _homeScore = 0;
  int _awayScore = 0;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.7272727273, 783.2727272727),
      child: MaterialApp(
        title: "diary_write_page",
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
                        MaterialPageRoute(builder: (context) => DiaryPage()));
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
                              builder: (context) => TicketPage()));
                    },
                    icon: Icon(Icons.check),
                    color: Color(0xff2F2C25),
                  )
                ],
              ),
              body: Container(
                color: Color(0xffF1EADC),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // icon
                      Container(
                        margin: EdgeInsets.only(left: 20.w),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ICON *",
                              style: TextStyle(
                                fontFamily: "KBODiaBold",
                                fontSize: 15.sp,
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
                                  width: 50.w,
                                  height: 50.h,
                                  color: Colors.grey,
                                ),
                                Container(
                                  width: 50.w,
                                  height: 50.h,
                                  color: Colors.grey,
                                ),
                                Container(
                                  width: 50.w,
                                  height: 50.h,
                                  color: Colors.grey,
                                ),
                                Container(
                                  width: 50.w,
                                  height: 50.h,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      // Watch
                      Container(
                        margin: EdgeInsets.only(left: 20.w),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "WATCH *",
                              style: TextStyle(
                                fontFamily: "KBODiaBold",
                                fontSize: 15.sp,
                                color: Color(0xff2F2C25),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text(
                                      "직관",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'KBODiaMedium',
                                        color: Color(0xff837C6F),
                                      ),
                                    ),
                                    leading: Radio(
                                      value: _watchList[0],
                                      groupValue: _selectedWatch,
                                      onChanged: (String? value) {
                                        setState(() {
                                          _selectedWatch = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text(
                                      "집관",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'KBODiaMedium',
                                        color: Color(0xff837C6F),
                                      ),
                                    ),
                                    leading: Radio(
                                      value: _watchList[1],
                                      groupValue: _selectedWatch,
                                      onChanged: (String? value) {
                                        setState(() {
                                          _selectedWatch = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      // Date
                      Container(
                        margin: EdgeInsets.only(left: 20.w),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "DATE *",
                              style: TextStyle(
                                fontFamily: "KBODiaBold",
                                fontSize: 15.sp,
                                color: Color(0xff2F2C25),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20.h, 7.w, 0, 0),
                              width: double.infinity,
                              // color: Colors.yellow,
                              child: Text(
                                DateFormat("yyyy년 MM월 dd일 E요일", 'ko_KR')
                                    .format(_date)
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'KBODiaMedium',
                                  color: Color(0xff837C6F),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      // Stadium
                      Container(
                          margin: EdgeInsets.only(left: 20.w),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "STADIUM *",
                                style: TextStyle(
                                  fontFamily: "KBODiaBold",
                                  fontSize: 15.sp,
                                  color: Color(0xff2F2C25),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                width: 200.w,
                                margin: EdgeInsets.only(left: 20.w),
                                child: DropdownButton(
                                    hint: Text(
                                      "경기장을 선택해주세요.",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'KBODiaMedium',
                                        color: Color(0xff837C6F),
                                      ),
                                    ),
                                    value: _selectedStadium,
                                    items: _stadiumList.map((value) {
                                      return DropdownMenuItem(
                                          value: value, child: Text(value));
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedStadium = value;
                                      });
                                    }),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                      // TEAM
                      Container(
                          margin: EdgeInsets.only(left: 20.w),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "TEAM *",
                                style: TextStyle(
                                  fontFamily: "KBODiaBold",
                                  fontSize: 15.sp,
                                  color: Color(0xff2F2C25),
                                ),
                              ),
                              // SizedBox(
                              //   height: 10.h,
                              // ),
                              Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    DropdownButton(
                                        hint: Text(
                                          "탐을 선택해주세요.",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'KBODiaMedium',
                                            color: Color(0xff837C6F),
                                          ),
                                        ),
                                        value: _selectedTeam1,
                                        items: _teamList.map((value) {
                                          return DropdownMenuItem(
                                              value: value, child: Text(value));
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedTeam1 = value;
                                          });
                                        }),
                                    Text(
                                      "VS",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'KBODiaMedium',
                                        color: Color(0xff837C6F),
                                      ),
                                    ),
                                    DropdownButton(
                                        hint: Text(
                                          "탐을 선택해주세요.",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'KBODiaMedium',
                                            color: Color(0xff837C6F),
                                          ),
                                        ),
                                        value: _selectedTeam2,
                                        items: _teamList.map((value) {
                                          return DropdownMenuItem(
                                              value: value, child: Text(value));
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedTeam2 = value;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 70.w,
                                  ),
                                  Text(
                                    "AWAY",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'KBODiaMedium',
                                      color: Color(0xff837C6F),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 130.w,
                                  ),
                                  Text(
                                    "HOME",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'KBODiaMedium',
                                      color: Color(0xff837C6F),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                      // SCORE
                      Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20.w),
                                child: Text(
                                  "SCORE *",
                                  style: TextStyle(
                                    fontFamily: "KBODiaBold",
                                    fontSize: 15.sp,
                                    color: Color(0xff2F2C25),
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: 10.h,
                              // ),
                              Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                        width: 130.w,
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: "점수를 입력해주세요.",
                                            hintStyle: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: 'KBODiaMedium',
                                              color: Color(0xff837C6F),
                                            ),
                                          ),
                                        )),
                                    Text(
                                      " : ",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'KBODiaMedium',
                                        color: Color(0xff837C6F),
                                      ),
                                    ),
                                    SizedBox(
                                        width: 130.w,
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: "점수를 입력해주세요.",
                                            hintStyle: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: 'KBODiaMedium',
                                              color: Color(0xff837C6F),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 70.w,
                                  ),
                                  Text(
                                    "AWAY",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'KBODiaMedium',
                                      color: Color(0xff837C6F),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 130.w,
                                  ),
                                  Text(
                                    "HOME",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'KBODiaMedium',
                                      color: Color(0xff837C6F),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                      // REVIEW
                      Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(20.w, 0, 0, 10.h),
                                child: Text(
                                  "REVIEW",
                                  style: TextStyle(
                                    fontFamily: "KBODiaBold",
                                    fontSize: 15.sp,
                                    color: Color(0xff2F2C25),
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: 10.h,
                              // ),
                              Container(
                                  margin:
                                      EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.h),
                                  width: double.infinity,
                                  child: SizedBox(
                                      child: TextField(
                                    maxLines: null,
                                    decoration: InputDecoration(
                                        hintText: "자유롭게 후기를 작성해주세요.",
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
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 20.h,
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
