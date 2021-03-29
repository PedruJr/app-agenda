import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage>{
CalendarController _controller;
TextStyle dayStyle(FontWeight fontWeight){
  return TextStyle(color: Color(0xFFFF1493), fontWeight:fontWeight );

}

class Home extends StatefulWidget {
@override
_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
final nameController = TextEditingController();
void refresh(){
setState(() {
nameController.text  ="";
});
}'OK'),
onPressed: (
)

Container taskList(String description){
  return Container(
    padding: EdgeInsets.only(top: 20),
    child: Row(
      children: <Widget>[
        Icon(
          CupertinoIcons.check_mark_circled_solid,
          color: Colors.white,
          size: 30,
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          width: MediaQuery.of(context).size.width*0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
              Text("Tarefa" , style:
              TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              )
              ),
              SizedBox(height: 10,),
              Text(description, style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.normal
              ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
  @override
  void initState()
  {
    super.initState();
    _controller = CalendarController();
  }
  @override
    void dispose(){
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(


        child: SingleChildScrollView(
          child: Column(
            children:<Widget> [
              SizedBox(height: 30,),
              TableCalendar(
                 
                  startingDayOfWeek: StartingDayOfWeek.sunday,
                  calendarStyle: CalendarStyle(

                    weekdayStyle: dayStyle(FontWeight.normal),
                    weekendStyle: dayStyle(FontWeight.normal),
                    selectedColor: Color(0x7000B4D5),
                    todayColor: Color(0xFF00B4D5),
                  ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: Color(0xFFD21479),
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
                weekendStyle: TextStyle(
                  color: Color(0xFFD21479),
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ) ,
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleTextStyle: TextStyle(
                      color: Color(0xFF00B4D5),
                      fontSize: 20, fontWeight: FontWeight.bold
                    ),
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                          color: Color(0xFF00B4D5)
                    ),
                    rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: Color(0xFF00B4D5)
                    )
                  ),
                  calendarController:_controller,),

              SizedBox(height: 20,),
              Container(
                padding:  EdgeInsets.only(left: 30),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular((50)), topRight: Radius.circular(50)),
                  color:Color(0xFF00B4D5)
                ),
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 50),
                          child: Text("Tarefas de Hoje 📃 ", style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold

                          ),
                          ),
                         ),

                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              Color(0xFF00B4D5).withOpacity(0),
                              Color(0xFF00B4D5)
                            ],
                            stops: [
                              0.0,
                              1.0,
                            ]
                          )
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      right: 20,
                      child: ElevatedButton(
                        onPressed: _showDialog,
                        child:  Text("+", style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

_showDialog() async {
  await showDialog<String>(
    builder: (context) => new _SystemPadding(child: new AlertDialog(
      contentPadding: const EdgeInsets.all(16.0),
      content: new Row(
        children: <Widget>[
          new Expanded(
            child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(
                  labelText: 'Descrição da Tarefa', hintText: '. . .'),
            ),
             )
           ],
      ),

      actions: <Widget>[
        new ElevatedButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.pop(context);
            }),
        new ElevatedButton(
            child: const Text('OK'),
            onPressed: (

                ) {
              Navigator.pop(context);
            })
      ],
    ),), context: context,
  );
}
}


class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 300),
        child: child);
  }
}

