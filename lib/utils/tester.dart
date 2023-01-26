// // ignore_for_file: prefer_const_constructors, sort_child_properties_last

// import 'dart:convert';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_scale/services/rest_api.dart';
// import 'package:flutter_scale/themes/colors.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {

//   // สร้างตัวแปร key ไว้ผูกกับฟอร์ม
//   final formKey = GlobalKey<FormState>();

//   // สร้างตัวแปรไว้รับ input จากฟอร์ม
//   late String _username, _password;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Form(
//           key: formKey,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 200,),
//                   Image.asset('assets/images/intro1.png', width: 150,),
//                   SizedBox(height: 30.0,),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     child: TextFormField(
//                       style: TextStyle(
//                         fontSize: 18.0,
//                         color: primary,
//                         fontWeight: FontWeight.bold
//                       ),
//                       decoration: InputDecoration(
//                         // ตกแต่งเส้นขอบ
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)
//                         ),
//                         // ใส่รูปไอคอน
//                         prefixIcon: Icon(
//                           Icons.person_outline_rounded,
//                           color: primary_text,
//                         ),
//                         hintText: "Username",
//                         labelText: "Username"
//                       ),
//                       validator: (val) {
//                         if(val!.isEmpty){
//                           return 'ต้องป้อนชื่อผู้ใช้ก่อน';
//                         }else{
//                           return null;
//                         }
//                       },
//                       onSaved: (val){
//                         _username = val.toString().trim();
//                       },
//                     ),
//                   ),
//                   SizedBox(height: 20.0,),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     child: TextFormField(
//                       obscureText: true,
//                       style: TextStyle(
//                         fontSize: 18.0,
//                         color: primary,
//                         fontWeight: FontWeight.bold
//                       ),
//                       decoration: InputDecoration(
//                         // ตกแต่งเส้นขอบ
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)
//                         ),
//                         // ใส่รูปไอคอน
//                         prefixIcon: Icon(
//                           Icons.lock_outline,
//                           color: primary_text,
//                         ),
//                         hintText: "Password",
//                         labelText: "Password"
//                       ),
//                       validator: (val) {
//                         if(val!.isEmpty){
//                           return 'ต้องป้อนรหัสผ่านก่อน';
//                         }else{
//                           return null;
//                         }
//                       },
//                       onSaved: (val){
//                         _password = val.toString().trim();
//                       },
//                     ),
//                   ),
//                   SizedBox(height: 20.0,),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         // เช็คว่าป้อนค่าในฟอร์มครบหรือยัง
//                         // กรณี validate ผ่านแล้ว
//                         if(formKey.currentState!.validate()){
//                           formKey.currentState!.save();
//                           // print(_username+_password);
//                           // print("ป้อนข้อมูลครบแล้ว");

//                           // try {
//                           //   var checkNetwork = await Connectivity().checkConnectivity();
//                           //   if(checkNetwork == ConnectivityResult.none){
//                           //     // fail!
//                           //   }else{
//                           //     // success
//                           //   }
//                           // } on PlatformException catch (e) {
//                           //   print("Error");
//                           //   return;
//                           // }

//                           // เช็คสถานะการเชื่อมต่อ  Network
//                           var checkNetwork = await Connectivity().checkConnectivity();

//                           if(checkNetwork == ConnectivityResult.none){
//                             // ถ้าไม่ได้เชื่อมต่อ
//                             AlertDialog alert = AlertDialog(
//                               title: Text('มีข้อผิดพลาด'),
//                               content: Text('อุปกรณ์ของท่านไม่ได้เชื่อมต่อ Internet'),
//                               actions: [
//                                 TextButton(
//                                   onPressed: (() => Navigator.pop(context)), 
//                                   child: Text('OK')
//                                 )
//                               ],
//                             );

//                             showDialog(
//                               context: context, 
//                               builder: (context) => alert
//                             );
//                           }else{
//                             // เรียกฟังก์ชัน loginAPI()
//                             var response = await CallAPI().loginAPI(
//                               {
//                                 "username":_username,
//                                 "password":_password
//                               }
//                             );

//                             print(json.decode(response.body));
//                           }


//                         }else{
//                           print("ป้อนข้อมูลไม่ครบถ้วน");
//                         }
//                       },
//                       child: Text(
//                         "Login", 
//                         style: TextStyle(fontSize: 20),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.all(15.0),
//                       ),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           )
//         ),
//       ),
//     );
//   }
// }