import 'package:edspert_flutter_book_store/data/model/book_detail_response.dart';
import 'package:edspert_flutter_book_store/domain/use_case/get_detail_book_use_case.dart';
import 'package:edspert_flutter_book_store/presentation/state/view_state.dart';
import 'package:get/get.dart';

class BookDetailController extends GetxController {
  final GetDetailBookUseCase getDetailBookUseCase;

  BookDetailController({required this.getDetailBookUseCase});

  Rx<ViewState> detailState = Rx(ViewState.initial);
  Rx<BookDetailResponse> detailBook = Rx(BookDetailResponse());

  void getDetailBook(String isbn13) async {
    detailState(ViewState.loading);
    update();

    final detailBook = await getDetailBookUseCase.call(isbn13);
    this.detailBook(detailBook);
    detailState(ViewState.success);
    update();
  }
}