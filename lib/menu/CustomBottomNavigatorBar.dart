import 'package:baseball_front/diary/page/DiaryPage.dart';
import 'package:baseball_front/main.dart';
import 'package:baseball_front/rate/page/WinningRatePage.dart';
import 'package:baseball_front/ticket/page/TicketPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigatorBar extends StatefulWidget {
  final int page;
  const CustomBottomNavigatorBar({Key? key, required this.page})
      : super(key: key);

  @override
  _CustomBottomNavigatorBarState createState() =>
      _CustomBottomNavigatorBarState();
}

class _CustomBottomNavigatorBarState extends State<CustomBottomNavigatorBar> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.7272727273, 783.2727272727),
      child: Container(
        height: 90.h,
        decoration: BoxDecoration(
          color: Color(0xffBED7DC),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildIconButton(Icons.insert_chart_outlined, 0, "승률"),
            _buildIconButton(Icons.edit_calendar, 1, "일기"),
            _buildIconButton(Icons.confirmation_number, 2, "티켓")
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, int pageIndex, String name) {
    return Column(
      children: <Widget>[
        IconButton(
            onPressed: () async {
              if (pageIndex == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WinningRatePage()),
                );
              } else if (pageIndex == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DiaryPage()),
                );
              } else if (pageIndex == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TicketPage()),
                );
              }
            },
            icon: Icon(icon),
            color: widget.page == pageIndex
                ? Color(0xff4E5B5F)
                : Color(0xff6D8B91)),
        Text(name,
            style: TextStyle(
                color: widget.page == pageIndex
                    ? Color(0xff4E5B5F)
                    : Color(0xff6D8B91)))
      ],
    );
  }
}
