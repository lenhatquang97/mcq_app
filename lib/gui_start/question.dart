import 'package:flutter/material.dart';
import 'package:mcq_app/backend/read_mcq_xlsx.dart';
import 'package:mcq_app/gui_start/end_phase.dart';
import 'package:mcq_app/library_questions/subject_list.dart';
// ignore: must_be_immutable
class QuestionUI extends StatefulWidget {
  int numBundle;
  int index;
  int numQuests;
  String filePath;
  QuestionUI({Key key,@required this.numBundle,@required this.index,@required this.numQuests}):super(key:key);
  @override
  _QuestionUIState createState() => _QuestionUIState();
}
class _QuestionUIState extends State<QuestionUI> {
  String response='Đang đợi câu trả lời từ bạn';
  int rightQuestions=0;
  int finalAnswer=-1;
  int yourAnswer=-1;
  List<Color>choiceColor=[Colors.white,Colors.white,Colors.white,Colors.white];
  int questionNumber;
  bool isSubmit;
  void initState(){
    super.initState();
    questionNumber=questionNumber??1;
    isSubmit=false;
  }
  void chooseAnswer(List<Color>ls,int index){
    ls[index]=Colors.blue;
    for(int i=0;i<4;i++){
      if(i==index)
        continue;
      else ls[i]=Colors.white;
    }
  }
  void changeToWhite(List<Color>ls){
    for(int i=0;i<4;i++){
      ls[i]=Colors.white;
    }
  }
  void showAnswer(List<Color>ls,int index){
    ls[index]=Colors.green;
    for(int i=0;i<4;i++){
      if(i==index)
        continue;
      else ls[i]=Colors.red;
    }
  }
  int binarySearch(List<Color>ls){
    for(int i=0;i<4;i++){
      if(ls[i]==Colors.blue)
        return i;
    }
    return -1;
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
    ReadMCQ readMCQ=new ReadMCQ(filePath: anonymous.filePath[widget.index]);
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
              'Giao diện câu hỏi',
              style:TextStyle(
                fontSize:30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]
        )
      ),
          SizedBox(height:20),
          Container(
            child:FutureBuilder(
              future:readMCQ.readFileMCQ(),
              builder:(context,snapshot){
                if(snapshot.data==null){
                  return Text('No data');
                }
                else{
                  finalAnswer=snapshot.data[questionNumber][6];
                  return Text(
                    snapshot.data[questionNumber][1],
                    style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    )
                  );
                }   
              }
            )
          ),
          Flexible(
            child:FutureBuilder(
              future:readMCQ.readFileMCQ(),
              builder: (context,snapshot){
                if(snapshot.data==null){
                  return Text('No data');
                }
                else return ListView.builder(
                  itemCount:4,
                  itemBuilder: (context,ind){
                    return Padding(
                      padding: const EdgeInsets.all(0.0),
                      child:Card(
                        color: choiceColor[ind],
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        ),
                      margin: EdgeInsets.fromLTRB(0,40,0,0),
                      child:ListTile(
                        onTap:(){
                          setState(() {
                            chooseAnswer(choiceColor, ind);
                          });
                        },
                        title: Text(snapshot.data[questionNumber][ind+2].toString(),
                        style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    )
                    ),
                  );
                },
              );
              },
              )
            ),
          Container(
            child:Text(response,
            style:TextStyle(
              color:Colors.deepOrange,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ) 
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                InkWell(
                  onTap: (){
                    setState((){
                      isSubmit=true;
                      yourAnswer=binarySearch(choiceColor);
                      showAnswer(choiceColor,finalAnswer);
                    });
                    if(yourAnswer==finalAnswer){
                      setState(() {
                        response='Xin chúc mừng bạn';
                        rightQuestions+=1;
                      });
                    }
                    else{
                      setState(() {
                        response='Thật tiếc khi bạn trả lời sai câu này!';
                      });
                    } 
                  },
                  child:Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),),
                  child:Container(
                    margin:EdgeInsets.all(10),
                    child:Text('SUBMIT',style:
                  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),),),),
                SizedBox(width:10),
                InkWell(
                  onTap: (){
                    if(questionNumber==widget.numQuests&&isSubmit==true){
                      var route=new MaterialPageRoute(builder: (context)=>new EndPhase(rightQuestions: rightQuestions,numQuests: widget.numQuests,));
                      Navigator.of(context).push(route);
                    }
                    else setState(() {
                      if(isSubmit==true){
                        questionNumber+=1;
                        changeToWhite(choiceColor);
                        isSubmit=false;
                        response='Đang đợi câu trả lời từ bạn';
                      }
                    });
                  },
                  child:Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),),
                  child:Container(
                    margin:EdgeInsets.all(10),
                    child:Text('NEXT',style:
                  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),),),),
              ],
            ),
          ]
        ),
        );
  }
}