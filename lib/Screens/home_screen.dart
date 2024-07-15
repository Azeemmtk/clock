import 'package:alarm/clock_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/menuitems.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var datetime = DateTime.now();
    var formatedtime = DateFormat('HH:mm').format(datetime);
    var formateddate = DateFormat('EEE, d MMM').format(datetime);
    var timezone = datetime.timeZoneOffset.toString().split('.').first;
    var offsetsign = '';
    if (!timezone.startsWith('-')) offsetsign = '+';
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              menuitems(
                name: 'Clock',
                image: 'assets/images/clock_icon.png',
              ),
              SizedBox(
                height: 30,
              ),
              menuitems(image: 'assets/images/alarm_icon.png', name: 'Alarm'),
              SizedBox(
                height: 30,
              ),
              menuitems(image: 'assets/images/timer_icon.png', name: 'Timer'),
              SizedBox(
                height: 30,
              ),
              menuitems(
                  image: 'assets/images/stopwatch_icon.png', name: 'Stopwatch'),
            ],
          ),
          VerticalDivider(
            color: Colors.white54,
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Text(
                    'Clock',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        color: Colors.white,
                        fontSize: 24),
                  ),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Column(
                    children: [
                      Text(
                        formatedtime,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontFamily: 'avenir',
                        ),
                      ),
                      Text(
                        formateddate,
                        style: TextStyle(
                            fontFamily: 'avenir',
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Clockview(
                  size: MediaQuery.of(context).size.height / 3.3,
                ),
                Flexible(
                  flex: 5,
                  fit: FlexFit.tight,
                  child: Column(
                    children: [
                      Text(
                        'Timezone',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'avenir',
                            fontSize: 24),
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.globe,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'UTS' + offsetsign + timezone,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'avenir',
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
