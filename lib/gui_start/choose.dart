import 'package:flutter/material.dart';
import 'package:mcq_app/gui_start/inputnum.dart';
import 'package:mcq_app/library_questions/subject_list.dart';
// ignore: must_be_immutable
class ChooseBundle extends StatefulWidget {
  int numBundle;
  ChooseBundle({Key key, @required this.numBundle}):super(key:key);
  @override
  _ChooseBundleState createState() => _ChooseBundleState();
}

class _ChooseBundleState extends State<ChooseBundle> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
   void _openDrawer () {
    _scaffoldKey.currentState.openDrawer();
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    Subject anonymous;
    if(widget.numBundle==0){
      anonymous= new MilitaryEdu();
    }
    else if(widget.numBundle==1){
      anonymous=new Python();
    }
    else if(widget.numBundle==2){
      anonymous=new Environment();
    }
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
                  Navigator.pushNamed(context,'/home');
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
                onTap: (){
                  print('Hello');
                },
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
                'Chọn học phần',
                style:TextStyle(
                  fontSize:30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]
          )
        ),
        //Phần thân của chooseBundle
        SizedBox(height: 20),
        Flexible(
          child:ListView.builder(
          itemCount:anonymous.bundleQuests.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child:Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                margin: EdgeInsets.fromLTRB(0,40,0,0),
                child:ListTile(
                  onTap:(){
                    var route= new MaterialPageRoute(
                      builder:(context) => 
                      new ChooseNum(numBundle: widget.numBundle,index:index),
                      );
                    Navigator.of(context).push(route);
                  },
                  title: Text(anonymous.bundleQuests[index],
                  style:TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                  )
                )
              ),
            );
          },
        )
        ),
        ],
      ),
    );
  }
}