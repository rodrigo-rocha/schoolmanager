import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_app_ihc/courses/finished/finished_courses.dart';

class Reports extends StatefulWidget {

  @override
  ReportsState createState() => ReportsState();
}

Map<String, double> dataMap = new Map();

double mean;
String meanString = "";

class ReportsState extends State<Reports> {

  @override
  void initState() {
    dataMap.putIfAbsent("Network Architecture", () => 5);
    dataMap.putIfAbsent("Human-Computer Interaction", () => 3);
    dataMap.putIfAbsent("Databases", () => 2);
    dataMap.putIfAbsent("PEI", () => 2);
  }

  @override
  Widget build(BuildContext context) {

    int sum = 0;

    try {
      for(int i = 0; i < finishedCoursesList.length; i++) {
        sum += int.parse(finishedCoursesList[i].grade);
      }

      mean = sum/finishedCoursesList.length;
      meanString = mean.toStringAsFixed(2);
    } catch (e) {
      meanString = "Cannot calculate mean.";
    }
    // TODO: implement build
    return Scaffold(
      drawer: Functions.sideBar(context),
      appBar: Functions.appBar("Reports", null, null),
      body: Container(
        child: StaggeredGridView.count(
          physics: ScrollPhysics(parent: BouncingScrollPhysics()),
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  new Text("Monthly Dedicated Hours", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10.0),
                  new Sparkline(
                    data: [3, 5, 4, 6, 6, 8, 4, 5, 3],
                    lineColor: Colors.blue,
                    pointsMode: PointsMode.all,
                    pointColor: Colors.green,
                  ),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  new Text("Weekly Courses Dedication", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 5.0),
                  PieChart(
                    dataMap: dataMap,
                    legendFontColor: Colors.blueGrey[900],
                    legendFontSize: 14.0,
                    legendFontWeight: FontWeight.w500,
                    animationDuration: Duration(milliseconds: 800),
                    chartLegendSpacing: 32.0,
                    chartRadius: MediaQuery
                        .of(context)
                        .size
                        .width / 2.7,
                    showChartValuesInPercentage: true,
                    showChartValues: true,
                    chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),
                  )
                ],
              ),
            ),

            Text("Indivudual Statistics", textAlign:TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

            Card(
              elevation: 0.0,
              color: Colors.transparent,
              shape: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 0.5
                )
              ),
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: ListTile(
                trailing: Icon(Icons.import_contacts, color: Colors.blue,),
                title: Text(mean.toString()),
                subtitle: Text("Mean of finished courses"),
              ),
            ),

            Card(
              elevation: 0.0,
              color: Colors.transparent,
              shape: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.5
                  )
              ),
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: ListTile(
                trailing: Icon(Icons.watch_later, color: Colors.blue,),
                title: Text(meanString),
                subtitle: Text("Average hours of study per week"),
              ),
            )
          ],
          staggeredTiles: [
            StaggeredTile.fit(2),
            StaggeredTile.fit(2),
            StaggeredTile.fit(2),
            StaggeredTile.fit(2),
            StaggeredTile.fit(2),
          ],
        ),
      )
    );
  }

}