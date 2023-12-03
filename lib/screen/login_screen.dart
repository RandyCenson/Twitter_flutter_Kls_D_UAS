import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/auth_services.dart';
import 'package:flutter_application_1/screen/home_screen.dart';
import 'package:flutter_application_1/screen/signup_screen.dart';
import 'package:flutter_application_1/screen/globals.dart' as globals;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body:Stack(
        children: <Widget>[
           Positioned(
            top: MediaQuery.of(context).viewInsets.top+280,
            left:screenWidth*0.45,
            child:Icon(
              FontAwesomeIcons.xTwitter,
              color: Colors.white,
              size: 50,
              )
            ),
            Positioned(
              top: MediaQuery.of(context).viewInsets.top+360,
              left:screenWidth*0.1,
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
              left:screenWidth*0.1,
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
              top: MediaQuery.of(context).viewInsets.top+440,
              left: MediaQuery.of(context).viewInsets.left+50,
              child: TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                },
                child: Text("SignUp",style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.underline
                ),),
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
                  setState(() {
                    tunggu();
                  });
                },
                child: const Text(
              "Login",
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
  void _signIn() async{
    String username=_username.text;
    String email=_email.text;
    String password=_password.text;

    User? user=await _auth.signInWithEmailAndPassword(email, password);

    if(user!=null){
      print("succed");
    }
    else{
      print("Akun Salah");
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
final CollectionReference _produk = FirebaseFirestore.instance.collection('users');
Future<void> getNamaUser() async {
  FirebaseAuth auth = FirebaseAuth.instance;

  await for (var authState in auth.authStateChanges()) {
    if (authState != null) {
      try {
        DocumentSnapshot userSnapshot = await _produk.doc(authState.uid).get();

        if (userSnapshot.exists) {
          Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
          if (userData.containsKey('name') && userData.containsKey('url')) {
            setState(() {
              globals.nama = userData['name'];
              globals.url = userData['url']; 
            });
          } else {
            print('Kunci \'nama\' tidak ditemukan dalam data user dengan ID ${authState.uid}');
          }
        } else {
          print('Dokumen tidak ditemukan untuk user dengan ID ${authState.uid}');
        }
      } catch (e) {
        print('Error: $e');
      }
      break;
    }
  }
}


Future<void> tunggu() async {
   _signIn();
  await getUserID();
  await getNamaUser();
  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
}


}