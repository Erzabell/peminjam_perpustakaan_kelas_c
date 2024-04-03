import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LoginView'),
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
                    height: 300,
                    width: 300,
                    child: Image.asset('assets/logo.png',color: Colors.blueAccent,),
                  ),
                SizedBox(height: 20,),
                TextFormField(
                controller: controller.usernameController,
                decoration: InputDecoration(
                    hintText: "Masukan username",
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
                    )
                ),
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
                controller: controller.passwordController,
                obscureText: true,
                decoration: InputDecoration(hintText: "Masukan password"
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
                    return "password tidak boleh kosong";
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
                        controller.login();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Belum Punya Akun?",style: TextStyle(color: Colors.black),),
                      TextButton(onPressed: () => Get.toNamed(Routes.REGISTER),
                        child: Text(
                          "Daftar Disini", style: TextStyle(color: Colors.blueAccent),
                        ),
                      )
                    ],
                  )
          ],
        ))),
    );
  }
}
