import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_pinjam.dart';

import '../../../routes/app_pages.dart';
import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Peminjaman'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Colors.purple,Colors.blue])
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(134, 168, 204, 0.4),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.PEMINJAMAN),
        child: Icon(Icons.add),
      ),
      body: controller.obx(
            (state) => state != null && state.isNotEmpty
            ? ListView.separated(
          itemCount: state.length,
          itemBuilder: (context, index) {
            DataPinjam dataPinjam = state[index];
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(
                  "${dataPinjam.book?.judul}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Penerbit: ${dataPinjam.book?.penerbit}"),
                    SizedBox(height: 4),
                    Text("Penulis: ${dataPinjam.book?.penulis}"),
                    SizedBox(height: 4),
                    Text(
                      "Tanggal Pinjam: ${dataPinjam.tanggalPinjam}",
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Tanggal Kembali: ${dataPinjam.tanggalKembali}",
                    ),
                  ],
                ),
                trailing: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: dataPinjam.status == 'Selesai' ? Colors.green : Colors.orange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${dataPinjam.status}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onTap: () {

                },
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 8),
        )
            : Center(
          child: Text('Belum ada data peminjaman.'),
        ),
        onLoading: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}