class Activity {
  final int id;
  final String title;
  final String body;

  Activity({
    required this.id,
    required this.title,
    required this.body,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
