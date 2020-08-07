import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cricbubble/api/cric_api.dart';

const sampleMatch =
    "https://www.cricbuzz.com/live-cricket-scores/29058/eng-vs-wi-3rd-test-west-indies-tour-of-england-2020";

void main() {
  var matchID = CricbuzzAPI.getMatchIdfromURL(sampleMatch);
  CricbuzzAPI.getUpdates(matchID).then((value) => print(value));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cricbubble',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Cricbubble Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String profilePic = '1.jpg';
  static const String _channel = 'increment';
  static const String _emptyMessage = '';
  static const BasicMessageChannel<String> platform =
      BasicMessageChannel<String>(_channel, StringCodec());

  int _counter = 0;

  @override
  void initState() {
    super.initState();
    platform.setMessageHandler(_handlePlatformIncrement);
  }

  Future<String> _handlePlatformIncrement(String message) async {
    setState(() {
      _counter++;
    });
    return _emptyMessage;
  }

  void _sendFlutterIncrement() {
    platform.send('_pong');
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _sendFlutterIncrement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CricBubble",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: Colors.white,
              fontFamily: "Roboto"),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              padding: EdgeInsets.only(left: 16, top: 4, bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Color.fromRGBO(51, 51, 51, 1),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.search,
                    color: Color.fromRGBO(159, 159, 159, 1),
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(159, 159, 159, 1),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 85,
            margin: EdgeInsets.only(top: 8, bottom: 8, left: 16),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  width: 65,
                  margin: EdgeInsets.only(right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 60,
                            width: 60,
                            padding: EdgeInsets.all((index % 2 == 1) ? 2 : 0),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Color.fromRGBO(51, 51, 51, 1),
                                border: (index % 2 == 0)
                                    ? Border.all(width: 0)
                                    : Border.all(
                                        color: Color.fromRGBO(0, 132, 255, 1),
                                        width: 3)),
                            child: ClipOval(
                              child: (index == 0)
                                  ? IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        size: 30,
                                        color: Color.fromRGBO(195, 195, 195, 1),
                                      ),
                                      onPressed: () {},
                                    )
                                  : Image.asset(
                                      "assets/profile_pics/$profilePic"),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              height: (index != 0) ? 18 : 0,
                              width: 18,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9)),
                                  color: Colors.green,
                                  border: Border.all(
                                      color: Colors.black, width: 3)),
                            ),
                            bottom: 0,
                            right: 0,
                          )
                        ],
                      ),
                      Text(
                        "Your Story",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: (index % 2 == 1)
                                ? Colors.white
                                : Color.fromRGBO(123, 123, 123, 1)),
                      )
                    ],
                  ),
                );
              },
              itemCount: 8,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 8),
            height: 350,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.only(bottom: 10, right: 8),
                  leading: Stack(
                    children: <Widget>[
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                        child: ClipOval(
                          child: Image.asset("assets/profile_pics/$profilePic"),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          height: (index % 2 == 0) ? 18 : 0,
                          width: 18,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9)),
                              color: Colors.green,
                              border:
                                  Border.all(color: Colors.black, width: 3)),
                        ),
                        bottom: 0,
                        right: 0,
                      )
                    ],
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Text(
                      "Maaz Aftab",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  subtitle: Text(
                    "This is message of maaz aftab",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(123, 123, 123, 1)),
                  ),
                  trailing: Icon(
                    Icons.check_circle,
                    size: 20,
                    color: (index % 2 == 0)
                        ? Color.fromRGBO(101, 107, 115, 1)
                        : Colors.transparent,
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
