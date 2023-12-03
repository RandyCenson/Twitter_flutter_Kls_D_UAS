import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/home_screen.dart';
import 'package:flutter_application_1/screen/globals.dart' as globals;
import 'package:cloud_firestore/cloud_firestore.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  bool _togglebutton = false;

  void _toggle() {
    setState(() {
      if (_togglebutton) {
        _togglebutton = false;
      } else {
        _togglebutton = true;
      }
    });
  }
  final simpanteks=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavBar()));
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavBar()));
                  globals.ayam=simpanteks.text;
                  globals.ikan=130;
                  globals.x=1;
                  createUser(name: globals.ayam);
                });
              },
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  margin: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  width: 110,
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Tweet",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, //buat semua start di kiri
          children: [
            Row(
              children: [
                Container(
                  height: 550,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Stack(
                    children: [
                       Positioned(
                        child: TextField(
                          controller: simpanteks,
                          textAlignVertical: TextAlignVertical.top,
                          expands: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 50, top: 10),
                            hintText: "What's happening?",
                            hintStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.black,
                            border: InputBorder
                                .none, //utk buat border line default hilang
                          ),
                          maxLines: null,
                          minLines: null,
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(50)),
                          child: const Icon(
                            Icons.person_2_rounded,
                            color: Color.fromARGB(123, 0, 0, 0),
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                child: Row(
                  children: [
                    Icon(
                      _togglebutton ? Icons.circle_outlined : Icons.circle,
                      color: Colors.white,
                    ),
                    const Text(
                      " Everyone Can Reply",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                onTap: () {
                  _toggle();
                  print("object");
                },
              ),
            ),
            Row(
              //bagian bawah
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_photo_alternate,
                      color: Colors.blue,
                      size: 45,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.gif_box_outlined,
                      color: Colors.blue,
                      size: 45,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.list_alt,
                      color: Colors.blue,
                      size: 45,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.room_outlined,
                      color: Colors.blue,
                      size: 45,
                    )),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: Colors.blue,
                          size: 45,
                        )),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
    Future createUser({required String name}) async{
    final docUser=FirebaseFirestore.instance.collection('post').doc();
    

    final json={
      'name' :globals.nama,
      'text' : name,
      'date' :DateTime.now().toString(),
      'url' :globals.url,
    };
    await docUser.set(json);
  }
}



















// class PostScreen extends StatefulWidget {
//   const PostScreen({Key? key}) : super(key: key);

//   @override
//   State<PostScreen> createState() => _PostScreenState();
// }

// class _PostScreenState extends State<PostScreen> {
  
//   final simpanteks=TextEditingController();
//   IconData centang=Icons.abc_outlined;
//   Color warna =Colors.red;
//   bool tombol=true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: globals.warna1,
//         appBar: AppBar(
//           backgroundColor: globals.warna1,
//           elevation: 0.0,
//           leading: IconButton(
//             icon:  Icon(Icons.close,color: globals.warna2,),
//             onPressed: () {
//               Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const BottomNavBar()));
//             },
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavBar()));
//                   globals.ayam=simpanteks.text;
//                   globals.ikan=130;
//                   globals.x=1;
//                   createUser(name: globals.ayam);
//                 });
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.blue[600],
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//                 margin: const EdgeInsets.all(5),
//                 alignment: Alignment.center,
//                 width: 110,
//                 child:  Text(
//                   "Tweet",
//                   style: TextStyle(
//                       fontSize: 26,
//                       fontWeight: FontWeight.bold,
//                       color: globals.warna2),
//                 ),
//               ),
//             )
//           ],
//         ),
//         body: Stack(
//           children: [
//             Positioned(
//               child: TextField(
//                 controller: simpanteks,
//                 style:  TextStyle(color: globals.warna2, fontSize: 35),
//                 maxLines: null,
//                 textAlignVertical: TextAlignVertical.top,
//                 decoration: InputDecoration(
//                   hintText: "  What's happening?",
//                   hintStyle:  TextStyle(color: globals.warna2, fontSize: 35),
//                   prefixIcon: Container(
//                     width: 9,
//                     height: 9,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(color: globals.warna2),
//                     ),
//                     padding: const EdgeInsets.all(0.0),
//                     margin: const EdgeInsets.all(5),
//                     child:  Icon(
//                       Icons.person_2_rounded,
//                       color: globals.warna2,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Container(), //pemisah
//             Positioned(
//               //global or private
//               left: 10,
//               bottom: 80,
              
//               child: ElevatedButton(
//                 onPressed: () {
//                 },
//                 style: ButtonStyle(
//                     backgroundColor:
//                         MaterialStateProperty.all(globals.warna3)),
//                 child:   const Row(children: [
//                   Icon(Icons.circle_outlined),
//                   Text(" Everyone Can Reply")
//                 ]),
//               ),
//             ),
//             Positioned(
//               left: 0,
//               bottom: 0,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ButtonStyle(
//                     backgroundColor:
//                         MaterialStateProperty.all(Colors.transparent)),
//                 child: IconButton(
//                   icon: const Icon(
//                     Icons.add_photo_alternate,
//                     color: Colors.blue,
//                   ),
//                   iconSize: 40,
//                   onPressed: () {},
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 70,
//               bottom: 0,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ButtonStyle(
//                     backgroundColor:
//                         MaterialStateProperty.all(Colors.transparent)),
//                 child: IconButton(
//                   icon: const Icon(
//                     Icons.gif_box_outlined,
//                     color: Colors.blue,
//                   ),
//                   iconSize: 40,
//                   onPressed: () {},
//                 ),
//               ),
//             ),
            
//             Positioned(
//               left: 140,
//               bottom: 0,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ButtonStyle(
//                     backgroundColor:
//                         MaterialStateProperty.all(Colors.transparent)),
//                 child: IconButton(
//                   icon: const Icon(
//                     Icons.list_alt,
//                     color: Colors.blue,
//                   ),
//                   iconSize: 40,
//                   onPressed: () {},
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 210,
//               bottom: 0,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ButtonStyle(
//                     backgroundColor:
//                         MaterialStateProperty.all(Colors.transparent)),
//                 child: IconButton(
//                   icon: const Icon(
//                     Icons.room_outlined,
//                     color: Colors.blue,
//                   ),
//                   iconSize: 40,
//                   onPressed: () {},
//                 ),
//               ),
//             ),
//             Positioned(
//               right: 0,
//               bottom: 0,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ButtonStyle(
//                     backgroundColor:
//                         MaterialStateProperty.all(Colors.transparent)),
//                 child: IconButton(
//                   icon: const Icon(
//                     Icons.add_circle_outline,
//                     color: Colors.blue,
//                   ),
//                   iconSize: 40,
//                   onPressed: () {},
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//   }
//   Future createUser({required String name}) async{
//     final docUser=FirebaseFirestore.instance.collection('post').doc();
    

//     final json={
//       'name' :globals.nama,
//       'text' : name,
//       'date' :DateTime.now().toString(),
//       'url' :globals.url,
//     };
//     await docUser.set(json);
//   }
// }