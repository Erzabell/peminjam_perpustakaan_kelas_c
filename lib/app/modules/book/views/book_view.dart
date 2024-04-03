import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_book.dart';

import '../../../routes/app_pages.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookView'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Colors.purple, Colors.blue],
            ),
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(134, 168, 204, 0.4),
      body: controller.obx(
            (state) => state != null && state.isNotEmpty
            ? ListView.separated(
          itemCount: state.length,
          itemBuilder: (context, index) {
            Data dataBook = state[index];
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text("${dataBook.judul}"),
                subtitle: Text(
                  "${dataBook.penulis}\n${dataBook.penerbit} - ${dataBook.tahunTerbit}",
                ),
                trailing: ElevatedButton(
                  onPressed: () => Get.toNamed(
                    Routes.ADD_PEMINJAMAN,
                    parameters: {
                      'id': (dataBook.id ?? 0).toString(),
                      'judul': dataBook.judul ?? '-',
                    },
                  ),
                  child: Text("Pinjam"),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
        )
            : Center(child: Text('Belum ada data buku.')),
        onLoading: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}