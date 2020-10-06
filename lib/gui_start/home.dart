import 'package:flutter/material.dart';
import 'package:mcq_app/gui_start/choose.dart';
import 'package:mcq_app/library_questions/subject_list.dart';
void main() =>runApp(MaterialApp(
  home:Home(),
));
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  int index;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
   void _openDrawer () {
    _scaffoldKey.currentState.openDrawer();
  }
  void initState(){
    super.initState();
    index=index??0;
  }
  @override
  Widget build(BuildContext context) {
    SubjectList sl=new SubjectList();
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      key:_scaffoldKey,
      backgroundColor: Color(0xffffd54f),
      drawer: Drawer(
        child:Container(
          color:Color(0xffFDD835),
          child:ListView(
            children:<Widget>[
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child:Card(
                color: Color(0xffFDD835),
                child:ListTile(
                  title:Text('HOME'
                  ,style: TextStyle(
                    fontSize:25,
                    fontWeight:FontWeight.bold,
                  ),
                  ),
                  trailing:Icon(Icons.arrow_right),
                )
              ),
              ),
              InkWell(
                onTap: (){},
                child:Card(
                color: Color(0xffFDD835),
                child:ListTile(
                  title:Text('GUIDE'
                  ,style: TextStyle(
                    fontSize:25,
                    fontWeight:FontWeight.bold,
                  ),
                  ),
                  trailing:Icon(Icons.arrow_right),
                )
              ),
              ),

              InkWell(
                onTap: (){
                  print('Hello');
                },
                child:Card(
                color: Color(0xffFDD835),
                child:ListTile(
                  title:Text('ABOUT ME'
                  ,style: TextStyle(
                    fontSize:25,
                    fontWeight:FontWeight.bold,
                  ),
                  ),
                  trailing:Icon(Icons.arrow_right),
                )
              ),
              ),
            ],
          ),
        )
      ),
      body:Column(
        children:<Widget>[
          Container(
      width:width,
      height:140,
      decoration: BoxDecoration(
        color:Colors.amber,
        borderRadius: BorderRadius.only(
          bottomLeft: const Radius.circular(20),
          bottomRight: const Radius.circular(20),
        )
      ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:<Widget>[
            SizedBox(width:10),
            FlatButton(onPressed: (){
              _openDrawer();
            }, 
            child: Image.asset('assets/images/menu.png')),
            SizedBox(width:25),
            Text(
              'Trắc nghiệm',
              style:TextStyle(
                fontSize:30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]
        )
      ),
          SizedBox(height:80),
          InkWell(
            onTap: (){
              var route= new MaterialPageRoute(
                builder:(context) => new ChooseBundle(numBundle: index));
              Navigator.of(context).push(route);
            },
            child:Container(
            height:300,
            child:Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child:Image(
              image:AssetImage(sl.ls[index][1]),
            )),),), 
          SizedBox(height: 60),
          Container(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                SizedBox(width:10),
                InkWell(
                  onTap: (){
                    setState(() {
                      if(index<=0){
                        index=sl.ls.length-1;
                      }
                      else
                        index=(index-1)%sl.ls.length;
                    });
                  },
                  child:Image(
                    image: AssetImage('assets/images/previous.png'),
                  )
                ),
                SizedBox(width:20),
                Text(sl.ls[index][0],
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(width:20),
                InkWell(
                  onTap: (){
                    setState(() {
                      index=(index+1)%sl.ls.length;
                    });
                    print(index);
                    print(sl.ls.length);
                  },
                  child:Image(
                    image: AssetImage('assets/images/next.png'),
                    alignment: Alignment.topLeft,
                  )
                )
                
              ],
            )
          )
        ],
      ),
    );
  }
}

