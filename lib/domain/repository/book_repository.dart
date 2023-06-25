import 'package:edspert_flutter_book_store/data/model/book_detail_response.dart';
import 'package:edspert_flutter_book_store/data/model/book_model.dart';

abstract class BookRepository{
  Future<List<Book>> getBooks();
  Future<List<Book>> getBooksByName(String name);
  Future<BookDetailResponse> getDetailBook(String isbn13);
}