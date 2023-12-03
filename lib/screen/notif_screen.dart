
class NotifikasiScreen extends StatefulWidget {
  const NotifikasiScreen({super.key});

  @override
  State<NotifikasiScreen> createState() => _NotifikasiScreenState();
}

class _NotifikasiScreenState extends State<NotifikasiScreen> {
bool tombol=false;
Color warna=Colors.grey;
  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: globals.warna1,
      drawer: const WidgetDrawer(),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: globals.warna1,
        leading: Builder(builder:(context){
        return GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child:Container(
          width: 30,
          height: 30,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey,
              width: 2,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              globals.url,
              fit: BoxFit.cover,
            ),
          ),
        ), 
        );
        } ),
        actions: <Widget>[
          IconButton(
            icon:  Icon(Icons.settings,color: globals.warna2),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>const Pengaturan()));
            },
          )
        ],
        title:  Text("Notifications",style: TextStyle(
          color:globals.warna2,
        ),),
      ),
      
      body: Row(
        children: <Widget>[
          TextButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>( Size(screenWidth*0.33, 0)),
            ),
            onPressed: () => {},
            child:  Text(
              "All",
              style: TextStyle(
                color: globals.warna2,
                fontSize: 20,
              ),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>( Size(screenWidth*0.33, 0)),
            ),
            onPressed: () => {},
            child:  Text(
              "Verified",
              style: TextStyle(
                color: globals.warna2,
                fontSize: 20,
              ),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(Size(screenWidth*0.33, 0)),
            ),
            onPressed: () => {},
            child: Text(
              "Mentions",
              style: TextStyle(
                color: globals.warna2,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}