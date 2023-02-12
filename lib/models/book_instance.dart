class BookInstance {
  final String id;
  final String title;
  final String author;
  final String genre;
  final String publishDate;
  final String status;
  final int borrowCount;
  final String location;
  final String? thumbnail;

  const BookInstance({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    required this.publishDate,
    required this.status,
    required this.borrowCount,
    required this.location,
    this.thumbnail,
  });

  factory BookInstance.fromJson(Map<String, dynamic> json) => BookInstance(
    id: json['id'] ?? "",
    title: json['title'] ?? "",
    author: json['author'] ?? "",
    genre: json['genre'] ?? "",
    publishDate: json['publish_date'] ?? "",
    status: json['status'] ?? "",
    location: json['location'] ?? "",
    borrowCount: json['borrow_count'] ?? "",
    thumbnail: json['thumbnail'],
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'title': title,
    'author': author,
    'genre': genre,
    'publish_date': publishDate,
    'status': status,
    'location': location,
    'borrow_count': borrowCount,
    'thumbnail': thumbnail??'',
  };
}
