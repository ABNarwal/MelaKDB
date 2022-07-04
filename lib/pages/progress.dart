import 'dart:developer';
import 'timelineCard.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Page'),
        backgroundColor: Color(0xff4a4e69),
      ),
      body: Center(
        child: TimeLine(),
      ),
    );
  }
}

class TimeLine extends StatefulWidget {
  const TimeLine({Key? key}) : super(key: key);

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  List<Color> colors = [Colors.grey, Colors.blue, Colors.amber, Colors.green];
  late List<TimelineCard> timeline;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeline = _getCards();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: timeline.length,
        itemBuilder: (context, index) {
          return Container(
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 2,
                      height: 50,
                      color: index == 0 ? Colors.white : Colors.black,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: colors[(index) % 4],
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        timeline[index].icon,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 50,
                      color: index == timeline.length - 1
                          ? Colors.white
                          : Colors.black,
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(width: 4, color: Color(0xff4a4e69)),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            timeline[index].title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            timeline[index].description,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
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
}

List<TimelineCard> _getCards() {
  List<TimelineCard> timelineCard = [];
  timelineCard.add(
      TimelineCard("Stage 1", "Form not filled", Icons.format_align_center));
  timelineCard.add(TimelineCard("Stage 2", "Application Sent", Icons.upload));
  timelineCard.add(TimelineCard("Stage 3", "Approved", Icons.work));
  timelineCard
      .add(TimelineCard("Stage 4", "Allotment result out", Icons.check));
  return timelineCard;
}
