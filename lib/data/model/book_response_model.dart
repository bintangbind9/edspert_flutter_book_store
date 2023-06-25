import 'book_model.dart';

class BookResponse {
    final String? error;
    final String? total;
    final String? page;
    final List<Book>? books;

    BookResponse({
        this.error,
        this.total,
        this.page,
        this.books,
    });

    factory BookResponse.fromJson(Map<String, dynamic> json) => BookResponse(
        error: json["error"],
        total: json["total"],
        page: json["page"],
        books: json["books"] == null ? [] : List<Book>.from(json["books"]!.map((x) => Book.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "total": total,
        "page": page,
        "books": books == null ? [] : List<dynamic>.from(books!.map((x) => x.toJson())),
    };
}