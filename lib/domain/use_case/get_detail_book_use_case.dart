import 'package:edspert_flutter_book_store/data/model/book_detail_response.dart';
import 'package:edspert_flutter_book_store/domain/repository/book_repository.dart';

class GetDetailBookUseCase{
  final BookRepository repository;
  
  const GetDetailBookUseCase({required this.repository});

  Future<BookDetailResponse> call(String isbn13) async => await repository.getDetailBook(isbn13);
}