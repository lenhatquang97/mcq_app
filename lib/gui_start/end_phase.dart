import 'package:flutter/material.dart';
class EndPhase extends StatefulWidget {
  int rightQuestions;
  int numQuests;
  EndPhase({Key key,@required this.rightQuestions,@required this.numQuests}):super(key:key);

  @override
  _EndPhaseState createState() => _EndPhaseState();
}

class _EndPhaseState extends State<EndPhase> {
  @override
  Widget build(BuildContext context) {
     final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
    void _openDrawer () {
      _scaffoldKey.currentState.openDrawer();
    }
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
              'Kết thúc bài thi',
              style:TextStyle(
                fontSize:30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]
        )
      ),
        SizedBox(height:80),
        Container(
          margin:EdgeInsets.fromLTRB(40,0,40,0),
          child:Text(
            'Kết quả',
            style:TextStyle(
              fontSize:30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height:40),
        Container(
          margin:EdgeInsets.fromLTRB(40,0,40,0),
          child:Text(
            'Bạn đã đạt được',
            style:TextStyle(
              fontSize:30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height:40),
        Container(
          margin:EdgeInsets.fromLTRB(40,0,40,0),
          child:Text(
            '${widget.rightQuestions}/${widget.numQuests}',
            style:TextStyle(
              fontSize:30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height:40),
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, '/home');
          },
          child:Card(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),),
          child:Container(
            margin:EdgeInsets.all(10),
            child:Text('HOME',style:
                TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
            ),),),),
        )
        ],
      ),
    );
  }
}