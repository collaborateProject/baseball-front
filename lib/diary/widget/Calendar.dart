import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  final Function(DateTime) onDaySelected;
  const Calendar({Key? key, required this.onDaySelected}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDay =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.7272727273, 783.2727272727),
      child: MaterialApp(
        title: "calendar",
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        home: Builder(
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  //color: Colors.yellow,
                  //margin: EdgeInsets.only(top: 50.h),
                  width: 370.w,
                  child: TableCalendar(
                    rowHeight: 60.h,
                    locale: 'ko-KR',
                    focusedDay: focusedDay,
                    firstDay: DateTime.utc(1981, 12, 11),
                    lastDay: DateTime.utc(3000, 12, 31),
                    // 달력 헤더
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                          fontSize: 15.sp,
                          color: Color(0xff837C6F),
                          fontFamily: 'KBODiaMedium',
                          decoration: TextDecoration.none),
                      formatButtonVisible: false,
                    ),
                    // 요일 텍스트 스타일
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                        fontSize: 13.sp,
                        color: Color(0xff837C6F),
                        fontFamily: 'KBODiaMedium',
                        decoration: TextDecoration.none,
                      ),
                      weekendStyle: TextStyle(
                        fontSize: 13.sp,
                        color: Color(0xff4E5B5F),
                        fontFamily: 'KBODiaMedium',
                        decoration: TextDecoration.none,
                      ),
                    ),
                    // 달력 모양
                    calendarStyle: CalendarStyle(
                      isTodayHighlighted: false,
                      defaultTextStyle: TextStyle(
                          fontSize: 13.sp,
                          color: Color(0xff837C6F),
                          fontFamily: 'KBODiaMedium',
                          decoration: TextDecoration.none),
                      outsideTextStyle: TextStyle(
                          fontSize: 13.sp,
                          color: Color(0xffACA18B),
                          fontFamily: 'KBODiaMedium',
                          decoration: TextDecoration.none),
                      weekendTextStyle: TextStyle(
                          fontSize: 13.sp,
                          color: Color(0xff4E5B5F),
                          fontFamily: 'KBODiaMedium',
                          decoration: TextDecoration.none),
                      selectedTextStyle: TextStyle(
                          fontSize: 13.sp,
                          color: Color(0xff6D8B91),
                          fontFamily: 'KBODiaMedium',
                          decoration: TextDecoration.none),
                      selectedDecoration: BoxDecoration(
                        color: Color(0xffBED7DC),
                        shape: BoxShape.circle,
                      ),
                    ),
                    onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                      setState(() {
                        this.selectedDay = selectedDay;
                        this.focusedDay = focusedDay;
                      });
                      widget.onDaySelected(selectedDay);
                    },
                    selectedDayPredicate: (DateTime day) {
                      return isSameDay(selectedDay, day);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
