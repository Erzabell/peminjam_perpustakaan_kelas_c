import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
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
              key: controller.formKey,
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    child: Image.asset('assets/logo.png',color: Colors.blueAccent,),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: controller.namaController,
                    decoration: InputDecoration(hintText: "Masukan Nama"
                        ,
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide()
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide()
                        )),
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Nama tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controller.usernameController,
                    decoration: InputDecoration(hintText: "Masukan Username"
                        ,
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide()
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide()
                        )),
                    validator: (value) {
                      if (value!.length < 2) {
                        return "username tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controller.telpController,
                    decoration: InputDecoration(hintText: "Masukan Telepon"
                        ,
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide()
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide()
                        )),
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Telepon tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controller.alamatController,
                    decoration: InputDecoration(hintText: "Masukan Alamat"
                        ,
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide()
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide()
                        )),
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Alamat tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(hintText: "Masukan Pasword"
                        ,
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide()
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide()
                        )),
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Password tidak boleh kosong";
                      }
                      return null;
                    },
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
                        controller.add();
                      },
                      child: Text(
                        "Tambah",
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
