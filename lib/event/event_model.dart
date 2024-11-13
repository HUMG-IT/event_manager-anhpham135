class EventModel {
  String? id;
  DateTime startTime;
  DateTime endTime;
  bool isAllDay;
  String subject;
  String? notes;
  String? recurrenceRule;

  // Constructor
  EventModel({
    this.id,
    required this.startTime,
    required this.endTime,
    this.isAllDay = false,
    this.subject = '',
    this.notes,
    this.recurrenceRule,
  });

  // Tạo đối tượng từ Map
  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'],
      startTime: DateTime.parse(map['startTime']),
      endTime: DateTime.parse(map['endTime']),
      isAllDay: map['isAllDay'] ?? false,
      subject: map['subject'] ?? '',
      notes: map['notes'],
      recurrenceRule: map['recurrenceRule'],
    );
  }

  // Tạo đối tượng từ JSON
  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel.fromMap(json);

  // Chuyển đối tượng thành Map
  Map<String, dynamic> toMap() => {
        'id': id,
        'startTime': startTime.toIso8601String(),
        'endTime': endTime.toIso8601String(),
        'isAllDay': isAllDay,
        'subject': subject,
        'notes': notes,
        'recurrenceRule': recurrenceRule,
      };

  // Chuyển đối tượng thành JSON
  Map<String, dynamic> toJson() => toMap();

  // Phương thức copyWith để tạo bản sao mới của đối tượng
  EventModel copyWith({
    String? id,
    DateTime? startTime,
    DateTime? endTime,
    bool? isAllDay,
    String? subject,
    String? notes,
    String? recurrenceRule,
  }) {
    return EventModel(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isAllDay: isAllDay ?? this.isAllDay,
      subject: subject ?? this.subject,
      notes: notes ?? this.notes,
      recurrenceRule: recurrenceRule ?? this.recurrenceRule,
    );
  }
}

// Extension để định dạng thời gian
extension ExtEventModel on EventModel {
  String get formatedStartTimeString =>
      '${startTime.hour}:${startTime.minute}, ${startTime.day}/${startTime.month}/${startTime.year}';
  String get formatedEndTimeString =>
      '${endTime.hour}:${endTime.minute}, ${endTime.day}/${endTime.month}/${endTime.year}';
}
