class Student {
  final int id;
  final String schoolId;
  final String email;
  final String firstName;
  final String? middleName;
  final String lastName;
  final String? mobileNo;

  const Student({
    required this.id,
    required this.schoolId,
    required this.email,
    required this.firstName,
    this.middleName,
    required this.lastName,
    this.mobileNo,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    id: json['id'] ?? "",
    schoolId: json['school_id'] ?? "",
    email: json['email'] ?? "",
    firstName: json['first_name'] ?? "",
    middleName: json['middle_name'] ?? "",
    lastName: json['last_name'] ?? "",
    mobileNo: json['mobile_no'] ?? "",
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'school_id': schoolId,
    'email': email,
    'first_name': firstName,
    'middle_name': middleName,
    'last_name': lastName,
    'mobile_no': mobileNo
  };
}
