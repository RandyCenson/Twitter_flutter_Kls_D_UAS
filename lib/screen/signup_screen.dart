import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/auth_services.dart';
import 'package:flutter_application_1/screen/home_screen.dart';
import 'package:flutter_application_1/screen/globals.dart' as globals;
import 'package:flutter_application_1/screen/login_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuthService _auth=FirebaseAuthService();
  TextEditingController _username=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();

  void dispose(){
    _username.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body:Stack(
        children: <Widget>[
          Positioned(
            top: 40,
            left: 0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: globals.warna1,
                shape: CircleBorder(),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
              child: Icon(Icons.arrow_back,color: globals.warna2,),
            )
          ),
           Positioned(
            top: MediaQuery.of(context).viewInsets.top+270,
            left: screenWidth*0.43,
            child:Icon(
              FontAwesomeIcons.xTwitter,
              color: Colors.white,
              size: 50,
              )
            ),
            Positioned(
              top: MediaQuery.of(context).viewInsets.top+360,
              left:screenWidth*0.13,
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                  color: globals.warna1,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child:  TextField(
                  controller: _email,
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8),
                hintText: "   Email",
                border: InputBorder.none,
              ),
            ),
              ),
            ),
            
            Positioned(
              top: MediaQuery.of(context).viewInsets.top+410,
              left:screenWidth*0.13,
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child:  TextField(
                  controller: _password,
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8),
                hintText: "   Password",
                border: InputBorder.none,
              ),
            ),
              ),
            ),
            
            Positioned(
              top: MediaQuery.of(context).viewInsets.top+470,
              left: screenWidth*0.25,
              child:
              TextButton(
                style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(const Size(180, 0)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color.fromARGB(255, 71, 71, 71)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                )),
                onPressed: () {
                  _signUp();
                },
                child: const Text(
              "SignUp",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
                ),
              )
            ),
        ],
      ),
    );
  }
  void _signUp() async{
    String username=_username.text;
    String email=_email.text;
    String password=_password.text;

    User? user=await _auth.signUpWithEmailAndPassword(email, password);

    if(user!=null){
      print("succed");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ccreate()));
      
    }
    else{
      print("error");
    }
  }
}


class ccreate extends StatefulWidget {
  @override
  State<ccreate> createState() => ccreateState();
}

class ccreateState extends State<ccreate> {
  FirebaseAuth auth=FirebaseAuth.instance;
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  File? file;
  ImagePicker image = ImagePicker();
  var url;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globals.warna1,
      appBar: AppBar(
        title: Text(
          'Create Account',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: globals.warna1,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                  height: 200,
                  width: 200,
                  child: file == null
                      ? IconButton(
                          icon: Icon(
                            Icons.add_a_photo,
                            size: 90,
                            color: globals.warna2,
                          ),
                          onPressed: () {
                            getImage();
                          },
                        )
                      : MaterialButton(
                          height: 100,
                          child: Image.file(
                            file!,
                            fit: BoxFit.fill,
                          ),
                          onPressed: () {
                            getImage();
                          },
                        )),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: name,
              decoration: InputDecoration(
                filled: true,
                fillColor: globals.warna3,
                hintText: 'Username',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            
            MaterialButton(
              height: 40,
              onPressed: () {
                if (file != null) {
                  uploadFile();
                }
              },
              child: Text(
                "Add",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                ),
              ),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  getImage() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }

  uploadFile() async {
    try {
      var imagefile = FirebaseStorage.instance
          .ref()
          .child("contact_photo")
          .child("/${name.text}.jpg");
      UploadTask task = imagefile.putFile(file!);
      TaskSnapshot snapshot = await task;
      url = await snapshot.ref.getDownloadURL();
      setState(() {
        url = url;
      });
      if (url != null) {
      
      await FirebaseFirestore.instance
          .collection('users') 
          .doc(auth.currentUser!.uid).set 
          ({
            'name': name.text,
            'url': url,
          });

          globals.nama=name.text;
          globals.url=url;
          getUserID();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavBar()));
      }
    } on Exception catch (e) {
      print(e);
    }
  }
  Future<void> getUserID() async {
  FirebaseAuth auth = FirebaseAuth.instance;

  await for (var authState in auth.authStateChanges()) {
    if (authState != null) {
      globals.uid = authState.uid;
      print("User ID: ${globals.uid}");
      break;
    }
  }
}
}
