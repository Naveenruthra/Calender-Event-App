import 'dart:convert';

class Event {
  final String createdAt;
  final String title;
  final String description;
  final String status;
  final String startAt;
  final int duration;
  final String id;
  Event({
    required this.createdAt,
    required this.title,
    required this.description,
    required this.status,
    required this.startAt,
    required this.duration,
    required this.id,
  });

  factory Event.fromJson(Map<String, dynamic> map) {
    return Event(
      createdAt: map['createdAt'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      status: map['status'] ?? '',
      startAt: map['startAt'] ?? '',
      duration: map['duration'] ?? '',
      id: map['id'] ?? '',
    );
  }

  static List<Event> eventList(List json) {
    return json.map(
      (e) {
        return Event.fromJson(e);
      },
    ).toList();
  }
}
