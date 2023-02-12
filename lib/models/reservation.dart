class Reservation {
  final int id;
  final String dateReserved;
  final int student;
  final String bookInstance;

  const Reservation({
    required this.id,
    required this.dateReserved,
    required this.student,
    required this.bookInstance
  });

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
    id: json['id'] ?? "",
    dateReserved: json['date_reserved'] ?? "",
    student: json['student'] ?? "",
    bookInstance: json['book_instance'] ?? ""
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'date_reserved': dateReserved,
    'student': student,
    'book_instance': bookInstance
  };
}
