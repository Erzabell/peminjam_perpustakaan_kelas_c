import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class AddPeminjamanController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController tanggal_pinjamController = TextEditingController();
  final TextEditingController tanggal_kembaliController = TextEditingController();
  final loading = false.obs;
  final count = 0.obs;

  // Maximum duration for book return (in days)
  final int maxReturnDuration = 14;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

  }

  @override
  void onClose() {
    super.onClose();
  }

  post() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus(); // Close keyboard
      formkey.currentState?.save();
      if (formkey.currentState!.validate()) {
        // Validate return date
        DateTime? returnDate = DateTime.tryParse(tanggal_kembaliController.text);
        if (returnDate != null) {
          DateTime currentDate = DateTime.now();
          Duration difference = returnDate.difference(currentDate);
          int daysDifference = difference.inDays;
          if (daysDifference <= maxReturnDuration) {
            final response = await ApiProvider.instance().post(
              Endpoint.pinjam,
              data: {
                "user_id": int.parse(StorageProvider.read(StorageKey.idUser)),
                "book_id": int.parse(Get.parameters['id'].toString()),
                "tanggal_pinjam": tanggal_pinjamController.text.toString(),
                "tanggal_kembali": tanggal_kembaliController.text.toString(),
              },
            );
            if (response.statusCode == 201) {
              Get.back();
            } else {
              Get.snackbar(
                "Sorry",
                "Register Gagal",
                backgroundColor: Colors.orange,
              );
            }
          } else {
            Get.snackbar(
              "Error",
              "Peminjaman hanya (2 minggu)",
              backgroundColor: Colors.red,
            );
          }
        } else {
          Get.snackbar(
            "Error",
            "Format tanggal pengembalian tidak valid",
            backgroundColor: Colors.red,
          );
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar(
            "Sorry",
            "${e.response?.data['message']}",
            backgroundColor: Colors.orange,
          );
        }
      } else {
        Get.snackbar(
          "Sorry",
          e.message ?? "",
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      loading(false);
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.red,
      );
    }
  }

  void increment() => count.value++;
}