import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'firehelperrrr.dart';
import 'loginnn.dart';

void main() {
  runApp(MaterialApp(
    home: RegisterPage(),
  ));
}

class RegisterPage extends StatefulWidget {
  String? email;
  String? pass;
  String? name;
  @override
  State<StatefulWidget> createState() => RegisterState();
}

class RegisterState extends State<RegisterPage> {
  bool showpass=true;
  String? email;
  String? pass;
  String? name;
  String? compass;
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("registrationpage"),
      ),
      body: Form(
        key: formkey,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Sign up",
                style: TextStyle(
                    fontSize: 45,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text("Its quick and easy",
                style: TextStyle(fontSize: 15,color: Colors.lightBlueAccent),),

              SizedBox(height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 300, right: 300),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Name",
                      prefixIcon: Icon(Icons.perm_identity),
                      labelText: "Name",

                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(20))),
                  validator: (name){
                    if (name!.isEmpty){
                      return "Enter Some Value";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (uname){
                   name = uname;
                  },
                ),
              ),
              SizedBox(height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 300, right: 300),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email),
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  validator: (name){
                    if (name!.isEmpty){
                      return "Enter Some Value";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (ename){
                    name = ename;
                  },
                ),
              ),

              SizedBox(height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 300, right: 300),
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
                  validator: (name){
                    if (name!.isEmpty){
                      return "Enter Some Value";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (pname){
                    name = pname;
                  },
                ),
              ),
              SizedBox(height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 300, right: 300),
                child: TextFormField(
                  obscureText: showpass,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      hintText: "Confirm Password",
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
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  validator: (name){
                    if (name!.isEmpty){
                      return "Enter Some Value";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (cname){
                    name = cname;
                  },

                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shadowColor: Colors.deepPurple,
                      ),
                      onPressed: () {
                        if(formkey.currentState!.validate()){
                          formkey.currentState!.save();
                        FireHelper().signUp(mail: email!,password:pass!).then((value){
                          if(value== null){
                            Get.to(Login_with_validate());
                          }
                          else{
                            Get.snackbar("Error",value);
                          }
                        });
                        }
                      },
                      child: Text("Signup"))),
              SizedBox(height: 20,
              ),
              TextButton ( onPressed: (){}, child: Text("Already Have a Account..!"))

            ],
          ),
        ),
      ),
    );
  }
}

