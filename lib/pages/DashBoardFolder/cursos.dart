import 'package:flutter/material.dart';
import 'package:sii_patm/connection/HttpHandler.dart';
import 'package:sii_patm/models/list.dart';
import 'package:sii_patm/utils/settings.dart';
import 'package:sii_patm/models/student.dart';
import 'dart:convert';

class ListaCursos extends StatefulWidget {
  @override
  _ListaCursosState createState() => new _ListaCursosState();
 }
class _ListaCursosState extends State<ListaCursos> {

  List<Lista> list = new List();
  Student student;
  String url = Settings.cadenaCon+"wslista/getlista/"+Settings.iduser+"/"+Settings.token;

  @override
  void initState(){
    super.initState();
    print("sdjsdbnsmdb\n\n\n\n"+url);
    loadCursos();
  }

  void loadCursos() async{
    var  students = await HttpHandler().fetchLista(Settings.cadenaCon+"wslista/getlista/"+Settings.iduser+"/"+Settings.token);
    String jsonString = await HttpHandler().getStudent(Settings.cadenaCon+"wsstudent/getStudent/"+Settings.iduser+"/"+Settings.token);
    final jsonRsponse = json.decode(jsonString);
    student = new Student.fromJson(jsonRsponse);
    setState(() {
          list.addAll(students);
          Settings.nameStudent= student.name;
        });
  }

  Widget bodyData() =>  DataTable(
      onSelectAll: (b) {},
      sortAscending: true,
      columns: <DataColumn>[
        DataColumn(
          label: Text("Materia"),
          numeric: false,
          tooltip: "muestra materia",
        ),
        DataColumn(
          label: Text("C1"),
          numeric: false
        ),
         DataColumn(
          label: Text("C2"),
          numeric: false,
          tooltip: "c2",
        ),
        DataColumn(
          label: Text("C3"),
          numeric: false,
          tooltip: "c3",
        ),
        DataColumn(
          label: Text("C4"),
          numeric: false,
          tooltip: "c5",
        ),
      ],
      rows: list.map((lista) => DataRow(
              cells: [
              DataCell(
                Text(lista.grupo.materia.name),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(lista.c1),
                showEditIcon: false,
                placeholder: false
              ),
              DataCell(
                Text(lista.c2),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(lista.c3),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(lista.c4),
                showEditIcon: false,
                placeholder: false,
              ),
            ],
          ),
          )
          .toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: bodyData(),
        ),
    );
  }

}

/*
@override
  Widget build(BuildContext context) {
   return new Container(
     child: ListView.builder(
       itemCount: _lista.length,
       itemBuilder: (BuildContext context, int index){
         return ListTile(
           title: Text(
             _lista[index].grupo.materia.name,
             style: //Theme.of(context).textTheme.headline,
                TextStyle(
                  fontSize: 18.0,
                  color: Colors.black54,
                  fontFamily: 'Nunito'
                  )
           ),
           subtitle: Text(_lista[index].grupo.teacher.name + " " + _lista[index].grupo.teacher.father_lastname),
           leading: Column(
             children: <Widget>[
               CircleAvatar(
                 backgroundColor: Colors.orangeAccent,
                 radius: 18,
                 child: Text(
                   _lista[index].grupo.materia.name[0],
                   style: TextStyle(
                     fontSize: 13.0,
                     color: Colors.white
                   ),
                 ),
               ),
             ],
           ),
         );
       },
     ),
   );
  }
*/