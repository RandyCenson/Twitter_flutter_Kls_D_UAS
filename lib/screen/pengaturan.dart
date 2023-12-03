import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/globals.dart' as globals;
import 'package:flutter_application_1/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/screen/login_screen.dart';
class Pengaturan extends StatefulWidget {
  const Pengaturan({super.key});

  @override
  State<Pengaturan> createState() => _Pengaturan();
}

class _Pengaturan extends State<Pengaturan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globals.warna1,
      appBar: AppBar(
        backgroundColor:globals.warna1 ,
        leading:ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: globals.warna1,
            shape: const CircleBorder(),
            elevation: 0,
            padding: const EdgeInsets.all(12),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const BottomNavBar()));
          },
          child: Icon(Icons.arrow_back,color: globals.warna2,),
        ),
        centerTitle: true,
        title:Text("Pengaturan",style: TextStyle(
          color: globals.warna2,
        ),), 
    
      ),
      body: ListView(
        children:<Widget> [
          Container(
            height: 50,
            color: globals.warna1,
            child:Stack(
              children: <Widget>[
                Positioned(
                  top: 12,
                  left: 10,
                  child: Text("Light Mode",style: TextStyle(
                    fontSize: 20,
                    color: globals.warna2,
                  ),),
                ),
                Positioned(
                  left: 300,
                  top: 0,
                  child: Switch(
            value: globals.nyala,
            activeColor: Colors.black,
            onChanged: (value) {
              
              setState(() {
                globals.nyala=value;
                if(globals.tombol){
                  globals.warna1=Colors.black;
                  globals.warna2=Colors.white;
                  globals.warna3=const Color.fromARGB(255, 32, 32, 32);
                }
                else{
                  globals.warna1=Colors.white;
                  globals.warna2=Colors.black;
                  globals.warna3=const Color.fromARGB(255, 199, 199, 199);
                }
                globals.tombol=!globals.tombol;
              });
            },
          ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            color: globals.warna1,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 155,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        signOut();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      });
                    },
                    child: Text("LogOut",style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


Future<void> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    print("Logout berhasil");
  } catch (e) {
    print("Error saat logout: $e");
  }
}