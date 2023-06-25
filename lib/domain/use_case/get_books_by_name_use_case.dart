import 'package:edspert_flutter_book_store/data/model/book_model.dart';
import 'package:edspert_flutter_book_store/domain/repository/book_repository.dart';

class GetBooksByNameUseCase{
  final BookRepository repository;
  
  const GetBooksByNameUseCase({required this.repository});

  Future<List<Book>> call(String name) async => await repository.getBooksByName(name);
}