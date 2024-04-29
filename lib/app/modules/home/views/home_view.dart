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
                colors: <Color>[Colors.purple, Colors.blue]
            ),
          ),
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
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('assets/logo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Perpustakaan adalah surga bagi pembaca yang haus akan petualangan.",
                style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Silakan pilih salah satu menu di bawah ini:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("rio"),
              accountEmail: Text("rio22@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('assets/akudan.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
