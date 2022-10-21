class User {
  final int id;
  final String name;
  final String number;
  final String location;

  User(
      {required this.id,
        required this.name,
        required this.number,
        required this.location}
        );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['order_id'],
        name: json['applicant_user_full_name'],
        number: json['applicant_user_phone_number'],
        location: json['visit_location']);
  }
}