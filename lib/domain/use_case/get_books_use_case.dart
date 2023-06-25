import 'package:edspert_flutter_book_store/data/model/book_model.dart';
import 'package:edspert_flutter_book_store/domain/repository/book_repository.dart';

class GetBooksUseCase{
  final BookRepository repository;
  /*
  repository yang dipake adalah abstract class nya.
  karena jika ada perubahan, maka dilakukan di class yang mengimplementasikan abstract class.
  misal ada perubahan repository, katakanlah v2 nya, maka diharapkan mengimplementasikan abstract class yang sama.
  */
  
  const GetBooksUseCase({required this.repository});

  Future<List<Book>> call() async => await repository.getBooks();
}