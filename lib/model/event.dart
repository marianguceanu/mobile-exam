class EventModel {
  int id;
  String name;
  String team;
  String details;
  String status;
  int participants;
  String type;

  EventModel({
    required this.id,
    required this.name,
    required this.team,
    required this.details,
    required this.status,
    required this.participants,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'team': team,
      'details': details,
      'status': status,
      'participants': participants,
      'type': type,
    };
  }

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      name: json['name'],
      team: json['team'],
      details: json['details'],
      status: json['status'],
      participants: json['participants'],
      type: json['type'],
    );
  }

  @override
  String toString() {
    return 'Event{id: $id, name: $name, team: $team, details: $details, status: $status, participants: $participants, type: $type}';
  }
}
