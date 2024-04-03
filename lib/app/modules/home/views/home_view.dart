import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Colors.purple, Colors.blue])),
        ),
      ),
      backgroundColor: Color.fromRGBO(134, 168, 204, 0.4),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage('assets/akudan.png'),
                      fit: BoxFit.fill
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Perpustakaan adalah sarana untuk mengumpulkan, menjelajahi, menambang sebuah ilmu pengetahuan melalui berbagai macam jenis buku yang bertujuan untuk menambah wawasan dan pengetahuan manusia."
                    "Tapi sebuah perpustakaan tidak hanya berwujud sebuah tempat yang hanya dapat dikunjungi pada waktu tertentu saja, namun pada zaman sekarang suatu perpustakaan dapat diakses dimanapun dan kapanpun,"
                    "melalui ponsel ,maupun perangkat digital lainya, dengan menggunakan sebuah aplikasi perpustakaan yang sudah diprogram dan bisa dijalankan oleh semua pengguna internet. dan itulah tujuan saya membuat aplikasi perpustakaan.",
                style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.normal
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Silakan pilih salah satu menu di bawah ini:',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Buku',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Peminjaman',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Keluar',
          ),
        ],
        onTap: (index) {
          // Define navigation logic based on index
          switch (index) {
            case 0:
              Get.toNamed(Routes.BOOK);
              break;
            case 1:
              Get.toNamed(Routes.PEMINJAMAN);
              break;
            case 2:
              Get.toNamed(Routes.LOGIN);
              break; // Tambahkan break untuk menghentikan switch statement
          }
        },
      ),
    );
  }
}