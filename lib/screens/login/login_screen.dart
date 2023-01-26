// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_scale/components/custom_widgets.dart';
import 'package:flutter_scale/services/rest_api.dart';
import 'package:flutter_scale/utils/utility.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//ສ້າງຕົວແປ key ໄວ້ຜູກກັບຟອມ
  final formKey = GlobalKey<FormState>();

  //ສ້າງຕົວແປໄວ້ຮັບ input ຈາກຟອມ
  late String _username, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    'assets/images/image-1.png',
                    width: 300,
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                    width: 350,
                    child: inputFieldWidget(
                      context,
                      Icon(Icons.person_outlined),
                      "Username",
                      "Username",
                      (onValidate) {
                        if (onValidate!.isEmpty) {
                          return 'ປ້ອນຊື່ຜູ້ໃຊ້ງານ';
                        }
                        return null;
                      },
                      (onSaveUser) {
                        _username = onSaveUser;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: inputFieldWidget(
                        context,
                        Icon(Icons.lock_outline),
                        obsecureText: true,
                        "Password",
                        "Password", (onValidate) {
                      if (onValidate!.isEmpty) {
                        return 'ປ້ອນລະຫັດຜ່ານ';
                      }
                      return null;
                    }, (onSavePass) {
                      _password = onSavePass;
                    }),
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  //Login Button
                  Container(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // <-- Radius
                        ),
                      ),
                      onPressed: () async {
                        //ເຊັກວ່າຄ່າໃນຟອມຄົບຫຼືຍັງ
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          // call api
                          var response = await CallApi().loginAPI(
                            {
                              "username": _username,
                              "password": _password,
                            },
                          );

                          //ແປງຂໍ້ມູນຈາກ json ເປັນພາສາ Dart
                          var body = json.decode(response.body);

                          if (body['status'] == 'success') {
                            SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();

                            sharedPreferences.setInt('userStep', 2);
                            sharedPreferences.setString(
                                'userID', body['data']['id']);
                            sharedPreferences.setString(
                                'userName', body['data']['username']);
                            sharedPreferences.setString(
                                'fullName', body['data']['fullname']);
                            sharedPreferences.setString(
                                'imageProfile', body['data']['img_profile']);
                            sharedPreferences.setString(
                                'userStatus', body['data']['status']);

                            Navigator.pushReplacementNamed(
                                context, '/dashboard');
                          } else {
                            Utility.getInstance()!.showAlertDialog(
                                context, 'Error', 'ຊື່ ຫຼື ລະຫັດບໍ່ຖືກຕ້ອງ');
                          }
                          print(json.decode(response.body));
                        } else {
                          print('form validate');
                        }
                      },
                      child: Text('Login'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
