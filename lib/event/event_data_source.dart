import 'dart:ui';

import 'package:event_manager/event/event_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// datasource tham khảo thư viện syncfusion_flutter_calendar tại pubdev
class EventDataSource extends CalendarDataSource {
  EventDataSource(List<EventModel> source) {
    appointments = source ;
  }
  
  @override
  DateTime getStartTime(int index) {
    EventModel item = appointments!.elementAt(index);
    return item.startTime;
  }
  
  @override
  DateTime getEndTime(int index) {
    EventModel item = appointments!.elementAt(index);
    return item.endTime;
  }

  @override
  String getSubject(int index) {
    EventModel item = appointments!.elementAt(index);
    return item.subject;
  }

  @override
  String? getEndTimeZone(int index) {
    EventModel item = appointments!.elementAt(index);
    return item.notes;
  }

  @override
  bool isAllDay(int index) {
    EventModel item = appointments!.elementAt(index);
    return item.isAllDay;
  }

  @override
  String? getRecurrenceRule(int index) {
    EventModel item = appointments!.elementAt(index);
    return item.recurrenceRule;
  }

  @override
  Color getColor(int index) {
    EventModel item = appointments!.elementAt(index);
    return item.isAllDay ? const Color.fromARGB(0, 61, 148, 141): super.getColor(index);
  }
}