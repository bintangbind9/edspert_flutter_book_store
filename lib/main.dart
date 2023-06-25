import 'package:edspert_flutter_book_store/presentation/screen/book/list/view/book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: BookListView()
    );
  }
}
