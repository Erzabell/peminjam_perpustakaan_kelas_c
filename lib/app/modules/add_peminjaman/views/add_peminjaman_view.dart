import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('${Get.parameters['judul'].toString()}'),
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
      body: Center(
          child: Form(
              key: controller.formkey,
              child: Column(
                children: [
                  Container(
                    width: 350,
                    height: 350,
                    child: Image.asset('assets/logo.png'),
                  ),
                  DateTimePicker(
                    controller: controller.tanggal_pinjamController,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    dateLabelText: 'Tanggal Pinjam',
                    dateMask: 'yyyy-MM-dd',
                    onChanged: (val) => print(val),
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) => print(val),
                    icon: Icon(Icons.calendar_today),
                  ),
                  DateTimePicker(
                    controller: controller.tanggal_kembaliController,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    dateLabelText: 'Tanggal Kembali',
                    dateMask: 'yyyy-MM-dd',
                    onChanged: (val) => print(val),
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) => print(val),
                    icon: Icon(Icons.calendar_today),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(() => controller.loading.value
                      ? CircularProgressIndicator()
                      :Container(
                    width: 200,
                    height: 45,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        controller.post();
                      },
                      child: Text(
                        "Pinjam",
                        style: TextStyle(
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ))

                ],
              ))
      ),
    );
  }
}
