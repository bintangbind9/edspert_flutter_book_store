import 'package:dio/dio.dart';
import 'package:edspert_flutter_book_store/data/data_source/remote_data_source/book_remote_data_source.dart';
import 'package:edspert_flutter_book_store/data/repository/book_repository_impl.dart';
import 'package:edspert_flutter_book_store/domain/use_case/get_books_by_name_use_case.dart';
import 'package:edspert_flutter_book_store/domain/use_case/get_books_use_case.dart';
import 'package:edspert_flutter_book_store/presentation/screen/book/detail/view/book_detail_view.dart';
import 'package:edspert_flutter_book_store/presentation/screen/book/list/controller/book_list_controller.dart';
import 'package:edspert_flutter_book_store/presentation/screen/profile/profile_view.dart';
import 'package:edspert_flutter_book_store/presentation/style/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookListView extends StatelessWidget {
  BookListView({super.key});

  final bookListController = BookListController(
      getBooksUseCase: GetBooksUseCase(
          repository: BookRepositoryImpl(
              // Harus pake class implementation nya! bukan abstract class!
              remoteDataSource: BookRemoteDataSource(client: Dio()))),
      getBooksByNameUseCase: GetBooksByNameUseCase(
          repository: BookRepositoryImpl(
              // Harus pake class implementation nya! bukan abstract class!
              remoteDataSource: BookRemoteDataSource(client: Dio()))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileView(),
                    ));
              },
              icon: const Icon(Icons.person)),
          const SizedBox(
            width: 8.0,
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchBar(
              hintText: 'Type the book name here',
              onChanged: (value) => bookListController.getBooks(value),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                child: Container(
                  color: colorSecondary,
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: GetBuilder<BookListController>(
                      // Agar bisa ambil state dari Controller
                      init: bookListController,
                      initState: (state) => bookListController.getBooks(),
                      builder: (state) {
                        if (state.homeState.value.isLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        return ListView.builder(
                            shrinkWrap:
                                true, //set true to prevent out of bound. Data yang tampil sesuai screen kita.
                            itemCount: state.listBooks.value.length,
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            itemBuilder: (context, index) {
                              final book = state.listBooks.value[index];

                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BookDetailView(
                                              isbn13: book.isbn13 ?? '')));
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FadeInImage.assetNetwork(
                                              fadeInDuration: const Duration(seconds: 1),
                                              image: book.image ?? 'assets/photos/no_book_image.png',
                                              placeholder: 'assets/photos/no_book_image.png',
                                              fit: BoxFit.cover,
                                              height: 60,
                                              width: 60,
                                            ),
                                            const SizedBox(width: 8.0),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    book.title ?? 'No title',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    book.subtitle ??
                                                        'No Subtitle',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 12.0),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 8.0),
                                            Text(book.price ?? '-',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
