import 'package:dio/dio.dart';
import 'package:edspert_flutter_book_store/data/data_source/remote_data_source/book_remote_data_source.dart';
import 'package:edspert_flutter_book_store/data/repository/book_repository_impl.dart';
import 'package:edspert_flutter_book_store/domain/use_case/get_detail_book_use_case.dart';
import 'package:edspert_flutter_book_store/presentation/screen/book/detail/controller/book_detail_controller.dart';
import 'package:edspert_flutter_book_store/presentation/screen/book/detail/view/card_book_detail_view.dart';
import 'package:edspert_flutter_book_store/presentation/style/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetailView extends StatelessWidget {
  final String isbn13;
  BookDetailView({super.key, required this.isbn13});

  final detailController = BookDetailController(
      getDetailBookUseCase: GetDetailBookUseCase(
          repository: BookRepositoryImpl(
              remoteDataSource: BookRemoteDataSource(client: Dio()))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BookDetailController>(
          init: detailController,
          initState: (state) => detailController.getDetailBook(isbn13),
          builder: (state) {
            final book = state.detailBook.value;
            if (state.detailState.value.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  stretch: true,
                  title: const Text('Book Details'),
                  expandedHeight: 400,
                  flexibleSpace: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(40)),
                    child: Container(
                      color: colorPrimary,
                      child: FlexibleSpaceBar(
                        // title: Text(book.title ?? 'No Title'),
                        background: Image.network(
                            book.image ?? 'assets/photos/no_book_image.png',
                            fit: BoxFit.contain),
                        stretchModes: const [StretchMode.zoomBackground],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CardBookDetailView(
                              pText: 'Title: ',
                              pValue: book.title ?? 'No Title'),
                          CardBookDetailView(
                              pText: 'Sub Title: ',
                              pValue: book.subtitle ?? 'No Sub Title'),
                          CardBookDetailView(
                              pText: 'Authors: ',
                              pValue: book.authors ?? 'No Authors'),
                          CardBookDetailView(
                              pText: 'Publisher: ',
                              pValue: book.publisher ?? 'No Publisher'),
                          CardBookDetailView(
                              pText: 'Language: ',
                              pValue: book.language ?? 'No Language'),
                          CardBookDetailView(
                              pText: 'ISBN10: ',
                              pValue: book.isbn10 ?? 'No ISBN10'),
                          CardBookDetailView(
                              pText: 'ISBN13: ',
                              pValue: book.isbn13 ?? 'No ISBN13'),
                          CardBookDetailView(
                              pText: 'Pages: ', pValue: book.pages ?? '-'),
                          CardBookDetailView(
                              pText: 'Year: ', pValue: book.year ?? '-'),
                          CardBookDetailView(
                              pText: 'Rating: ',
                              pValue: book.rating ?? 'No Rating'),
                          CardBookDetailView(
                              pText: 'Desc: ', pValue: book.desc ?? 'No Desc'),
                          CardBookDetailView(
                              pText: 'Price: ',
                              pValue: book.price ?? 'No Price'),
                          CardBookDetailView(
                              pText: 'URL: ', pValue: book.url ?? 'No URL')
                        ],
                      ),
                    )
                  ]),
                )
              ],
            );
          }),
    );
  }
}
