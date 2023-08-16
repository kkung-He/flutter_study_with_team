import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime? selectedDay; // 처음에 선택이 안되어있게 해도 되고, DateTime.now() 넣어서 지정해도 됨
  final defaultBoxDeco = BoxDecoration(
    borderRadius: BorderRadius.circular(6.0),
    color: Colors.grey[200], // 주말을 제외한 평일날의 색상을 표시
  );
  final defaultTextStyle = TextStyle(
    color: Colors.grey[600],
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        // 선택 가능한 날짜들과 이전 달 혹은 다음 달의 색상을 다르게 지정
        defaultDecoration: defaultBoxDeco,
        weekendDecoration: defaultBoxDeco,
        // 선택 된 날짜의 스타일 지정
        selectedDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: PRIMARY_COLOR,
            width: 1.0,
          ),
        ),
        defaultTextStyle: defaultTextStyle,
        weekendTextStyle: defaultTextStyle,
        selectedTextStyle: defaultTextStyle.copyWith(color: PRIMARY_COLOR),
      ),
      onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
        setState(() {
          print(selectedDay);
          this.selectedDay = selectedDay;
        });
      },
      selectedDayPredicate: (DateTime date) {
        if (selectedDay == null) {
          return false;
        }
        //date == selectedDay 라고 안하는 이유는 시,분,초 까지 같은 필요는 없으므로.
        // 연도, 달, 날짜만 체크
        return date.year == selectedDay!.year &&
            date.month == selectedDay!.month &&
            date.day == selectedDay!.day;
      },
    );
  }
}
