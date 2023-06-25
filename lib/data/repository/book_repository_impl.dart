import 'package:edspert_flutter_book_store/data/data_source/remote_data_source/book_remote_data_source.dart';
import 'package:edspert_flutter_book_store/data/model/book_detail_response.dart';
import 'package:edspert_flutter_book_store/data/model/book_model.dart';
import 'package:edspert_flutter_book_store/domain/repository/book_repository.dart';

class BookRepositoryImpl implements BookRepository{
  final BookRemoteDataSource remoteDataSource;
  
  const BookRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Book>> getBooks() async => await remoteDataSource.getBooks();

  @override
  Future<List<Book>> getBooksByName(String name) async => await remoteDataSource.getBooksByName(name);

  @override
  Future<BookDetailResponse> getDetailBook(String isbn13) async => await remoteDataSource.getDetailBook(isbn13);
}

/*
Jika ada perubahan major, misal perlu buat BookRepositoryImplV2,
maka tetap implements BookRepository. Karena use manggil abstract class BookRepository.
Dan nantinya di view saat declare Controller tinggal panggil BookRepositoryImplV2 tsb.
*/