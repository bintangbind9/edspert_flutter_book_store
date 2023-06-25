import 'package:edspert_flutter_book_store/data/model/book_model.dart';
import 'package:edspert_flutter_book_store/domain/use_case/get_books_by_name_use_case.dart';
import 'package:edspert_flutter_book_store/domain/use_case/get_books_use_case.dart';
import 'package:edspert_flutter_book_store/presentation/state/view_state.dart';
import 'package:get/get.dart';

class BookListController extends GetxController{
  final GetBooksUseCase getBooksUseCase;
  final GetBooksByNameUseCase getBooksByNameUseCase;

  BookListController({required this.getBooksUseCase, required this.getBooksByNameUseCase});

  Rx<List<Book>> listBooks = Rx([]);
  Rx<ViewState> homeState = Rx(ViewState.initial);

  void getBooks([String name = '']) async {
    homeState(ViewState.loading);
    update();

    final List<Book> listBooks = name == '' ? await getBooksUseCase.call() : await getBooksByNameUseCase.call(name);
    this.listBooks(listBooks);
    homeState(ViewState.success);
    update();
  }
}