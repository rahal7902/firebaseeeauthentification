import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firehelperrrr.dart';





Future<void>main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(home: Login_with_validate (),));
}

class Login_with_validate extends StatefulWidget {

  @override
  State<Login_with_validate> createState() => _Login_with_validateState();
}

class _Login_with_validateState extends State<Login_with_validate> {
  // GlobalKey<FormState> formkey = GlobalKey();
  var formkey = GlobalKey<FormState>();
  String? email;
  String? pwd;
  bool showpass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purpleAccent,
      title: Center(child: Text("LOGINPAGE")),
      ),
      body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Image(
                      image: AssetImage(
                          "assets/icons/Iconarchive-Mothers-Day-Bear.512.png"),
                      height: 150,
                      width: 150,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Username",
                          prefixIcon: Icon(Icons.perm_identity),
                          labelText: "Username",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      validator: (uname) {
                        if (uname!.isEmpty ||
                            uname!.contains("@") ||
                            uname.contains("."))
                          return "Enter valid Username";
                        else {
                          return null;
                        }
                      },
                      onSaved: (name){
                        email = name;
                      },

                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100),
                    child: TextFormField(
                      obscureText: showpass,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (showpass) {
                                  showpass = false;
                                } else {
                                  showpass = true;
                                }
                              });
                            },
                            icon: Icon(showpass == true
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          labelText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      validator: (pass) {
                        if (pass!.isEmpty ||
                            pass!.contains("@") ||
                            pass.contains("."))
                          return "Enter Valid Password";
                        else {
                          return null;
                        }
                      },
                      onSaved: (pass){
                        pwd = pass;
                      },

                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100),
                    child: TextButton(
                      onPressed: () {}, child: Text("Forget Password?"),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 30,
                      width: 100,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purpleAccent,
                            shadowColor: Colors.black,
                          ),
                          onPressed: () {
                            if(formkey.currentState!.validate()){
                              formkey.currentState!.save();
                              FireHelper().signIp(mail: email!,password:pwd!).then((value){
                                if(value== null){
                                  Get.to(Login_with_validate());
                                }
                                else{
                                  Get.snackbar("Error",value);
                                }
                              });
                            }
                          },
                          child: Text("LOGIN"))),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text("Not a User? Create a New Account")),
                ],
              ),
            ),
          )),
    );
  }
}
