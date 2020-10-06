import 'package:flutter/material.dart';
import 'package:mcq_app/gui_start/question.dart';
import 'package:mcq_app/library_questions/subject_list.dart';
class ChooseNum extends StatefulWidget {
  final int numBundle;
  final int index;
  ChooseNum({Key key, @required this.numBundle, @required this.index}):super(key: key);
  @override
  _ChooseNumState createState() => _ChooseNumState();
}
int questions;
class _ChooseNumState extends State<ChooseNum> {
  int onDecr(questions){
    questions-=1;
    return questions<=0 ? 1: questions;
  }
  int onIncr(questions){
    questions+=1;
    return questions;
  }
  void initState(){
    super.initState();
    questions=questions??1;
    print('Start initState');
  }
  
  @override
  Widget build(BuildContext context) {
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
              'Chọn số câu',
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
            'Chọn số câu hỏi',
            style:TextStyle(
              fontSize:30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height:40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            InkWell(
              onTap:(){
                setState(() {
                  questions=onDecr(questions);
                });
              },
              child:Image(
                  image: AssetImage('assets/images/previous.png'),
            ),
            ),
            SizedBox(width:30),
            Text(questions.toString()+'/${anonymous.numQuestions[widget.index]}',
            style:TextStyle(
              fontWeight: FontWeight.bold,
              fontSize:30,
            )
            ),
            SizedBox(width:30),
            InkWell(
              onTap:(){
                setState(() {
                  questions=onIncr(questions);
                  if(questions>anonymous.numQuestions[widget.index])
                    questions=anonymous.numQuestions[widget.index];
                });
              },
              child:Image(
                  image: AssetImage('assets/images/next.png'),
              ),
            ),
          ],
        ),
            SizedBox(height: 40),
            InkWell(
              onTap: (){
                if(questions>anonymous.numQuestions[widget.index]){
                  setState(() {
                    questions=anonymous.numQuestions[widget.index];});
                }
                else{
                  var route=new MaterialPageRoute(builder: 
                  (context) => new QuestionUI(numBundle: widget.numBundle,index:widget.index,numQuests:questions,)
                  );
                  Navigator.of(context).push(route);
                }
              },
              child:Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                margin: EdgeInsets.fromLTRB(20,40,20,40),
                child:Container(
                  margin: EdgeInsets.fromLTRB(20,20,20,20),
                  child:Text('START',
                  style:TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                  )
                )
              ),
            )
            
        ],
      ),
    );
  }
}